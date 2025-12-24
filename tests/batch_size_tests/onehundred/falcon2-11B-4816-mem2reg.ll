; ModuleID = 'LLVM_IR/falcon2-11B-4816.ll'
source_filename = "DATASETv2/falcon2-11B-4816.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8, ptr }

@.str = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.arr = private unnamed_addr constant [5 x i8] c"ABCD\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_node(i8 noundef signext %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 16) #5
  %3 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0
  store i8 %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 1
  store ptr null, ptr %4, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_linked_list(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %17, %2
  %.02 = phi ptr [ null, %2 ], [ %.13, %17 ]
  %.01 = phi ptr [ null, %2 ], [ %.1, %17 ]
  %.0 = phi i32 [ 0, %2 ], [ %18, %17 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = call ptr @create_node(i8 noundef signext %8)
  %10 = icmp eq ptr %.02, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %5
  br label %16

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %9, ptr %13, align 8
  %14 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  br label %16

16:                                               ; preds = %12, %11
  %.13 = phi ptr [ %9, %11 ], [ %.02, %12 ]
  %.1 = phi ptr [ %9, %11 ], [ %15, %12 ]
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

19:                                               ; preds = %3
  ret ptr %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_linked_list(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi ptr [ %0, %1 ], [ %10, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %6 = load i8, ptr %5, align 8
  %7 = sext i8 %6 to i32
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7)
  %9 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  br label %2, !llvm.loop !8

11:                                               ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.main.arr, i64 5, i1 false)
  %2 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i64 0
  %3 = call i64 @strlen(ptr noundef %2) #6
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i64 0
  %6 = call ptr @create_linked_list(ptr noundef %5, i32 noundef %4)
  call void @print_linked_list(ptr noundef %6)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
