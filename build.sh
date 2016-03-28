#!/bin/bash

pass generate test/extra/0 8 &&
pass generate test/extra/1 8 &&
pass generate test/extra/2 8 &&
pass generate test/extra/3 8 &&
pass generate test/extra/4 8 &&
pass generate test/extra/5 8 &&
pass generate test/extra/6 8 &&
pass generate test/extra/7 8 &&
pass generate test/extra/8 8 &&
pass generate test/extra/9 8 &&
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
	-e "s#EXTRA0#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/0)#" \
	-e "s#EXTRA1#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/1)#" \
	-e "s#EXTRA2#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/2)#" \
	-e "s#EXTRA3#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/3)#" \
	-e "s#EXTRA4#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/4)#" \
	-e "s#EXTRA5#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/5)#" \
	-e "s#EXTRA6#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/6)#" \
	-e "s#EXTRA7#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/7)#" \
	-e "s#EXTRA8#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/8)#" \
	-e "s#EXTRA9#$(${HOME}/projects/password-store/src/password-store.sh show --phonetic test/extra/9)#" \
	-e "wpassword-store.tex" passwords.tex &&
    echo ${HASH},${RID}, >> reports.csv &&
    pdflatex password-store.tex &&
    true
