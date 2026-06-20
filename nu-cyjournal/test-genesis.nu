# Tests for the `[~]()` genesis convention in mod.nu. Run with nutest:
#   use ~/repos/nutest/nutest *; run-tests --path nu-cyjournal/test-genesis.nu
use std/assert
use std/testing *
use mod.nu *

# A single `[~]()` heading yields a bare-body particle (no frontmatter), its
# marker filled to the CID of its exact bytes, and that CID equals cid-v0.
@test
def "single genesis: bare body and correct cid" [] {
    let doc = "# Alpha [~]()\n\nFirst genesis body.\n"
    let sec = $doc | parse-sections | first
    assert equal $sec.cid "" "genesis section has empty cid"
    assert equal $sec.line 0 "heading on line 0"

    let bytes = $sec | build-particle
    assert equal $bytes "# Alpha\n\nFirst genesis body.\n" "bare body, single trailing newline"
    assert (not ($bytes | str starts-with "---")) "no frontmatter"

    let cid = $bytes | hash-particle
    assert equal $cid ($bytes | into binary | cid-v0) "hash-particle == cid-v0 of the bytes"
}

# Two `[~]()` headings: each gets its OWN particle and OWN filled link. This is
# the positional/line-index rewire — a naive document-wide str replace fails
# here because both `[~]()` markers are byte-identical.
@test
def "double genesis: positional rewire fills each link distinctly" [] {
    let doc = "# Alpha [~]()\n\nBody of alpha.\n\n# Beta [~]()\n\nBody of beta.\n"
    let cid_a = {cid: "" heading: "Alpha" body: "Body of alpha."} | build-particle | hash-particle
    let cid_b = {cid: "" heading: "Beta" body: "Body of beta."} | build-particle | hash-particle
    assert (($cid_a != $cid_b)) "two distinct genesis CIDs"

    let dir = mktemp --directory
    cd $dir
    mkdir particles
    ^git init --quiet
    ^git config user.email t@t
    ^git config user.name t
    "# seed\n" | save --raw journal.md
    ^git add -A
    ^git commit --quiet -m init
    $doc | save --force --raw journal.md

    let report = regenerate journal.md --ref (^git rev-parse HEAD | str trim)
    assert equal ($report | get heading) [Alpha Beta] "both genesis sections reported"

    let after = open --raw journal.md
    assert ($after | str contains $"# Alpha [~]\(particles/($cid_a).md\)") "Alpha link correct"
    assert ($after | str contains $"# Beta [~]\(particles/($cid_b).md\)") "Beta link correct"
    assert (not ($after | str contains "[~]()")) "no empty markers remain"

    assert equal (open --raw $"particles/($cid_a).md") "# Alpha\n\nBody of alpha.\n" "Alpha bare body"
    assert equal (open --raw $"particles/($cid_b).md") "# Beta\n\nBody of beta.\n" "Beta bare body"
}

# An existing `[~](particles/<cid>.md)` heading whose body is unchanged vs the
# ref is left untouched — no regeneration, journal byte-identical.
@test
def "existing unchanged particle is untouched" [] {
    let doc = "# Gamma [~](particles/QmExisting000000000000000000000000000000000000.md)\n\nUnchanged body.\n"
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    ^git init --quiet
    ^git config user.email t@t
    ^git config user.name t
    $doc | save --force --raw journal.md
    ^git add -A
    ^git commit --quiet -m init

    let report = regenerate journal.md --ref (^git rev-parse HEAD | str trim)
    assert ($report | is-empty) "nothing to regenerate"
    assert equal (open --raw journal.md) $doc "journal byte-identical"
}

# An empty plan (nothing to regenerate) is a no-op: a non-dry-run must not
# rewrite the file at all — its mtime stays put (minimal side effects).
@test
def "empty plan does not touch the file" [] {
    let doc = "# Gamma [~](particles/QmExisting000000000000000000000000000000000000.md)\n\nUnchanged body.\n"
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    ^git init --quiet
    ^git config user.email t@t
    ^git config user.name t
    $doc | save --force --raw journal.md
    ^git add -A
    ^git commit --quiet -m init

    let before = ls journal.md | get 0.modified
    sleep 1100ms
    regenerate journal.md --ref (^git rev-parse HEAD | str trim) | ignore
    let after = ls journal.md | get 0.modified
    assert equal $before $after "no write on empty plan"
}

# A heading `[~](...)` whose link is neither empty nor a particle path is an
# authoring mistake — parse-sections fails fast rather than skipping it.
@test
def "malformed marker raises" [] {
    let bad = "# Bad [~](http://example.com)\n\nbody\n"
    assert error { $bad | parse-sections }
}
