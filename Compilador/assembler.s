 .globl main
main:
  movl $1, %eax
  push %eax
  movl $0, %eax
  pop %ecx
  cmpl %eax, %ecx
  movl $0, %eax
  seta %al
  cmpl $0, %eax
  je _orJump2
  movl $1, %eax
  jmp _orEnd2
_orJump2:
  movl $1, %eax
  push %eax
  movl $0, %eax
  pop %ecx
  cmpl %eax, %ecx
  movl $0, %eax
  setg %al
  cmpl $0, %eax
  movl $0, %eax
  setne %al
_orEnd2:
  ret
