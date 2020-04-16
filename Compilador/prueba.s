	.globl	main
	.type	main, @function
main:
    movl    $5, %eax
    movl    %eax, %ebx
	movl	$10, %eax
    cdq
    idivl    %ebx
    ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

