; ModuleID = 'DATASETv2/falcon180b-18364.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @split_string(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %7 = call noalias ptr @malloc(i64 noundef 8000) #7
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = call ptr @strtok(ptr noundef %8, ptr noundef @.str) #8
  store ptr %9, ptr %6, align 8
  br label %10

10:                                               ; preds = %25, %1
  %11 = load ptr, ptr %6, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %27

13:                                               ; preds = %10
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds ptr, ptr %15, i64 %17
  store ptr %14, ptr %18, align 8
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  %21 = load i32, ptr %3, align 4
  %22 = icmp sge i32 %21, 1000
  br i1 %22, label %23, label %25

23:                                               ; preds = %13
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #9
  unreachable

25:                                               ; preds = %13
  %26 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #8
  store ptr %26, ptr %6, align 8
  br label %10, !llvm.loop !6

27:                                               ; preds = %10
  %28 = load ptr, ptr %5, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30
  store ptr null, ptr %31, align 8
  %32 = load ptr, ptr %5, align 8
  ret ptr %32
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @execute_command(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [1024 x i8], align 16
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds ptr, ptr %6, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  br label %79

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 0
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.2) #10
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %11
  call void @exit(i32 noundef 0) #9
  unreachable

18:                                               ; preds = %11
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 0
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.3) #10
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %40

24:                                               ; preds = %18
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 1
  %27 = load ptr, ptr %26, align 8
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %31

29:                                               ; preds = %24
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %39

31:                                               ; preds = %24
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds ptr, ptr %32, i64 1
  %34 = load ptr, ptr %33, align 8
  %35 = call i32 @chdir(ptr noundef %34) #8
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %31
  call void @perror(ptr noundef @.str.5) #11
  br label %38

38:                                               ; preds = %37, %31
  br label %39

39:                                               ; preds = %38, %29
  br label %78

40:                                               ; preds = %18
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 0
  %43 = load ptr, ptr %42, align 8
  %44 = call i32 @strcmp(ptr noundef %43, ptr noundef @.str.6) #10
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %55

46:                                               ; preds = %40
  %47 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %48 = call ptr @getcwd(ptr noundef %47, i64 noundef 1024) #8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %53

50:                                               ; preds = %46
  %51 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %51)
  br label %54

53:                                               ; preds = %46
  call void @perror(ptr noundef @.str.8) #11
  br label %54

54:                                               ; preds = %53, %50
  br label %77

55:                                               ; preds = %40
  %56 = call i32 @fork() #8
  store i32 %56, ptr %3, align 4
  %57 = load i32, ptr %3, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %68

59:                                               ; preds = %55
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds ptr, ptr %60, i64 0
  %62 = load ptr, ptr %61, align 8
  %63 = load ptr, ptr %2, align 8
  %64 = call i32 @execvp(ptr noundef %62, ptr noundef %63) #8
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %66, label %67

66:                                               ; preds = %59
  call void @perror(ptr noundef @.str.9) #11
  br label %67

67:                                               ; preds = %66, %59
  call void @exit(i32 noundef 1) #9
  unreachable

68:                                               ; preds = %55
  %69 = load i32, ptr %3, align 4
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %71, label %72

71:                                               ; preds = %68
  call void @perror(ptr noundef @.str.10) #11
  br label %75

72:                                               ; preds = %68
  %73 = load i32, ptr %3, align 4
  %74 = call i32 @waitpid(i32 noundef %73, ptr noundef %4, i32 noundef 0)
  br label %75

75:                                               ; preds = %72, %71
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76, %54
  br label %78

78:                                               ; preds = %77, %39
  br label %79

79:                                               ; preds = %10, %78
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @loop() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca ptr, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %4 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 1024, ptr noundef %5)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @exit(i32 noundef 1) #9
  unreachable

10:                                               ; preds = %0
  %11 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %12 = call ptr @split_string(ptr noundef %11)
  store ptr %12, ptr %2, align 8
  %13 = load ptr, ptr %2, align 8
  call void @execute_command(ptr noundef %13)
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @loop()
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
