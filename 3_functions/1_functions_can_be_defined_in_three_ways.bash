#!/bin/bash

function print_hello_1 { 
    echo hello 
}

function print_hello_2 () { 
    echo hello 
}

print_hello_3 () { 
    echo hello 
}

print_hello_1
print_hello_2
print_hello_3