define internal void @arena_memcpy::main() unnamed_addr #0 personality i32 (...)* @__CxxFrameHandler3 {
start:
%_7stackbytes = alloca [7 x i8], align 1
%_2033stackbytes = alloca [2033 x i8], align 1
%_10 = alloca [1 x { i8*, i8* }], align 8
%_3 = alloca %"core::fmt::Arguments"
%heap_big = tail call i8* @__rust_alloc(i64 2048, i64 1) #6, !noalias !5
%1 = icmp eq i8* %heap_big, null
br i1 %1, label %bb18.i.i.i.i.i, label %_ZN4core3ptr18real_drop_in_place17h85b804504ae712e4E.exit

bb18.i.i.i.i.i:                                   ; preds = %start
; call alloc::alloc::handle_alloc_error
tail call void @_ZN5alloc5alloc18handle_alloc_error17h04a906601738c862E(i64 2048, i64 1) #6, !noalias !5
unreachable

_ZN4core3ptr18real_drop_in_place17h85b804504ae712e4E.exit: ; preds = %start

%2 = bitcast %"core::fmt::Arguments"                              ; fmt-related
call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %2)       ; fmt-related
%3 = bitcast [1 x { i8*, i8* }]* %_10 to i8*                      ; fmt-related
call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3)       ; fmt-related

; get pointers to stack-allocated stuff
%_7stackbytesPTR = getelementptr inbounds [7 x i8], [7 x i8]* %_7stackbytes, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 7, i8* nonnull %_7stackbytesPTR)
%_2033stackbytesPTR = getelementptr inbounds [2033 x i8], [2033 x i8]* %_2033stackbytes, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 2033, i8* nonnull %_2033stackbytesPTR)

; memset stack-allocated stuff
call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %_7stackbytesPTR, i8 0, i64 7, i1 false)
call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %_2033stackbytesPTR, i8 0, i64 2033, i1 false)

; copy first 7 zeroed bytes from stack to heap 
call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %heap_big, i8* nonnull align 1 %_7stackbytesPTR, i64 7, i1 false) #6, !noalias !12

; copy 8-15 zeroed bytes to heap
%heapPTRplus7 = getelementptr inbounds i8, i8* %heap_big, i64 7
%heapPTRplus7u64 = bitcast i8* %heapPTRplus7 to i64*
store i64 0, i64* %heapPTRplus7u64, align 1, !noalias !12

; copy 16-2048 zeroed byes to heap
%heapPTRplus15 = getelementptr inbounds i8, i8* %heap_big, i64 15
call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %heapPTRplus15, i8* nonnull align 1 %_2033stackbytesPTR, i64 2033, i1 false) #6, !noalias !12
call void @llvm.lifetime.end.p0i8(i64 7, i8* nonnull %_7stackbytesPTR)
call void @llvm.lifetime.end.p0i8(i64 2033, i8* nonnull %_2033stackbytesPTR)

; println below
%7 = getelementptr inbounds i8, i8* %heap_big, i64 123
%8 = getelementptr inbounds [1 x { i8*, i8* }], [1 x { i8*, i8* }]* %_10, i64 0, i64 0, i32 0
store i8* %7, i8** %8, align 8
%9 = getelementptr inbounds [1 x { i8*, i8* }], [1 x { i8*, i8* }]* %_10, i64 0, i64 0, i32 1
store i8* bitcast (i1 (i8*, %"core::fmt::Formatter"*)* @"core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt"
%10 = bitcast %"core::fmt::Arguments"
store [0 x { [0 x i8]*, i64 }]* bitcast (<{ i8*, [8 x i8], i8*, [8 x i8] }>* @2 to [0 x { [0 x i8]*, i64 }]*), [0 x { [0 x i8]*, i64 }]** %10, align 8, !alias.scope !17, !noalias !20
%11 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64 2, i64* %11, align 8, !alias.scope !17, !noalias !20
%12 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64* null, i64** %12, align 8, !alias.scope !17, !noalias !20
%13 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
%14 = bitcast [0 x { i8*, i8* }]** %13 to [1 x { i8*, i8* }]**
store [1 x { i8*, i8* }]* %_10, [1 x { i8*, i8* }]** %14, align 8, !alias.scope !17, !noalias !20
%15 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64 1, i64* %15, align 8, !alias.scope !17, !noalias !20
; call std::io::stdio::_print
call void @_ZN3std2io5stdio6_print17he0f606e442ca2627E(%"core::fmt::Arguments"
call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %2)
call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3)
call void @__rust_dealloc(i8* nonnull %heap_big, i64 2048, i64 1) #6
ret void
}
