#!/usr/bin/env nu

let default_length = 12
let result_count = 5

# generate 5 random string with a certain lenght
def main [args?] {
  let length = try { $args | into int } catch { $default_length }

  let items = 1..$result_count | reduce --fold [] { |_, acc|
    let s = random chars --length $length
    $acc | append { title: $s, arg: $s }
  }

  { items: $items } | to json
}
