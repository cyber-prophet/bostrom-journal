# Tests for `verify` in mod.nu. Run with nutest:
#   use ~/repos/nutest/nutest *; run-tests --path nu-cyjournal/test-verify.nu
use std/assert
use std/testing *
use mod.nu *

# A marker whose particle file matches its CID reports no problems.
@test
def "matching particle is silent" [] {
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    let bytes = "# Alpha\n\nbody\n"
    let cid = $bytes | hash-particle
    $bytes | save --raw $"particles/($cid).md"
    $"# Alpha [~]\(particles/($cid).md\)\n\nbody\n" | save --raw journal.md

    assert equal (verify journal.md) [] "no problems reported"
}

# A particle file whose content no longer hashes to the CID in its own
# filename (hand-edited or corrupted) is reported, not silently trusted.
@test
def "corrupted particle is reported" [] {
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    let bytes = "# Alpha\n\nbody\n"
    let cid = $bytes | hash-particle
    "tampered" | save --raw $"particles/($cid).md"
    $"# Alpha [~]\(particles/($cid).md\)\n\nbody\n" | save --raw journal.md

    let report = verify journal.md
    assert equal ($report | length) 1 "one problem reported"
    assert equal $report.0.heading "Alpha"
    assert equal $report.0.cid $cid
    assert ($report.0.problem | str starts-with "content hashes to")
}

# A marker pointing at a particle file that was never written is reported as
# missing, not skipped.
@test
def "missing particle is reported" [] {
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    $"# Alpha [~]\(particles/QmMissing00000000000000000000000000000000000000.md\)\n\nbody\n" | save --raw journal.md

    let report = verify journal.md
    assert equal ($report | length) 1 "one problem reported"
    assert equal $report.0.problem "particle file missing"
}

# Genesis markers name no particle yet — verify skips them rather than
# reporting a false "missing".
@test
def "genesis marker is skipped" [] {
    let dir = mktemp --directory
    cd $dir
    mkdir particles
    "# Alpha [~]()\n\nbody\n" | save --raw journal.md

    assert equal (verify journal.md) [] "genesis section is not checked"
}
