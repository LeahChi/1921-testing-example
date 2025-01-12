#!/bin/bash

gcc code.c -o factorial #compiling the file thats to be ran
# echo <- displays line of text
# -n <- NOT a new line, carry on on the same one
# grep <- searches for a specific pattern in files/input
# -q <- makes grep quiet, doesn't output the lines that match the pattern
# cat <- displays the contents of the tmp file (debugging purposes)
# ./factorial < test1.txt > tmp. <- giving ./factorial a file as an input

echo -e "~~ Testing Factorials ~~" 

echo -n "Testing not-a-number - "

echo "no" | ./factorial > tmp
# echo send the string "no" to the factorial program
# '|' redirects the output of echo ("no") to the input of ./factorial
# ./factorial executes the compiles program
# tmp redirects the output of the program to a file names tmp <- but why is this needed?

if grep -q "Error: No number entered" tmp;
then
    echo "PASS"
else
    echo "FAIL"
    cat tmp
fi

echo -n "Testing nothing - "
echo "" | ./factorial > tmp
if grep -q "Error: No number entered" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing really big - "
echo "100" | ./factorial > tmp
if grep -q "93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000" tmp;
# above is actually 10! - so just checking to see if the program can handle big numbers
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing negative - "
echo "-10" | ./factorial > tmp
if grep -q "Error" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing 1 - "
./factorial < test1.txt > tmp
# test1.txt is given as input
# the multiple lines in txt work as multiple diff. inputs typed into the terminal, one after the other

if grep -q "The factorial of 1 is 1" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing 0 - "
echo "0" | ./factorial > tmp
if grep -q "The factorial of 0 is 1" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing 3 - "
echo "3" | ./factorial > tmp
if grep -q "The factorial of 3 is 6" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

rm -f tmp factorial