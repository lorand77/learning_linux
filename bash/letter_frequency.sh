#!/bin/bash

fold -w 1 $1 | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | grep '[a-z]'
