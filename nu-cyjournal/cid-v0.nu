# Pure Nushell CID v0 computation for single-chunk data (< 256 KB).
# Reproduces: ipfs add --only-hash --quieter --cid-version=0 --raw-leaves=false --hash=sha2-256

const BASE58_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
const MAX_SINGLE_CHUNK = 262144

# Protobuf varint encoding
def varint []: int -> binary {
    mut n = $in
    mut out = 0x[]
    while $n >= 128 {
        let byte = ($n mod 128) | bits or 128
        $out = ($out | bytes add --end ($byte | into binary | bytes at 0..0))
        $n = $n // 128
    }
    $out | bytes add --end ($n | into binary | bytes at 0..0)
}

# Wrap content in UnixFS dag-pb protobuf (single-chunk leaf node, no links)
def unixfs-dag-pb []: binary -> binary {
    let content = $in
    let n = $content | bytes length
    if $n > $MAX_SINGLE_CHUNK {
        error make {msg: $"content exceeds single chunk: ($n) > ($MAX_SINGLE_CHUNK)"}
    }
    let nv = $n | varint
    # UnixFS Data: type=File(2), data=content (omitted when empty), filesize=n
    let data_field = if $n > 0 { 0x[12] | bytes add --end $nv | bytes add --end $content } else { 0x[] }
    let unixfs = (0x[08 02] | bytes add --end $data_field | bytes add --end 0x[18] | bytes add --end $nv)
    # dag-pb PBNode: data=unixfs
    let ulen = ($unixfs | bytes length) | varint
    0x[0a] | bytes add --end $ulen | bytes add --end $unixfs
}

# Base58btc encoding
def base58-encode []: binary -> string {
    let hex = $in | encode hex
    let pair_count = ($hex | str length) // 2
    let byte_list = (
        0..<$pair_count | each {|i|
            let s = $i * 2
            let hex_pair = $hex | str substring ($s)..<($s + 2)
            $"0x($hex_pair)" | into int
        }
    )
    let chars = $BASE58_ALPHABET | split chars
    let leading = $byte_list | take while { $in == 0 } | length
    mut nums = $byte_list
    mut digits = []
    while not ($nums | is-empty) {
        mut carry = 0
        mut quotient = []
        for b in $nums {
            let val = $carry * 256 + $b
            $quotient ++= [($val // 58)]
            $carry = $val mod 58
        }
        $digits = [$carry ...$digits]
        $nums = ($quotient | skip while { $in == 0 })
    }
    let ones = (0..<$leading | each { '1' } | str join)
    let encoded = ($digits | each {|d| $chars | get $d } | str join)
    $"($ones)($encoded)"
}

# Compute CID v0 from raw binary content in pure Nushell (must be ≤ 256 KB)
export def main []: binary -> string {
    let hash_bytes = $in | unixfs-dag-pb | hash sha256 | decode hex
    0x[1220] | bytes add --end $hash_bytes | base58-encode
}
