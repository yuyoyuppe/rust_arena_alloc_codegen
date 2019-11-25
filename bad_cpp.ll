; ModuleID = 'S:\rust_arena_alloc_codegen\bad_cpp.cpp'
source_filename = "S:\5Crust_arena_alloc_codegen\5Cbad_cpp.cpp"
target datalayout = "e-m:x-p:32:32-i64:64-f80:32-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc19.23.28107"

%struct.Big = type { [512 x i32] }

; Function Attrs: nounwind
define dso_local void @"?both_ok@@YAXPAUBig@@@Z"(%struct.Big* nocapture) local_unnamed_addr #0 {
  %2 = alloca %struct.Big, align 4
  %3 = bitcast %struct.Big* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 2048, i8* nonnull %3) #2
  br label %4

; <label>:4:                                      ; preds = %4, %1
  %5 = phi i32 [ 0, %1 ], [ %17, %4 ]
  %6 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %1 ], [ %18, %4 ]
  %7 = and <4 x i32> %6, <i32 1, i32 1, i32 1, i32 1>
  %8 = and <4 x i32> %6, <i32 1, i32 1, i32 1, i32 1>
  %9 = icmp eq <4 x i32> %7, zeroinitializer
  %10 = icmp eq <4 x i32> %8, zeroinitializer
  %11 = select <4 x i1> %9, <4 x i32> <i32 20, i32 20, i32 20, i32 20>, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %12 = select <4 x i1> %10, <4 x i32> <i32 20, i32 20, i32 20, i32 20>, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %13 = getelementptr inbounds %struct.Big, %struct.Big* %2, i32 0, i32 0, i32 %5
  %14 = bitcast i32* %13 to <4 x i32>*
  store <4 x i32> %11, <4 x i32>* %14, align 4, !tbaa !4
  %15 = getelementptr inbounds i32, i32* %13, i32 4
  %16 = bitcast i32* %15 to <4 x i32>*
  store <4 x i32> %12, <4 x i32>* %16, align 4, !tbaa !4
  %17 = add i32 %5, 8
  %18 = add <4 x i32> %6, <i32 8, i32 8, i32 8, i32 8>
  %19 = icmp eq i32 %17, 512
  br i1 %19, label %20, label %4, !llvm.loop !8

; <label>:20:                                     ; preds = %4
  %21 = bitcast %struct.Big* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %21, i8* nonnull align 4 %3, i32 2048, i1 false) #2
  call void @llvm.lifetime.end.p0i8(i64 2048, i8* nonnull %3) #2
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.linker.options = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!1 = !{i32 1, !"NumRegisterParameters", i32 0}
!2 = !{i32 1, !"wchar_size", i32 2}
!3 = !{!"clang version 8.0.1 (tags/RELEASE_801/final)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
