#!/bin/bash

gcc code.c -o factorial

echo -e "~~ Testing Factorials ~~"

echo -n "Testing not-a-number - "

echo "no" | ./factorial > tmp

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