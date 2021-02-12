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
	
	
	jal count_subStr
	
	li $v0, 10
	syscall
	
	count_subStr:
		li $v0, 0 #int count = 0
		li $t0, 0 #int i = 0
		sub $t1, $a1, $a3 #strln - substrln
	loop:
		bge $t0, $t1, exit
		li $t2, 1 #match = true
		li $t3, 0
	innerLoop:
		bge $t3, $a3, dninner
		add $t4, $a0, $t0
		add $t4, $t4, $t3
		lb $t4, 0 ($t4)
		add $t5, $a2, $t3
		lb $t5, 0($t5)
		beq $t4, $t5, skip2
		li $t2, 0 #match = false
		j dninner
		add $t3, $t3, 1 #j++
		j innerLoop
	dninner:
		beq $t2, $0, skip2
		add $v0, $v0, 1
	skip2:
		add $t2, $t2, 1 #i++
		j loop
	exit:
		jr $ra
		
		