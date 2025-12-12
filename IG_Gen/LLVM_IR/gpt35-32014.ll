; ModuleID = 'DATASETv2/gpt35-32014.c'
source_filename = "DATASETv2/gpt35-32014.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"Starting Position: (%d, %d)\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"Movement %d: Moved %c, (%d, %d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Final Position: (%d, %d)\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @generateMovement() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  %3 = srem i32 %2, 4
  store i32 %3, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  ret i32 %4
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %10)
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %38, %0
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 25
  br i1 %14, label %15, label %41

15:                                               ; preds = %12
  %16 = call i32 @generateMovement()
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %6, align 4
  switch i32 %17, label %30 [
    i32 0, label %18
    i32 1, label %21
    i32 2, label %24
    i32 3, label %27
  ]

18:                                               ; preds = %15
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %2, align 4
  store i8 69, ptr %4, align 1
  br label %30

21:                                               ; preds = %15
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  store i8 78, ptr %4, align 1
  br label %30

24:                                               ; preds = %15
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, ptr %2, align 4
  store i8 87, ptr %4, align 1
  br label %30

27:                                               ; preds = %15
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, ptr %3, align 4
  store i8 83, ptr %4, align 1
  br label %30

30:                                               ; preds = %15, %27, %24, %21, %18
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  %33 = load i8, ptr %4, align 1
  %34 = sext i8 %33 to i32
  %35 = load i32, ptr %2, align 4
  %36 = load i32, ptr %3, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %32, i32 noundef %34, i32 noundef %35, i32 noundef %36)
  br label %38

38:                                               ; preds = %30
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %12, !llvm.loop !6

41:                                               ; preds = %12
  %42 = load i32, ptr %2, align 4
  %43 = load i32, ptr %3, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %42, i32 noundef %43)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
