#!/bin/bash

RID=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1) &&
    HASH=$(git -C ${HOME}/.password-store/ rev-parse HEAD) &&
    sed \
	-e "s#RID_VALUE#${RID}#" \
	-e "s#REPORT_VALUE#$(git describe --tags --long)#" \
	-e "s#HASH_VALUE#${HASH}#" \
	-e "s#LUKS_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/luks)#" \
	-e "s#PASSWORD_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic systems/outstandingsound/users/HITXNBTZDSYEJULQ)#" \
	-e "s#GPG_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic gpg/2016/2018)#" \
	-e "s#GMAIL_VALUE#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "wpassword-store.tex" passwords.tex &&
    echo ${HASH},${RID}, >> reports.csv &&
    pdflatex password-store.tex &&
    true
