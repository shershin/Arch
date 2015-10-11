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

  lw $a0, input                           #load input
  jal factoral                            #start factoral
                                          #return in $v0
  move $a0, $v0                           #move return into $a0
  li $v0, 1                               #call for print int
  syscall

  li $v0, 4                               #print new line
  la $a0, newln
  syscall

exit: li $v0, 10                          #exit
  syscall

##########################################
#factoral function
#prototype factoral(int i)
#input reg = $a0
#work reg = $s0
#return reg = $v0
#stack reg = $sp
#linkage reg = $ra
##########################################

factoral:
  subu $sp, $sp, 24                       #push stack
  sw $ra, 16($sp)                         #save linkage reg
  sw $s0, 20($sp)                         #save work reg
  li $v0, 1                               #set return reg = to 1
  li $s0, 1                               #set work reg = 1
  ble $a0, 1, skip                        #if input <= 1 then skip
  move $s0, $a0                           #put input into work reg
  subu $a0, $a0, 1                        #subtract input by one
  jal factoral
skip:
  mult $v0, $s0                           #multiply the return by the work reg
  mfhi $v0                                #move from hi into work reg
  beqz $v0, good                          #check to see if anything is in the hi reg
  li $v0, 4                               #call for print
  la $a0, error                           #bring up data to be printed
  syscall                                 #print
  li $v0, 10                              #exit
  syscall

good:
  mflo $v0                                #move from lo to work reg
  lw $s0, 20($sp)                         #restore work reg
  lw $ra, 16($sp)                         #restore linkage reg
  addu $sp, $sp, 24                       #pop stack
  jr $ra                                  #return


  .data
prompt: .asciiz "Please enter a number for the factoral to execute.\n"
input: .word 1
first: .word 4
sec: .word 4
newln: .asciiz "\n"
error: .asciiz "Value is too large, please run again but with a smaller number.\n"
run: .asciiz "Running:\n"
