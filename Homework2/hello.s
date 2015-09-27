# Marist College
# CMPT 422
# Fall 2015
#
# Anthony Giorgio <Anthony.Giorgio@marist.edu>
#
# Hello world sample
#
# This program prints a string to the terminal,
# and then exits cleanly.
#

	.text
main:	.globl main
	li $v0, 4		# $system call code for print string
	la $a0, hello		# $address of string to print
	syscall			# print the string
exit:	li $v0, 10		# exit
	syscall

	.data
hello:	.asciiz "Hello, world!\n"
