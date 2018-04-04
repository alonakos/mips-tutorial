.data

# translate the c function into mips:
# int sumSquare (int x, int y) { return x * x + y; }
.data
  message1 : .asciiz "Enter x: "
  message2 : .asciiz "\nEnter y: "
.text
  .globl main

main:
  li $v0, 4
  la $a0, message1
  syscall

  li $v0, 5
  syscall
  move $a0, $v0

  addi $sp, $sp, -4
  sw $a0, 0 ($sp)

  li $v0, 4
  la $a0, message2
  syscall

  li $v0, 5
  syscall

  move $a1, $v0

  lw $a0, 0 ($sp)
  addi $sp, $sp, 4
  jal sumSquare

  li $v0, 1
  move $a0, $v1
  syscall

  li $v0, 10
  syscall

sumSquare:
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $a1, 0($sp)
  jal square
  
  lw $a1, 0($sp)
  add $v1, $v1, $a1
  lw $ra, 4($sp)
  addi $sp, $sp, 8 
  jr $ra

square:
  mul $a1, $a0, $a0
  add $v1, $zero, $a1

  jr $ra

