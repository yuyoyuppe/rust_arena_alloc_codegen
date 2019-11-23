define internal void @arena_memcpy::main() unnamed_addr #0 personality i32 (...)* @__CxxFrameHandler3 {
start:
%_13.i = alloca [1 x { i8*, i8* }], align 8 ; allocate array of 1 element of type {i8*, i8*} with 8 alignment
%_6.i = alloca %"core::fmt::Arguments" ; not important 
%0 = tail call i8* @__rust_alloc(i64 2048, i64 1) #6, !noalias !5 ;allocate stuff - can't be aliased by anything. stuff starting from '!' is metadata. what does !5 mean tho? seems like "named metadata which we can't see :<
%1 = icmp eq i8* %0, null ; check for allocation failure
br i1 %1, label %bb18.i.i.i.i.i.i, label %_ZN12arena_memcpy9optimized17h86c78fc139562718E.exit

bb18.i.i.i.i.i.i:                                 ; preds = %start
; call alloc::alloc::handle_alloc_error
tail call void @_ZN5alloc5alloc18handle_alloc_error17h04a906601738c862E(i64 2048, i64 1) #6, !noalias !5
unreachable

_ZN12arena_memcpy9optimized17h86c78fc139562718E.exit: ; preds = %start
; inline function ended!
call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %0, i8 0, i64 2048, i1 false) ; zero out our heap-allocated Big

; println below
%2 = bitcast %"core::fmt::Arguments"
call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %2) #6 ; start lifetimes of %2
%3 = bitcast [1 x { i8*, i8* }]* %_13.i to i8*                 
call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #6 ; start lifetimes of %3!
%4 = getelementptr inbounds i8, i8* %0, i64 123 ; get address of Big.storage[123]
%5 = getelementptr inbounds [1 x { i8*, i8* }], [1 x { i8*, i8* }]* %_13.i, i64 0, i64 0, i32 0
store i8* %4, i8** %5, align 8
%6 = getelementptr inbounds [1 x { i8*, i8* }], [1 x { i8*, i8* }]* %_13.i, i64 0, i64 0, i32 1
store i8* bitcast (i1 (i8*, %"core::fmt::Formatter"*)* @"core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt"
%7 = bitcast %"core::fmt::Arguments"
store [0 x { [0 x i8]*, i64 }]* bitcast (<{ i8*, [8 x i8], i8*, [8 x i8] }>* @2 to [0 x { [0 x i8]*, i64 }]*), [0 x { [0 x i8]*, i64 }]** %7, align 8, !alias.scope !12, !noalias !15
%8 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64 2, i64* %8, align 8, !alias.scope !12, !noalias !15
%9 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64* null, i64** %9, align 8, !alias.scope !12, !noalias !15
%10 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
%11 = bitcast [0 x { i8*, i8* }]** %10 to [1 x { i8*, i8* }]**
store [1 x { i8*, i8* }]* %_13.i, [1 x { i8*, i8* }]** %11, align 8, !alias.scope !12, !noalias !15
%12 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"
store i64 1, i64* %12, align 8, !alias.scope !12, !noalias !15
; call std::io::stdio::_print
call void @_ZN3std2io5stdio6_print17he0f606e442ca2627E(%"core::fmt::Arguments"
call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %2) #6
call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #6
call void @__rust_dealloc(i8* nonnull %0, i64 2048, i64 1) #6
ret void
}
