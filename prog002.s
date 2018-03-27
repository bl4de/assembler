# exit2.s
# To compile it, type the following in shell
# as exit2.s -o exit2.o
# ld exit2.o -e _main -lc -o exit

.section __TEXT,__text
.globl _main
_main:
  # function start
    pushq %rbp
    movq %rsp, %rbp
    subq $4, %rsp      # reserve 4 bytes on stack
    movl $5, -4(%rbp)  # We usually use base register instead
                    # of stack pointer to access data
    addq $4, %rsp      # release the stack
    popq %rbp          # restore old %rbp
    retq               # function ends