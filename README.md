# Intro

FizzBuzz implementation in x86 assembly.

Given an array from 0 to 15, sets:

- r8 if number is divisible by 5 - fizz
- r9 if number is divisible by 3 - buzz

If both r8 and r9 are set to 0b1, means number is divisible both by 5 and 3 - fizzbuzz.

For convienience current analyzed number is on register r10.

Set a breakpoint in the mainloop and check r10,r8 and r9 to check wether the number is fizz, buzz or fizzbuzz.

# References

- [fizzbuzz wikipedia](https://en.wikipedia.org/wiki/Fizz_buzz)
