 fn main() {
push    rsi
 sub     rsp, 96                            ; reserve 96 bytes on stack
     mov     ecx, 2048                      ; 1st arg: ecx = size
     mov     edx, 1                         ; 2st arg: edx = align
     call    __rust_alloc                   ; built-in default dynamic alloc
     test    rax, rax                       ; set ZF to 1 if rax == 0, aka we got nullptr
     je      .LBB4_1                        ; handle allocation error if present
 mov     rsi, rax                           ; rsi stores allocated ptr now
     mov     r8d, 2048                      ; 3rd arg: r8d = num 
     mov     rcx, rax                       ; 1st arg: ptr to set
     xor     edx, edx                       ; 2st arg: value = 0
     call    memset
; ommited println
     mov     edx, 2048
     mov     r8d, 1
     mov     rcx, rsi
     call    __rust_dealloc
 }
 nop
 add     rsp, 96
 pop     rsi
 ret
.LBB4_1:
     mov     ecx, 2048
     mov     edx, 1
     call    alloc::alloc::handle_alloc_error
     ud2