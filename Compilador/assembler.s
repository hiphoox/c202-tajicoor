 .globl main
main:
  movl $2, %eax
  push %eax
  movl $14, %eax
  push %eax
  movl $5, %eax
  pop %ecx
  imul %ecx, %eax
  pop %ecx
  subl %ecx, %eax
  push %eax
  movl $4, %eax
  movl %eax,%ebx
  movl $4, %eax
  cdq
  idivl %ebx
  pop %ecx
  addl %ecx, %eax
  ret
