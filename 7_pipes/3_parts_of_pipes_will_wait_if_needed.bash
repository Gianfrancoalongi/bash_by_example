#!/bin/bash
echo "-" \
 | { read L ; echo "${L}_"; } \
 | { read L ; echo "${L}-"; } \
 | { read L ; echo "${L}_"; } \
 | { read L ; echo "${L}-"; } \
 | { read L ; echo "${L}_"; } \
 | { read L ; echo "${L}-"; } \
 | { read L ; echo "${L}_"; } \
 | { read L ; echo "${L}-"; } \
 | { read L ; echo "${L}_"; }
