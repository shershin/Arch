# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4                               #call for print
  la $a0, prompt                          #bring up the data to be printed
  syscall                                 #print it

  li $a0, 8                               #call for reading string
  syscall

  sw $a0, string                          #save the users input
  sw $a1, length			  #save the strings length

  beqz $a1, stringerror 
  li $v0, 4                               #call for print
  la $a0, string                     #bring up data to be printed
  syscall                                 #print
  
  li $a0, 8				  #call for reading char
  syscall
  
  sw $a0, char
  sw $a1, charlength
  
  sw $v0, char				  #save the character to look for
  
  lw $a0, string                          #load input
  li $s0, 0				  #loop control
  
  
                                          #return in $v0
  #move $a0, $v0                           #move return into $a0
  #li $v0, 1                               #call for print int
  #syscall

  #li $v0, 4                               #print new line
  #la $a0, newln
  #syscall

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
stringerror:
 li $v0, 4
 la $v0, errorstring
 syscall
 
 jal exit
 
charerror:
 li $v0, 4
 la $v0, errorchar
 syscall
 
 jal exit
 
loopcheck:
 
 
 

 jr $ra


  .data
prompt:     .asciiz "Please enter a string.\n"
charprompt: .asciiz "Please enter a char to search for.\n"
string:     .word 4
char:       .word 4
length:     .word 4
charlength: .word 4
newln:      .asciiz "\n"
error:      .asciiz "Value is too large, please run again but with a smaller number.\n"
run:        .asciiz "Running:\n"
errorstring: .asciiz "Please enter a long enough string to check."
errorchar: .asciiz "Please enter a char."
