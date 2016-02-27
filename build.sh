#!/bin/bash

LUKS=$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/luks) &&
    sed -e "s#LUKS_VALUE#${LUKS}#" -e "wpassword-store.tex" passwords.tex &&
    pdflatex password-store.tex &&
    true
