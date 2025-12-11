; ModuleID = 'DATASETv2/gpt4o_mini-9375.c'
source_filename = "DATASETv2/gpt4o_mini-9375.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { [10 x [10 x i32]], [10 x %struct.Character], i32 }
%struct.Character = type { [30 x i8] }

@.str = private unnamed_addr constant [29 x i8] c"Cannot add more characters!\0A\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"One of the characters not found!\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Character Relationships:\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"%s is connected with: \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Romeo\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Juliet\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"Mercutio\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"Tybalt\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"Benvolio\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"Nurse\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initGraph(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.Graph, ptr %5, i32 0, i32 2
  store i32 0, ptr %6, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %27, %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %30

10:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %23, %10
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %26

14:                                               ; preds = %11
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Graph, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x [10 x i32]], ptr %16, i64 0, i64 %18
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x i32], ptr %19, i64 0, i64 %21
  store i32 0, ptr %22, align 4
  br label %23

23:                                               ; preds = %14
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %4, align 4
  br label %11, !llvm.loop !6

26:                                               ; preds = %11
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  br label %7, !llvm.loop !8

30:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addCharacter(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.Graph, ptr %5, i32 0, i32 2
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %25

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.Graph, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Graph, ptr %12, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x %struct.Character], ptr %11, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Character, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [30 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %4, align 8
  %20 = call ptr @strcpy(ptr noundef %18, ptr noundef %19) #4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.Graph, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %22, align 4
  br label %27

25:                                               ; preds = %2
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %27

27:                                               ; preds = %25, %9
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addRelationship(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 -1, ptr %7, align 4
  store i32 -1, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %10

10:                                               ; preds = %43, %3
  %11 = load i32, ptr %9, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.Graph, ptr %12, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %46

16:                                               ; preds = %10
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.Graph, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %9, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x %struct.Character], ptr %18, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Character, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [30 x i8], ptr %22, i64 0, i64 0
  %24 = load ptr, ptr %5, align 8
  %25 = call i32 @strcmp(ptr noundef %23, ptr noundef %24) #5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %16
  %28 = load i32, ptr %9, align 4
  store i32 %28, ptr %7, align 4
  br label %29

29:                                               ; preds = %27, %16
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.Graph, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x %struct.Character], ptr %31, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.Character, ptr %34, i32 0, i32 0
  %36 = getelementptr inbounds [30 x i8], ptr %35, i64 0, i64 0
  %37 = load ptr, ptr %6, align 8
  %38 = call i32 @strcmp(ptr noundef %36, ptr noundef %37) #5
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %29
  %41 = load i32, ptr %9, align 4
  store i32 %41, ptr %8, align 4
  br label %42

42:                                               ; preds = %40, %29
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %9, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %9, align 4
  br label %10, !llvm.loop !9

46:                                               ; preds = %10
  %47 = load i32, ptr %7, align 4
  %48 = icmp ne i32 %47, -1
  br i1 %48, label %49, label %69

49:                                               ; preds = %46
  %50 = load i32, ptr %8, align 4
  %51 = icmp ne i32 %50, -1
  br i1 %51, label %52, label %69

52:                                               ; preds = %49
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.Graph, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [10 x [10 x i32]], ptr %54, i64 0, i64 %56
  %58 = load i32, ptr %8, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [10 x i32], ptr %57, i64 0, i64 %59
  store i32 1, ptr %60, align 4
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.Graph, ptr %61, i32 0, i32 0
  %63 = load i32, ptr %8, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [10 x [10 x i32]], ptr %62, i64 0, i64 %64
  %66 = load i32, ptr %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10 x i32], ptr %65, i64 0, i64 %67
  store i32 1, ptr %68, align 4
  br label %71

69:                                               ; preds = %49, %46
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %71

71:                                               ; preds = %69, %52
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayRelationships(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %53, %1
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Graph, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %56

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Graph, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x %struct.Character], ptr %14, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Character, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [30 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %19)
  store i32 0, ptr %4, align 4
  br label %21

21:                                               ; preds = %48, %12
  %22 = load i32, ptr %4, align 4
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.Graph, ptr %23, i32 0, i32 2
  %25 = load i32, ptr %24, align 4
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %51

27:                                               ; preds = %21
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.Graph, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x [10 x i32]], ptr %29, i64 0, i64 %31
  %33 = load i32, ptr %4, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [10 x i32], ptr %32, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %47

38:                                               ; preds = %27
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds %struct.Graph, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [10 x %struct.Character], ptr %40, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.Character, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds [30 x i8], ptr %44, i64 0, i64 0
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %45)
  br label %47

47:                                               ; preds = %38, %27
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %4, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %4, align 4
  br label %21, !llvm.loop !10

51:                                               ; preds = %21
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %53

53:                                               ; preds = %51
  %54 = load i32, ptr %3, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %3, align 4
  br label %6, !llvm.loop !11

56:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Graph, align 4
  store i32 0, ptr %1, align 4
  call void @initGraph(ptr noundef %2)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.6)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.7)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.8)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.9)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.10)
  call void @addCharacter(ptr noundef %2, ptr noundef @.str.11)
  call void @addRelationship(ptr noundef %2, ptr noundef @.str.6, ptr noundef @.str.7)
  call void @addRelationship(ptr noundef %2, ptr noundef @.str.6, ptr noundef @.str.8)
  call void @addRelationship(ptr noundef %2, ptr noundef @.str.10, ptr noundef @.str.8)
  call void @addRelationship(ptr noundef %2, ptr noundef @.str.9, ptr noundef @.str.7)
  call void @addRelationship(ptr noundef %2, ptr noundef @.str.11, ptr noundef @.str.7)
  call void @displayRelationships(ptr noundef %2)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
