# Michael Shershin
# 200-49-739
# CMPT 422L 111

  .text
main: .globl main
  li $v0, 4                               #call for print
  la $a0, prompt                          #bring up the data to be printed
  syscall                                 #print it
  
  li $v0, 9				  #get the heap
  li $a0, 256				  #set how many bytes are in the heap
  syscall
  
  bnez $v0, heapgood			  #branch if heap valid
  
  li $v0, 4
  la $a0, heaperror        		  #heap error message = bad heap
  syscall
  
  j exit				  #get to the exit
  
heapgood:
  move $s0, $v0				  #save heap address
  move $a0, $v0				  #read into heap address

  li $v0, 8                               #call for reading string
  li $a1, 256				  #set the length +1 of the read	
  syscall
  
  li $v0, 4                               #call for print
  la $a0, charprompt             	  #bring up data to be printed
  syscall                                 #print
  
  li $v0, 12				  #call for reading char
  syscall
  
  move $s1, $v0				  #save char
  
  move $a0, $s0				  #setting up string for strchr
  move $a1, $s1				  #setting up char for strchr
  jal strchr				  #call search function
  
  bnez $v0, charfound                     #return if character is found
  
  li $v0, 4                               #call for print
  la $a0, charerror                       #bring up the data to be printed
  syscall                                 #print it
  j exit
  
charfound:
  subu $s2, $v0, $s0			  #return from strchr minus start of string
  li $v0, 4                               #call for print
  la $a0, charinstring                    #bring up the data to be printed
  syscall                                 #print it
  
  move $a0, $s2				  #char location
  li $v0, 1				  #print int
  syscall
  
exit: li $v0, 10                          #exit
  syscall

##########################################
# strchr function
# $a0 = pointer to the string
# $a1 = character to find in string
# $v0 = return reg
# $sp = stack
# $ra = linkage 
##########################################
strchr:
  subu $sp, $sp 28    			  #push stack
  sw $ra, 16($sp)                         #save linkage reg
  sw $s0, 20($sp)			  #save work reg1
  sw $s1, 24($sp)			  #save work reg2
  li $v0, 0				  #set error return
  beqz $a0, return			  #get out if null string

  move $s0, $a0				  #save pointer to string
loop:
  lbu $s1, 0($s0)			  #get byte
  beqz $s1, return			  #return if char is not found
  beq $s1, $a1, found			  #if char is found jump
  addiu $s0, $s0, 1			  #bump pointer by one byte 
  j loop				  #jump back to loop
 
found:
  move $v0, $s0				  #set pointer to character
  
return:
  lw $ra, 16($sp)                         #restore linkage reg
  lw $s0, 20($sp)			  #restore work reg1
  lw $s1, 24($sp)			  #restore work reg2
  addu $sp, $sp, 28                       #pop stack
  jr $ra

  .data
prompt:       .asciiz "Please enter a string.\n"
charprompt:   .asciiz "Please enter a char to search for.\n"
heaperror:    .asciiz "No heap available.\n"
charerror:    .asciiz "\nChar was not found in the string.\n"
charinstring: .asciiz "\nThe char is loacated at "
