#!/bin/bash

print_hello_group() { echo hello ; }
print_hello_list() ( echo hello )
print_hello_group_on_multiline() {
    echo hello
}
print_hello_list_on_multiline() (
    echo hello
)

print_hello_group
print_hello_list
print_hello_group_on_multiline
print_hello_list_on_multiline