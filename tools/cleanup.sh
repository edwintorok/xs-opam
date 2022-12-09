#!/bin/sh
#
# list packages that are not required by packages in this repo
#
exec opam admin filter --dry-run --resolve=xs-toolstack --resolve upstream-extra-dummy --resolve opam-ed.0.3 --resolve ocaml-base-compiler.4.14.0 --resolve ocaml-system.4.14.0 --or --with-test
