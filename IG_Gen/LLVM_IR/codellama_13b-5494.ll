; ModuleID = 'DATASETv2/codellama_13b-5494.c'
source_filename = "DATASETv2/codellama_13b-5494.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Error = type { i32, [100 x i8] }

@.str = private unnamed_addr constant [20 x i8] c"No error occurred.\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"An unknown error occurred.\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Invalid argument.\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"File not found.\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"Memory allocation failed.\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"File write failed.\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Unknown error code: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"No error occurred.\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_error(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = call noalias ptr @malloc(i64 noundef 104) #4
  store ptr %6, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.Error, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.Error, ptr %10, i32 0, i32 1
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = load ptr, ptr %4, align 8
  %14 = call ptr @strncpy(ptr noundef %12, ptr noundef %13, i64 noundef 100) #5
  %15 = load ptr, ptr %5, align 8
  ret ptr %15
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @handle_error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %29

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Error, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  switch i32 %9, label %22 [
    i32 0, label %10
    i32 1, label %12
    i32 2, label %14
    i32 3, label %16
    i32 4, label %18
    i32 5, label %20
  ]

10:                                               ; preds = %6
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %27

12:                                               ; preds = %6
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %27

14:                                               ; preds = %6
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %27

16:                                               ; preds = %6
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %27

18:                                               ; preds = %6
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %27

20:                                               ; preds = %6
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %27

22:                                               ; preds = %6
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.Error, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %25)
  br label %27

27:                                               ; preds = %22, %20, %18, %16, %14, %12, %10
  %28 = load ptr, ptr %2, align 8
  call void @free_error(ptr noundef %28)
  br label %29

29:                                               ; preds = %27, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @create_error(i32 noundef 0, ptr noundef @.str.7)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @handle_error(ptr noundef %4)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
