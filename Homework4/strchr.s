# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4                               #call for print
  la $a0, prompt                          #bring up the data to be printed
  syscall                                 #print it

  li $v0, 8                               #call for reading string
  la $a0, string			  #
  li $a1, 256				  #load the string length
  syscall

  sw $a0, string                          #save the users input
  sw $a1, length			  #save the strings length

  beqz $a1, stringerror 
  
  
  li $v0, 4                               #call for print
  la $a0, charprompt                   	  #bring up data to be printed
  syscall                                 #print
  
  
  li $v0, 8				  #call for reading char
  la $a0, char
  li $a1, 1
  syscall
  
  sw $a0, char
  sw $a1, charlength
  
  beqz $a1, charerror
  
  
  lw $a0, string                          #load input
  li $s0, 0				  #loop control
  jal loopcheck

exit: li $v0, 10                          #exit
  syscall

##########################################

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
 
notfound:
 li $v0, 4
 la $v0, founditisnot
 syscall
 
 jal exit 
  
foundit:
 li $v0, 4
 la $v0, found
 syscall
 
 li $v0, 5
 syscall
 
loopcheck:
 
 
 

 jr $ra


  .data
prompt:       .asciiz "Please enter a string.\n"
charprompt:   .asciiz "Please enter a char to search for.\n"
string:       .word 4
char:         .word 4
length:       .word 4
charlength:   .word 4
newln:        .asciiz "\n"
error:        .asciiz "Value is too large, please run again but with a smaller number.\n"
run:          .asciiz "Running:\n"
errorstring:  .asciiz "Please enter a long enough string to check."
errorchar:    .asciiz "Please enter a char."
founditisnot: .asciiz "Found the char is not."
