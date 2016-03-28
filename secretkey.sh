#!/bin/bash

WORK_DIR=$(mktemp -d) &&
    echo ${WORK_DIR} &&
    gpg --export-secret-key DB3707F4 > ${WORK_DIR}/alpha &&
    gpg --export-secret-key 12C446BE > ${WORK_DIR}/beta &&
    gpg2 --export-secret-key 2D2D81DA > ${WORK_DIR}/gamma &&
    paperkey --secret-key=${WORK_DIR}/alpha --output=${WORK_DIR}/alpha.txt &&
    paperkey --secret-key=${WORK_DIR}/beta --output=${WORK_DIR}/beta.txt &&
    paperkey --secret-key=${WORK_DIR}/gamma --output=${WORK_DIR}/gamma.txt &&
    a2ps -4 -o ${WORK_DIR}/printout.txt ${WORK_DIR}/alpha.txt ${WORK_DIR}/beta.txt ${WORK_DIR}/gamma.txt &&
    true
