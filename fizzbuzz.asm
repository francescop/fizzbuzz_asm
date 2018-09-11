section .data

; define constants

EXIT_SUCCESS equ 0 ; successful operation
SYS_exit equ 60 ; call code for terminate 

; array of numbers 0..15
list dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

; lenght of array, will be passed as counter for the main loop
loopCounter dw 15

; will save the number in this word-size variable
currentNumber dw 0

section .text

; macro that accepts one argument, checks wether the currentNumber variable is divisible by the argument passed
%macro checkDivBy 1
  mov rdx, 0
  mov ax, word[currentNumber]
  mov bx, %1
  div bx ; divides ax by bx. dx = remainer
%endmacro

checkDivBy5:
  checkDivBy 5
  cmp dx, 0
  je assignDivisible5
  ret

checkDivBy3:
  checkDivBy 3
  cmp dx, 0
  je assignDivisible3
  ret

assignDivisible5:
  mov r8, 1
  ret

assignDivisible3:
  mov r9, 1
  ret
  
global _start
_start:
  mov cx, word [loopCounter] ; set the counter

; main loop
moduloLoop:

  ; get word value pointing to address of nth element of list + rcx deallocation
  ; since word sized variables are 2 bytes the counter will be multiplied by 2
  mov dx, word [list+rcx*2] 
  mov word[currentNumber], dx ; save evaluating number to currentNumber variable

  ; move current number to r10, sets other bits to zeroes - since r10 is a 64bit register
  movsx r10, word[currentNumber] 

  mov rdx, 0 ; reset rdx, prepare for division

  ; reset fizz (r8) and buzz (r9) registers
  mov r8, 0
  mov r9, 0

  call checkDivBy5
  call checkDivBy3

  loop moduloLoop ; loop until rcx = 0

; done, terminate program.
last:
  mov rax, SYS_exit ; Call code for exit
  mov rdi, EXIT_SUCCESS ; Exit program with success
  syscall
