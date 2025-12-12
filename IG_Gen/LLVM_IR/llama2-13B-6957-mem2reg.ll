; ModuleID = 'LLVM_IR/llama2-13B-6957.ll'
source_filename = "DATASETv2/llama2-13B-6957.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.error_t = type { ptr, i32 }

@.str = private unnamed_addr constant [13 x i8] c"Error %d: %s\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"The cat sat on the mat.\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"The dog chased the cat.\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"The elephant danced the tango.\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"The penguin wore a tutu.\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"UNEXPECTED_ERROR\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"Error: %s (%d)\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Operation successful.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_error(ptr noundef %0) #0 {
  %2 = alloca [256 x i8], align 16
  %3 = call i32 @rand() #3
  %4 = srem i32 %3, 100
  %5 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %6 = icmp eq i32 %4, 1
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %22

8:                                                ; preds = %1
  %9 = icmp eq i32 %4, 2
  br i1 %9, label %10, label %11

10:                                               ; preds = %8
  br label %20

11:                                               ; preds = %8
  %12 = icmp eq i32 %4, 3
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  br label %18

14:                                               ; preds = %11
  %15 = icmp eq i32 %4, 4
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, ptr @.str.4, ptr @.str.5
  br label %18

18:                                               ; preds = %14, %13
  %19 = phi ptr [ @.str.3, %13 ], [ %17, %14 ]
  br label %20

20:                                               ; preds = %18, %10
  %21 = phi ptr [ @.str.2, %10 ], [ %19, %18 ]
  br label %22

22:                                               ; preds = %20, %7
  %23 = phi ptr [ @.str.1, %7 ], [ %21, %20 ]
  %24 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %5, i64 noundef 256, ptr noundef @.str, i32 noundef %4, ptr noundef %23) #3
  %25 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %26 = getelementptr inbounds %struct.error_t, ptr %0, i32 0, i32 0
  store ptr %25, ptr %26, align 8
  %27 = getelementptr inbounds %struct.error_t, ptr %0, i32 0, i32 1
  store i32 %4, ptr %27, align 8
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.error_t, align 8
  %2 = call i32 @rand() #3
  %3 = srem i32 %2, 2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  call void @generate_error(ptr noundef %1)
  br label %6

6:                                                ; preds = %5, %0
  %7 = getelementptr inbounds %struct.error_t, ptr %1, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %6
  %11 = getelementptr inbounds %struct.error_t, ptr %1, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.error_t, ptr %1, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %12, i32 noundef %14)
  br label %18

16:                                               ; preds = %6
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %18

18:                                               ; preds = %16, %10
  ret i32 0
}

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
