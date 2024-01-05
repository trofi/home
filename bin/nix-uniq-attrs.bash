#!/usr/bin/env bash

# Get files names to resolve attributes path and deduplicate then
# using `.drvPath` attribute. The one with shortest attribute names is
# picked.

# Usage example:
#     $ nix-uniq-attrs.bash re2c re2c.out
#     re2c

quoted_args=( "$@" )
quoted_args=( "${quoted_args[@]/#/\"}" )
quoted_args=( "${quoted_args[@]/%/\"}" )

nix-instantiate --json --eval --strict --expr '
let np = import <nixpkgs> {};
in map (p:
    let
      ap = np.lib.splitString "." p;
      a = np.lib.attrByPath ap (throw "No ${p} found") np;
    in {
      p = p;
      drv = a.drvPath;
  }) [
    '"${quoted_args[*]}"'
  ]
' | jq --raw-output '
  group_by(.drv)|.[]|min_by(.p|length)|.p
'
