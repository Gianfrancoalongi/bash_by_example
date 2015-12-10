#!/bin/bash
TMPDIR=$(mktemp -d)
( cd ${TMPDIR} ; echo "in list pwd is $(pwd)" )
echo "outside list pwd is $(pwd)"
rm -r ${TMPDIR}