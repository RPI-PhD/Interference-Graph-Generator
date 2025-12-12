; ModuleID = 'LLVM_IR/gemma7b-13550.ll'
source_filename = "DATASETv2/gemma7b-13550.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Index = type { [100 x i8], ptr, ptr }
%struct.Node = type { [100 x i8], ptr }

@.str = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Peter Pan\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @insertIndex(ptr noundef %1, ptr noundef @.str, ptr noundef null)
  call void @insertIndex(ptr noundef %1, ptr noundef @.str.1, ptr noundef null)
  call void @insertIndex(ptr noundef %1, ptr noundef @.str.2, ptr noundef null)
  %2 = load ptr, ptr %1, align 8
  br label %3

3:                                                ; preds = %5, %0
  %.0 = phi ptr [ %2, %0 ], [ %12, %5 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.Index, ptr %.0, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.Node, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [100 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %9)
  %11 = getelementptr inbounds %struct.Index, ptr %.0, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  br label %3, !llvm.loop !6

13:                                               ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertIndex(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 120) #4
  %5 = getelementptr inbounds %struct.Index, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef %1) #5
  %8 = getelementptr inbounds %struct.Index, ptr %4, i32 0, i32 1
  store ptr %2, ptr %8, align 8
  %9 = getelementptr inbounds %struct.Index, ptr %4, i32 0, i32 2
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %0, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store ptr %4, ptr %0, align 8
  br label %24

13:                                               ; preds = %3
  %14 = load ptr, ptr %0, align 8
  br label %15

15:                                               ; preds = %19, %13
  %.0 = phi ptr [ %14, %13 ], [ %21, %19 ]
  %16 = getelementptr inbounds %struct.Index, ptr %.0, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %22

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.Index, ptr %.0, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  br label %15, !llvm.loop !8

22:                                               ; preds = %15
  %23 = getelementptr inbounds %struct.Index, ptr %.0, i32 0, i32 2
  store ptr %4, ptr %23, align 8
  br label %24

24:                                               ; preds = %22, %12
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
