#!/bin/bash
#
# list packages that are not required by packages in this repo

# with-test only looks at test dependencies of the packages listed on the
# cmdline, not everything recursively
# so find out recursive deps of xs-toolstack: we want to run tests for all of
# those (but we don't necessarily need to run the tests of packages pulled in
# only for testing - that is sometimes not all solvable with same versions)
set -euo pipefail
COMPILER=4.14.0
opam admin check --ignore-test-doc
# vhd-format-lwt would need io-page 2.4.0 which brings in a lot of other
# updates, which is being worked on separately
ALLDEPS=$(opam admin filter --verbose --dry-run --resolve=xs-toolstack | sed -n 2p | tr ' ' '\n' | grep -v vhd-format-lwt | tr '\n' ',')
exec opam admin filter --dry-run "--resolve=${ALLDEPS}" --resolve upstream-extra-dummy --resolve xenctrl.dummy --resolve opam-depext --resolve opam-ed.0.3 --resolve ocaml-base-compiler.${COMPILER} --resolve ocaml-system.${COMPILER} --or --with-test
