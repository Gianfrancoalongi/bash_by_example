#!/bin/bash

echo hello world how are you | rev > file.txt
echo file contains: $(< file.txt)
rm file.txt

echo hello world how are you >&2 | rev > file.txt
echo file contains: $(< file.txt)
rm file.txt

