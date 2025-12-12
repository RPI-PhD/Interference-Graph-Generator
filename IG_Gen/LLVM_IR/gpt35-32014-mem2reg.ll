; ModuleID = 'LLVM_IR/gpt35-32014.ll'
source_filename = "DATASETv2/gpt35-32014.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"Starting Position: (%d, %d)\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"Movement %d: Moved %c, (%d, %d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Final Position: (%d, %d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @generateMovement() #0 {
  %1 = call i32 @rand() #3
  %2 = srem i32 %1, 4
  ret i32 %2
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 0, i32 noundef 0)
  br label %4

4:                                                ; preds = %20, %0
  %.04 = phi i8 [ undef, %0 ], [ %.15, %20 ]
  %.02 = phi i32 [ 0, %0 ], [ %.13, %20 ]
  %.01 = phi i32 [ 0, %0 ], [ %.1, %20 ]
  %.0 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %5 = icmp slt i32 %.0, 25
  br i1 %5, label %6, label %22

6:                                                ; preds = %4
  %7 = call i32 @generateMovement()
  switch i32 %7, label %16 [
    i32 0, label %8
    i32 1, label %10
    i32 2, label %12
    i32 3, label %14
  ]

8:                                                ; preds = %6
  %9 = add nsw i32 %.01, 1
  br label %16

10:                                               ; preds = %6
  %11 = add nsw i32 %.02, 1
  br label %16

12:                                               ; preds = %6
  %13 = add nsw i32 %.01, -1
  br label %16

14:                                               ; preds = %6
  %15 = add nsw i32 %.02, -1
  br label %16

16:                                               ; preds = %14, %12, %10, %8, %6
  %.15 = phi i8 [ %.04, %6 ], [ 83, %14 ], [ 87, %12 ], [ 78, %10 ], [ 69, %8 ]
  %.13 = phi i32 [ %.02, %6 ], [ %15, %14 ], [ %.02, %12 ], [ %11, %10 ], [ %.02, %8 ]
  %.1 = phi i32 [ %.01, %6 ], [ %.01, %14 ], [ %13, %12 ], [ %.01, %10 ], [ %9, %8 ]
  %17 = add nsw i32 %.0, 1
  %18 = sext i8 %.15 to i32
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %17, i32 noundef %18, i32 noundef %.1, i32 noundef %.13)
  br label %20

20:                                               ; preds = %16
  %21 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

22:                                               ; preds = %4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %.01, i32 noundef %.02)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
