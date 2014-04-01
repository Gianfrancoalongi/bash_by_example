#!/bin/bash

a_function() {
    VAR=2
    echo "2. VAR is ${VAR}"
}

echo "1. VAR is ${VAR}"
a_function
echo "3. VAR is ${VAR}"
