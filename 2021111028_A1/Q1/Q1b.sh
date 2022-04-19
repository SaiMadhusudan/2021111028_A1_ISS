#!/bin/bash

sort $1 >> temp.txt
uniq temp.txt 

rm temp.txt