; ModuleID = 'DATASETv2/llama2-13B-13345.c'
source_filename = "DATASETv2/llama2-13B-13345.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.game_state = type { i32, i32, [10 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"Game Over!\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Level %d (%d guesses)\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Password: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"Welcome to the Cryptographic Puzzle Game!\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"Choose a level or type 'q' to quit:\0A\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Enter a number (1-3) or 'q' to quit: \00", align 1
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_password(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %16, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 10
  br i1 %6, label %7, label %19

7:                                                ; preds = %4
  %8 = call i32 @rand() #3
  %9 = srem i32 %8, 26
  %10 = add nsw i32 97, %9
  %11 = trunc i32 %10 to i8
  %12 = load ptr, ptr %2, align 8
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, ptr %12, i64 %14
  store i8 %11, ptr %15, align 1
  br label %16

16:                                               ; preds = %7
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %4, !llvm.loop !6

19:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_guess(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %26, %2
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %29

10:                                               ; preds = %7
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, ptr %11, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp ne i32 %16, %22
  br i1 %23, label %24, label %25

24:                                               ; preds = %10
  store i32 0, ptr %3, align 4
  br label %30

25:                                               ; preds = %10
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %6, align 4
  br label %7, !llvm.loop !8

29:                                               ; preds = %7
  store i32 1, ptr %3, align 4
  br label %30

30:                                               ; preds = %29, %24
  %31 = load i32, ptr %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @game_over(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.game_state, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.game_state, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6, i32 noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.game_state, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %13)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @game_menu(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.game_state, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.game_state, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6, i32 noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.game_state, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @handle_input(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %81, %2
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %84

9:                                                ; preds = %6
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %10, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 49
  br i1 %16, label %17, label %31

17:                                               ; preds = %9
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.game_state, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %19, align 4
  %22 = load i32, ptr %5, align 4
  %23 = srem i32 %22, 26
  %24 = add nsw i32 97, %23
  %25 = trunc i32 %24 to i8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.game_state, ptr %26, i32 0, i32 2
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [10 x i8], ptr %27, i64 0, i64 %29
  store i8 %25, ptr %30, align 1
  br label %80

31:                                               ; preds = %9
  %32 = load ptr, ptr %4, align 8
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, ptr %32, i64 %34
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 50
  br i1 %38, label %39, label %54

39:                                               ; preds = %31
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds %struct.game_state, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = add nsw i32 %42, -1
  store i32 %43, ptr %41, align 4
  %44 = load i32, ptr %5, align 4
  %45 = srem i32 %44, 26
  %46 = add nsw i32 %45, 26
  %47 = add nsw i32 97, %46
  %48 = trunc i32 %47 to i8
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.game_state, ptr %49, i32 0, i32 2
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x i8], ptr %50, i64 0, i64 %52
  store i8 %48, ptr %53, align 1
  br label %79

54:                                               ; preds = %31
  %55 = load ptr, ptr %4, align 8
  %56 = load i32, ptr %5, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, ptr %55, i64 %57
  %59 = load i8, ptr %58, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp eq i32 %60, 51
  br i1 %61, label %62, label %77

62:                                               ; preds = %54
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.game_state, ptr %63, i32 0, i32 1
  %65 = load i32, ptr %64, align 4
  %66 = add nsw i32 %65, -1
  store i32 %66, ptr %64, align 4
  %67 = load i32, ptr %5, align 4
  %68 = srem i32 %67, 26
  %69 = add nsw i32 %68, 52
  %70 = add nsw i32 97, %69
  %71 = trunc i32 %70 to i8
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds %struct.game_state, ptr %72, i32 0, i32 2
  %74 = load i32, ptr %5, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [10 x i8], ptr %73, i64 0, i64 %75
  store i8 %71, ptr %76, align 1
  br label %78

77:                                               ; preds = %54
  br label %84

78:                                               ; preds = %62
  br label %79

79:                                               ; preds = %78, %39
  br label %80

80:                                               ; preds = %79, %17
  br label %81

81:                                               ; preds = %80
  %82 = load i32, ptr %5, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %5, align 4
  br label %6, !llvm.loop !9

84:                                               ; preds = %77, %6
  %85 = load ptr, ptr %3, align 8
  %86 = getelementptr inbounds %struct.game_state, ptr %85, i32 0, i32 1
  %87 = load i32, ptr %86, align 4
  %88 = icmp sle i32 %87, 0
  br i1 %88, label %89, label %91

89:                                               ; preds = %84
  %90 = load ptr, ptr %3, align 8
  call void @game_over(ptr noundef %90)
  br label %91

91:                                               ; preds = %89, %84
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.game_state, align 4
  %3 = alloca [10 x i8], align 1
  store i32 0, ptr %1, align 4
  %4 = call i64 @time(ptr noundef null) #3
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #3
  %6 = getelementptr inbounds %struct.game_state, ptr %2, i32 0, i32 0
  store i32 1, ptr %6, align 4
  %7 = getelementptr inbounds %struct.game_state, ptr %2, i32 0, i32 1
  store i32 5, ptr %7, align 4
  %8 = getelementptr inbounds %struct.game_state, ptr %2, i32 0, i32 2
  %9 = getelementptr inbounds [10 x i8], ptr %8, i64 0, i64 0
  call void @generate_password(ptr noundef %9)
  call void @game_menu(ptr noundef %2)
  br label %10

10:                                               ; preds = %0, %10
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 10, ptr noundef %13)
  %15 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 0
  call void @handle_input(ptr noundef %2, ptr noundef %15)
  br label %10
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
