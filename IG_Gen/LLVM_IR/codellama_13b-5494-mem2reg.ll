; ModuleID = 'LLVM_IR/codellama_13b-5494.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_error(i32 noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 104) #4
  %4 = getelementptr inbounds %struct.Error, ptr %3, i32 0, i32 0
  store i32 %0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.Error, ptr %3, i32 0, i32 1
  %6 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strncpy(ptr noundef %6, ptr noundef %1, i64 noundef 100) #5
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_error(ptr noundef %0) #0 {
  call void @free(ptr noundef %0) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @handle_error(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %24

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.Error, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  switch i32 %6, label %19 [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %11
    i32 3, label %13
    i32 4, label %15
    i32 5, label %17
  ]

7:                                                ; preds = %4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %23

9:                                                ; preds = %4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %23

11:                                               ; preds = %4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %23

13:                                               ; preds = %4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %23

15:                                               ; preds = %4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %23

17:                                               ; preds = %4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %23

19:                                               ; preds = %4
  %20 = getelementptr inbounds %struct.Error, ptr %0, i32 0, i32 0
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %21)
  br label %23

23:                                               ; preds = %19, %17, %15, %13, %11, %9, %7
  call void @free_error(ptr noundef %0)
  br label %24

24:                                               ; preds = %23, %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_error(i32 noundef 0, ptr noundef @.str.7)
  call void @handle_error(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
