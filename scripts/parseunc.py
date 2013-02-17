#!/usr/bin/python

import sys
import string

input = open(sys.argv[1])
inpt = input.readlines()
number = ""
name = ""
for i in xrange(len(inpt)):
#    print(inpt[i])
#    print(set(inpt[i]) - set("<div class='vote-count'>"))
    if(inpt[i] == "<div class='vote-count'>\n"):
        i += 1;
        number = inpt[i]
        name = inpt[i+2]
        break
if(number != ""):
    number = int(number.split()[0])
    print(str(number) + ' ' + name);
