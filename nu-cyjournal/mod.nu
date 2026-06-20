# nu-cyjournal — git-style plumbing for Bostrom-Journal particles.
#
# A particle is the IPFS CID v0 of a markdown file's exact bytes. This module
# parses BostromJournal001.md into sections, rebuilds the particle for each
# section edited on this branch (vs `main`), and rewires its `[~]` link to the
# new CID. Composable plumbing: parse -> build body -> hash -> place/rewire.

export use cid-v0.nu

# Parse journal markdown into sections.
#
# A section starts at a heading line `^#{1,6} ... [~](particles/<cid>.md)` and
# runs to (not including) the next heading of any level. Headings without a
# `[~]` link have no previous particle and are skipped.
#
# Returns rows { cid, heading, body } where `cid` is the current particle CID
# from the `[~]` link, `heading` is the heading text with the link suffix
# removed, and `body` is the section text with leading/trailing blank lines
# stripped (otherwise byte-verbatim).
export def parse-sections []: string -> table {
    let lines = $in | lines
    let heading_idx = $lines | enumerate | where item =~ '^#{1,6} ' | get index
    let next_idx = $heading_idx | skip 1 | append ($lines | length)
    $heading_idx | zip $next_idx | each {|pair|
        let hi = $pair.0
        let ni = $pair.1
        let m = $lines | get $hi | parse --regex '^#{1,6} (?<heading>.*) \[~\]\(particles/(?<cid>[^)]+)\.md\)$'
        if ($m | is-empty) {
            null
        } else {
            let body_lines = if ($hi + 1) >= $ni { [] } else { $lines | slice ($hi + 1)..<$ni }
            { cid: $m.0.cid, heading: $m.0.heading, body: ($body_lines | strip-blank-edges) }
        }
    } | compact
}

# Drop leading and trailing blank lines from a list of lines, return as text.
def strip-blank-edges []: list<string> -> string {
    let lines = $in
    let nonblank = $lines | enumerate | where ($it.item | str trim) != "" | get index
    if ($nonblank | is-empty) {
        ""
    } else {
        $lines | slice ($nonblank | first)..($nonblank | last) | str join "\n"
    }
}

# Assemble a particle's exact file bytes for one section.
#
# `parent` carries the section's previous-version CID (a plain string). The body
# is the heading normalized to a single `#` (h1) with the `[~]` link removed,
# then the section text, then exactly one trailing newline. A heading-only
# section (empty body) yields just the `# heading` line.
export def build-particle []: record -> string {
    let sec = $in
    let head = $"---\nparent: ($sec.cid)\n---\n\n"
    let body = if ($sec.body | is-empty) {
        $"# ($sec.heading)\n"
    } else {
        $"# ($sec.heading)\n\n($sec.body)\n"
    }
    $head + $body
}

# CID v0 of a particle's text (its exact UTF-8 bytes).
export def hash-particle []: string -> string {
    $in | into binary | cid-v0
}

# Sections whose assembled particle body differs between `ref` and the working
# tree of `file`. Sections are matched across versions by their `[~]` CID
# (stable identity), so a renamed heading on the same CID is still tracked.
#
# Returns the current-working-tree section rows for the changed sections.
export def changed-sections [
    file: string  # journal path, e.g. BostromJournal001.md
    --ref: string = "main"  # git ref to diff against
]: nothing -> table {
    let old_secs = ^git show $"($ref):($file)" | parse-sections
    let new_secs = open --raw $file | parse-sections
    # Index old by cid -> assembled body, so identity survives heading renames.
    let old_body = $old_secs | reduce --fold {} {|s, acc| $acc | insert $s.cid ($s | build-particle) }
    $new_secs | where {|s| ($old_body | get --optional $s.cid) != ($s | build-particle) and ($old_body | get --optional $s.cid) != null }
}

# Regenerate particles for every section edited on this branch and rewire links.
#
# For each changed section: build the new particle, hash it to its CID, write
# `particles/<new-cid>.md`, and replace the `[~](particles/<old-cid>.md)` link
# in the journal with the new CID. Returns rows { heading, old_cid, new_cid }.
export def regenerate [
    file: string = "BostromJournal001.md"  # journal to regenerate
    --ref: string = "main"  # git ref to diff against
    --particles-dir: string = "particles"  # where particle files live
    --dry-run  # report what would change without writing
]: nothing -> table {
    let changed = changed-sections $file --ref $ref
    let plan = $changed | each {|s|
        let bytes = $s | build-particle
        { heading: $s.heading, old_cid: $s.cid, new_cid: ($bytes | hash-particle), bytes: $bytes }
    }
    if not $dry_run {
        # Write particle files.
        $plan | each {|p| $p.bytes | save --force --raw $"($particles_dir)/($p.new_cid).md" }
        # Rewire links in the journal, one exact substitution per section.
        let updated = $plan | reduce --fold (open --raw $file) {|p, doc|
            $doc | str replace $"[~]\(($particles_dir)/($p.old_cid).md\)" $"[~]\(($particles_dir)/($p.new_cid).md\)"
        }
        $updated | save --force --raw $file
    }
    $plan | select heading old_cid new_cid
}
