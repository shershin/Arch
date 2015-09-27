# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4 #call for print
  la $a0, prompt #bring up the data to be printed
  syscall  #print it
exit: li $v0, 10 #exit
  syscall

  .data
prompt: .asciiz "Please enter a number for how long you want the fibonacci sequence to run.\n"
