; ModuleID = 'DATASETv2/llama2-13B-6957.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca [256 x i8], align 16
  store ptr %0, ptr %2, align 8
  %5 = call i32 @rand() #3
  %6 = srem i32 %5, 100
  store i32 %6, ptr %3, align 4
  %7 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  br label %29

12:                                               ; preds = %1
  %13 = load i32, ptr %3, align 4
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %27

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %25

20:                                               ; preds = %16
  %21 = load i32, ptr %3, align 4
  %22 = icmp eq i32 %21, 4
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, ptr @.str.4, ptr @.str.5
  br label %25

25:                                               ; preds = %20, %19
  %26 = phi ptr [ @.str.3, %19 ], [ %24, %20 ]
  br label %27

27:                                               ; preds = %25, %15
  %28 = phi ptr [ @.str.2, %15 ], [ %26, %25 ]
  br label %29

29:                                               ; preds = %27, %11
  %30 = phi ptr [ @.str.1, %11 ], [ %28, %27 ]
  %31 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %7, i64 noundef 256, ptr noundef @.str, i32 noundef %8, ptr noundef %30) #3
  %32 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.error_t, ptr %33, i32 0, i32 0
  store ptr %32, ptr %34, align 8
  %35 = load i32, ptr %3, align 4
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.error_t, ptr %36, i32 0, i32 1
  store i32 %35, ptr %37, align 8
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.error_t, align 8
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %4 = call i32 @rand() #3
  %5 = srem i32 %4, 2
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %0
  call void @generate_error(ptr noundef %2)
  br label %9

9:                                                ; preds = %8, %0
  %10 = getelementptr inbounds %struct.error_t, ptr %2, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.error_t, ptr %2, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.error_t, ptr %2, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %15, i32 noundef %17)
  br label %21

19:                                               ; preds = %9
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %21

21:                                               ; preds = %19, %13
  ret i32 0
}

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
