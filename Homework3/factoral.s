# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4                               #call for print
  la $a0, prompt                          #bring up the data to be printed
  syscall                                 #print it

  li $v0, 5                               #call for reading int
  syscall

  sw $v0, input                           #save the users input

  li $v0, 4                               #call for print
  la $a0, run                             #bring up data to be printed
  syscall                                 #print

                                          #init loop controls
  li $s1, 0                               #the changing input
  lw $s2, input                           #load input

loop:

  bge $s3, $s4, dspval
  lw $s0, xmin2
  lw $s1, xmin1
  add $a0, $s1, $s0
  sw $s1, xmin2
  sw $a0, xmin1
dspval:
  li $v0, 1                               #call for print int
  syscall
  li $v0, 4
  la $a0, newln
  syscall
  li $s5, 1                               #incerment value
  add $s2, $s5, $s2                       #add one to loop control
  bgtz $s5, loop                          #check to see if input is down to 0 if not repeat

exit: li $v0, 10 #exit
  syscall

  .data
prompt: .asciiz "Please enter a number for how long you want the fibonacci sequence to run.\n"
input: .word 1
first: .word 4
sec: .word 4
newln: .asciiz "\n"
multiply: .asciiz "x"
run: .asciiz "Running:\n"
