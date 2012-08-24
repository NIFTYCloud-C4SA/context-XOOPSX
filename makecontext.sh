#!/bin/bash

## XOOPS Xコンテクスト作成シェルスクリプト

BIN_CD="cd"
BIN_CURL="/usr/bin/curl -L"
BIN_GIT="/usr/bin/git"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_UNZIP="/usr/bin/unzip"
BIN_MKDIR="/bin/mkdir"

URL_REPO="https://github.com/XoopsX/legacy.git"
URL_ARCHIVE="https://github.com/NIFTYCloud-C4SA/context-XOOPSX/zipball/master"

## make context
${BIN_CD} ./contexts/krm/
${BIN_GIT} clone ${URL_REPO} ./xoopsx
${BIN_MV} ./xoopsx/* ./
${BIN_MV} ./html ./public_html
${BIN_RM} ./xoopsx
${BIN_MV} ./public_html/install/class/settingmanager.php ./public_html/install/class/settingmanager_org.php
${BIN_MV} ./settingmanager.php ./public_html/install/class/settingmanager.php

## create archive
${BIN_TAR} czpf ./web_root.tar.gz {public_html,xoops_trust_path,docs,extras,README.md}
${BIN_RM} ./{public_html,xoops_trust_path,docs,extras,README.md}
${BIN_CD} ../
${BIN_TAR} czpf ./krm.tar.gz ./krm/*

## end
