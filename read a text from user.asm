
.data
	inputFromUser: .space 100
	message: .asciiz "Hi, enter your text:\n"

.text
	main:
	
	  li $v0, 4
	  la $a0, message
	  syscall

  	  li $v0, 8
  	  li $a1, 100
  	  la $a0, inputFromUser
  	  syscall

  	  li $v0, 4
   	  li $t0, 0

	loop:
    	  lb $t1, inputFromUser($t0)
  	  beq $t1, 0, exit
  	  blt $t1, 'a', case
  	  bgt $t1, 'z', case
  	  sub $t1, $t1, 32
  	  sb $t1, inputFromUser($t0)

	case: 
  	  addi $t0, $t0, 1
 	   j loop

	exit:
  	  li $v0, 4
  	  la $a0, inputFromUser
  	  syscall

  	  li $v0, 10
  	  syscall
