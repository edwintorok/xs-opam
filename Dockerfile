FROM ocaml/opam2:ubuntu-18.04
MAINTAINER Marcello Seri <marcello.seri@citrix.com>

COPY . /xs-opam
RUN opam repo add xs-opam /xs-opam

RUN sudo apt-get update \
    && sudo apt-get install -y vim emacs

RUN opam update \
    && opam upgrade -y \
    && opam install merlin ocp-browser ocp-indent ocp-index depext user-setup utop -y \
    && opam user-setup install

