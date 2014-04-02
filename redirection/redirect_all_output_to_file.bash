#!/bin/bash

{ rm nonexistent ; echo hello world how are you? ; } &> file.txt
echo file contains: $(<file.txt)
rm file.txt