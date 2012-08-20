#!/bin/bash

## XOOPS Xコンテクスト作成シェルスクリプト

BIN_CURL="/usr/bin/curl -L"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_CD="cd"

#URL_ARCHIVE="http://sourceforge.jp/projects/xoopscube22x/downloads/55285/xoopsx-103-2.tar.gz"
URL_ARCHIVE="http://sourceforge.jp/frs/redir.php?m=osdn&f=%2Fxoopscube22x%2F55285%2Fxoopsx-103-2.tar.gz"

## make context
${BIN_CD} ./contexts/krm/
${BIN_CURL} -o ./xoopsx.tar.gz ${URL_ARCHIVE}
${BIN_TAR} zxvf ./xoopsx.tar.gz
${BIN_MV} html public_html
${BIN_MV} public_html/install/class/settingmanager.php public_html/install/class/settingmanager_org.php
${BIN_MV} settingmanager.php public_html/install/class/settingmanager.php
${BIN_RM} xoopsx.tar.gz

## create archive
${BIN_TAR} czpf ./web_root.tar.gz {public_html,xoops_trust_path,docs,extras}
${BIN_RM} ./{public_html,xoops_trust_path,docs,extras}
${BIN_CD} ../
${BIN_TAR} czpf ./krm.tar.gz ./krm/*

## end
