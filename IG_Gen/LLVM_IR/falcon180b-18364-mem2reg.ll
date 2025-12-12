; ModuleID = 'LLVM_IR/falcon180b-18364.ll'
source_filename = "DATASETv2/falcon180b-18364.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c" \09\0D\0A\07\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Too many arguments\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"No directory specified\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"chdir\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"pwd\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"getcwd\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"execvp\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"fork\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"> \00", align 1
@stdin = external global ptr, align 8
@.str.12 = private unnamed_addr constant [21 x i8] c"Error reading input\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @split_string(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 8000) #7
  %3 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #8
  br label %4

4:                                                ; preds = %13, %1
  %.01 = phi i32 [ 0, %1 ], [ %9, %13 ]
  %.0 = phi ptr [ %3, %1 ], [ %14, %13 ]
  %5 = icmp ne ptr %.0, null
  br i1 %5, label %6, label %15

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds ptr, ptr %2, i64 %7
  store ptr %.0, ptr %8, align 8
  %9 = add nsw i32 %.01, 1
  %10 = icmp sge i32 %9, 1000
  br i1 %10, label %11, label %13

11:                                               ; preds = %6
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #9
  unreachable

13:                                               ; preds = %6
  %14 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #8
  br label %4, !llvm.loop !6

15:                                               ; preds = %4
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds ptr, ptr %2, i64 %16
  store ptr null, ptr %17, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @execute_command(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [1024 x i8], align 16
  %4 = getelementptr inbounds ptr, ptr %0, i64 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %66

8:                                                ; preds = %1
  %9 = getelementptr inbounds ptr, ptr %0, i64 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef @.str.2) #10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %8
  call void @exit(i32 noundef 0) #9
  unreachable

14:                                               ; preds = %8
  %15 = getelementptr inbounds ptr, ptr %0, i64 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.3) #10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %33

19:                                               ; preds = %14
  %20 = getelementptr inbounds ptr, ptr %0, i64 1
  %21 = load ptr, ptr %20, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %25

23:                                               ; preds = %19
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %32

25:                                               ; preds = %19
  %26 = getelementptr inbounds ptr, ptr %0, i64 1
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 @chdir(ptr noundef %27) #8
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %25
  call void @perror(ptr noundef @.str.5) #11
  br label %31

31:                                               ; preds = %30, %25
  br label %32

32:                                               ; preds = %31, %23
  br label %65

33:                                               ; preds = %14
  %34 = getelementptr inbounds ptr, ptr %0, i64 0
  %35 = load ptr, ptr %34, align 8
  %36 = call i32 @strcmp(ptr noundef %35, ptr noundef @.str.6) #10
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %47

38:                                               ; preds = %33
  %39 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %40 = call ptr @getcwd(ptr noundef %39, i64 noundef 1024) #8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %45

42:                                               ; preds = %38
  %43 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %43)
  br label %46

45:                                               ; preds = %38
  call void @perror(ptr noundef @.str.8) #11
  br label %46

46:                                               ; preds = %45, %42
  br label %64

47:                                               ; preds = %33
  %48 = call i32 @fork() #8
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %57

50:                                               ; preds = %47
  %51 = getelementptr inbounds ptr, ptr %0, i64 0
  %52 = load ptr, ptr %51, align 8
  %53 = call i32 @execvp(ptr noundef %52, ptr noundef %0) #8
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %56

55:                                               ; preds = %50
  call void @perror(ptr noundef @.str.9) #11
  br label %56

56:                                               ; preds = %55, %50
  call void @exit(i32 noundef 1) #9
  unreachable

57:                                               ; preds = %47
  %58 = icmp slt i32 %48, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %57
  call void @perror(ptr noundef @.str.10) #11
  br label %62

60:                                               ; preds = %57
  %61 = call i32 @waitpid(i32 noundef %48, ptr noundef %2, i32 noundef 0)
  br label %62

62:                                               ; preds = %60, %59
  br label %63

63:                                               ; preds = %62
  br label %64

64:                                               ; preds = %63, %46
  br label %65

65:                                               ; preds = %64, %32
  br label %66

66:                                               ; preds = %65, %7
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
declare i32 @chdir(ptr noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #6

; Function Attrs: nounwind
declare ptr @getcwd(ptr noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i32 @fork() #2

; Function Attrs: nounwind
declare i32 @execvp(ptr noundef, ptr noundef) #2

declare i32 @waitpid(i32 noundef, ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @loop() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %3 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %3, i32 noundef 1024, ptr noundef %4)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @exit(i32 noundef 1) #9
  unreachable

9:                                                ; preds = %0
  %10 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %11 = call ptr @split_string(ptr noundef %10)
  call void @execute_command(ptr noundef %11)
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @loop()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { cold }

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
