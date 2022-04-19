#!/bin/bash

function  size_c()
{
    wc -c $1 | awk '{print $1}'
}

declare -a line
line=$(size_c $1)
echo "${line[0]}"