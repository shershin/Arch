# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4 #call for print
  la $a0, prompt #bring up the data to be printed
  syscall  #print it

  li $v0, 5 #call for reading int
  syscall

  sw $v0, input #save the users input

  li $v0, 4
  la $a0, run
  syscall

  #init sequence
  li $s0, 0
  li $s1, 1
  sw $s0, xmin2
  sw $s1, xmin1

  #init loop controls
  li $s2, 0 #loop control
  lw $s3, input #load input

loop:
  li $a0, 0 #first number in the seq
  li $s4, 0 #input = 1
  ble $s2, $s4, dspval
  li $a0, 1 #second number in the seq
  li $s4, 1 #input = 2
  ble $s2, $s4, dspval
  lw $s0, xmin2
  lw $s1, xmin1
  add $a0, $s1, $s0
  sw $s1, xmin2
  sw $a0, xmin1
dspval:
  li $v0, 1 #call for print int
  syscall
  li $v0, 4
  la $a0, newln
  syscall
  li $s5, 1 #incerment value
  add $s2, $s5, $s2 #add one to loop control
  lw $s3, input #load input
  ble $s2, $s3, loop

exit: li $v0, 10 #exit
  syscall

  .data
prompt: .asciiz "Please enter a number for how long you want the fibonacci sequence to run.\n"
input: .word 1
xmin1: .word 4
xmin2: .word 4
newln: .asciiz "\n"
run: .asciiz "Running:\n"
