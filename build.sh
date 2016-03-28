#!/bin/bash

pass generate test/extra/0 16 &&
pass generate test/extra/1 16 &&
pass generate test/extra/2 16 &&
pass generate test/extra/3 16 &&
pass generate test/extra/4 16 &&
pass generate test/extra/5 16 &&
pass generate test/extra/6 16 &&
pass generate test/extra/7 16 &&
pass generate test/extra/8 16 &&
pass generate test/extra/9 16 &&
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
	-e "s#EXTRA0#$(${EXTRA0}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA1#$(${EXTRA1}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA2#$(${EXTRA2}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA3#$(${EXTRA3}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA4#$(${EXTRA4}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA5#$(${EXTRA5}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA6#$(${EXTRA6}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA7#$(${EXTRA7}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA8#$(${EXTRA8}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "s#EXTRA9#$(${EXTRA9}/projects/password-store/src/password-store.sh show --phonetic public/google/passphrase)#" \
	-e "wpassword-store.tex" passwords.tex &&
    echo ${HASH},${RID}, >> reports.csv &&
    pdflatex password-store.tex &&
    true
