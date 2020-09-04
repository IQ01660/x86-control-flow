; ------------------------------------------------------------------------------
; Uses some basic control flow
;
;     $ nasm -felf64 -gdwarf conditional.asm
;     $ ld -o conditional conditional.o
;     $ ./conditional
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
    global    _start
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
    section   .text	              ; The start of the code portion of the program.
	
_start:				              ; Labels the entry point to the program.
	
        mov       rax, 5              ; x = 5
        mov       rbx, 3              ; y = 3
        mov       rcx, 0              ; z = 0
        cmp       rax, rbx            ; x vs. y
        jge       else                ; if >=, then jump to else
        inc       rcx                 ; z = z + 1
        jmp       after               ; skip else
   else:dec       rcx                 ; z--
  after:imul      rcx, 2

        ; printing the value of z
        mov       rax, 1              ; rax gets the system call code for "write".
        mov       rdi, 1              ; rdi gets the file handle for stdout (console).
        mov       rsi, rcx      ; rsi gets the the z (rcx)
        mov       rdx, 1             ; rdx gets the number of bytes to write.
        syscall    

        
        mov       rax, 60             ; rax gets the system call code for "exit"
        sub       rdi, rdi            ; rdi = rdi - rdi = 0
                                    ; or the exit code for "normal process end".
        syscall			              ; Call kernel, ending the process.
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
    section   .data		      ; The start of the data portion of the program.


; ------------------------------------------------------------------------------
