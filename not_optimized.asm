 fn main() {
 push    rsi
 push    rdi
 sub     rsp, 2088                  ; reserve 2048+40 bytes on stack :<
     mov     ecx, 2048
     mov     edx, 1
     call    __rust_alloc
     test    rax, rax
     je      .LBB4_1 
 mov     rsi, rax ; same as optimized
     ; inlined
     self.alloc_fast_path(value) (github.com-1ecc6299db9ec823\typed-arena-1.7.0\src\lib.rs:185)
     mov     dword, ptr, [rsp, +, 32], 0 ; ((i32*)rsp+33) = 0 zero first 4 bytes of Big
     mov     dword, ptr, [rsp, +, 35], 0 ; ((i32*)rsp+35) = 0 zero 4,5,6 and 7 byte of Big
     lea     rdi, [rsp, +, 48]           ; rdi = &Big + 15b on stack
     mov     r8d, 2033                  
     mov     rcx, rdi
     xor     edx, edx
     call    memset ; zeroes &Big+15 to end on the stack
     mov     eax, dword, ptr, [rsp, +, 32] ; eax = 0
     mov     ecx, dword, ptr, [rsp, +, 35] ; ecx = 0
     mov     dword, ptr, [rsi], eax        ; zeroes first 4 bytes(0,1,2,3) of heap-allocated Big
     mov     dword, ptr, [rsi, +, 3], ecx  ; zeroes (3,4,5,6) byes
     mov     qword, ptr, [rsi, +, 7], 0    ; zeroes (7,8,9,10,11,12,13,14) bytes
     lea     rcx, [rsi, +, 15] ; memcpy dst &Big + 15b offset
     mov     r8d, 2033         ; memcpy num
     mov     rdx, rdi          ; memcpy src
     call    memcpy            ; copyies Big from stack to heap. why split 2033 and 15 bytes tho?
     ; ommited println (prints using heap)
     mov     edx, 2048
     mov     r8d, 1
     mov     rcx, rsi
     call    __rust_dealloc
 }
 nop
 add     rsp, 2088
 pop     rdi
 pop     rsi
 ret
.LBB4_1:
     mov     ecx, 2048
     mov     edx, 1
     call    alloc::alloc::handle_alloc_error
     ud2     