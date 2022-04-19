#!/bin/bash

out="$(awk 'NF' $1)"
echo -n "$out" > $1 
