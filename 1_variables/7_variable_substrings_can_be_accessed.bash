#!/bin/bash
VAR="this text is for training purposes only"
echo ${VAR:10}
echo ${VAR:10:6}
echo ${VAR:(-14)}