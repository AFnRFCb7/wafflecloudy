#!/bin/bash

LUKS=$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/luks) &&
    sed \
	-e "s#HASH_VALUE#$(git -C ~/.password-store/ rev-parse HEAD)#" \
	-e "s#LUKS_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/luks)#" \
	-e "s#PASSWORD_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/users/HITXNBTZDSYEJULQ)#" \
	-e "s#GPG_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic gpg/2016/2018)#" \
	-e "s#GMAIL_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "wpassword-store.tex" passwords.tex &&
    pdflatex password-store.tex &&
    true
