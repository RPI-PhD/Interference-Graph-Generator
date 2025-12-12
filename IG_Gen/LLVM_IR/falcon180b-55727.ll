; ModuleID = 'DATASETv2/falcon180b-55727.c'
source_filename = "DATASETv2/falcon180b-55727.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32, i8 }

@card = dso_local global [5 x %struct.anon] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" - \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Attempt %d:\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Enter row and column: \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"Correct!\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"Incorrect.\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"Invalid input.\0A\00", align 1
@.str.9 = private unnamed_addr constant [42 x i8] c"Congratulations! You won in %d attempts.\0A\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"Try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_cards() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %25, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %28

5:                                                ; preds = %2
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 10
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.anon, ptr %10, i32 0, i32 0
  store i32 %7, ptr %11, align 4
  %12 = call i32 @rand() #3
  %13 = srem i32 %12, 10
  %14 = load i32, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.anon, ptr %16, i32 0, i32 1
  store i32 %13, ptr %17, align 4
  %18 = load i32, ptr %1, align 4
  %19 = add nsw i32 65, %18
  %20 = trunc i32 %19 to i8
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.anon, ptr %23, i32 0, i32 2
  store i8 %20, ptr %24, align 4
  br label %25

25:                                               ; preds = %5
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4
  br label %2, !llvm.loop !6

28:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %82, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %85

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %77, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %80

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = load i32, ptr @card, align 16
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %22

14:                                               ; preds = %10
  %15 = load i32, ptr %2, align 4
  %16 = load i32, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 1), align 4
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  %19 = load i8, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 2), align 8
  %20 = sext i8 %19 to i32
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %20)
  br label %76

22:                                               ; preds = %14, %10
  %23 = load i32, ptr %1, align 4
  %24 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1), align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %34

26:                                               ; preds = %22
  %27 = load i32, ptr %2, align 4
  %28 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 1), align 4
  %29 = icmp eq i32 %27, %28
  br i1 %29, label %30, label %34

30:                                               ; preds = %26
  %31 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 2), align 4
  %32 = sext i8 %31 to i32
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32)
  br label %75

34:                                               ; preds = %26, %22
  %35 = load i32, ptr %1, align 4
  %36 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2), align 8
  %37 = icmp eq i32 %35, %36
  br i1 %37, label %38, label %46

38:                                               ; preds = %34
  %39 = load i32, ptr %2, align 4
  %40 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 1), align 4
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %46

42:                                               ; preds = %38
  %43 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 2), align 8
  %44 = sext i8 %43 to i32
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %44)
  br label %74

46:                                               ; preds = %38, %34
  %47 = load i32, ptr %1, align 4
  %48 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3), align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %58

50:                                               ; preds = %46
  %51 = load i32, ptr %2, align 4
  %52 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 1), align 4
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %54, label %58

54:                                               ; preds = %50
  %55 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 2), align 4
  %56 = sext i8 %55 to i32
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %56)
  br label %73

58:                                               ; preds = %50, %46
  %59 = load i32, ptr %1, align 4
  %60 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4), align 16
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %70

62:                                               ; preds = %58
  %63 = load i32, ptr %2, align 4
  %64 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 1), align 4
  %65 = icmp eq i32 %63, %64
  br i1 %65, label %66, label %70

66:                                               ; preds = %62
  %67 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 2), align 8
  %68 = sext i8 %67 to i32
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %68)
  br label %72

70:                                               ; preds = %62, %58
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %72

72:                                               ; preds = %70, %66
  br label %73

73:                                               ; preds = %72, %54
  br label %74

74:                                               ; preds = %73, %42
  br label %75

75:                                               ; preds = %74, %30
  br label %76

76:                                               ; preds = %75, %18
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %2, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %2, align 4
  br label %7, !llvm.loop !8

80:                                               ; preds = %7
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %82

82:                                               ; preds = %80
  %83 = load i32, ptr %1, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %1, align 4
  br label %3, !llvm.loop !9

85:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  call void @init_cards()
  store i32 0, ptr %6, align 4
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %109, %0
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %112

12:                                               ; preds = %9
  store i32 0, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %14)
  call void @print_board()
  br label %16

16:                                               ; preds = %98, %12
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %17, 3
  br i1 %18, label %19, label %99

19:                                               ; preds = %16
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %2, ptr noundef %3)
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 %22, 10
  br i1 %23, label %24, label %96

24:                                               ; preds = %19
  %25 = load i32, ptr %3, align 4
  %26 = icmp slt i32 %25, 10
  br i1 %26, label %27, label %96

27:                                               ; preds = %24
  %28 = load i32, ptr %2, align 4
  %29 = load i32, ptr @card, align 16
  %30 = icmp eq i32 %28, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = load i32, ptr %3, align 4
  %33 = load i32, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 1), align 4
  %34 = icmp eq i32 %32, %33
  br i1 %34, label %35, label %39

35:                                               ; preds = %31
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %93

39:                                               ; preds = %31, %27
  %40 = load i32, ptr %2, align 4
  %41 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1), align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %51

43:                                               ; preds = %39
  %44 = load i32, ptr %3, align 4
  %45 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 1), align 4
  %46 = icmp eq i32 %44, %45
  br i1 %46, label %47, label %51

47:                                               ; preds = %43
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %49 = load i32, ptr %6, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %6, align 4
  br label %92

51:                                               ; preds = %43, %39
  %52 = load i32, ptr %2, align 4
  %53 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2), align 8
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %63

55:                                               ; preds = %51
  %56 = load i32, ptr %3, align 4
  %57 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 1), align 4
  %58 = icmp eq i32 %56, %57
  br i1 %58, label %59, label %63

59:                                               ; preds = %55
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %61 = load i32, ptr %6, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %6, align 4
  br label %91

63:                                               ; preds = %55, %51
  %64 = load i32, ptr %2, align 4
  %65 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3), align 4
  %66 = icmp eq i32 %64, %65
  br i1 %66, label %67, label %75

67:                                               ; preds = %63
  %68 = load i32, ptr %3, align 4
  %69 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 1), align 4
  %70 = icmp eq i32 %68, %69
  br i1 %70, label %71, label %75

71:                                               ; preds = %67
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %73 = load i32, ptr %6, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %6, align 4
  br label %90

75:                                               ; preds = %67, %63
  %76 = load i32, ptr %2, align 4
  %77 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4), align 16
  %78 = icmp eq i32 %76, %77
  br i1 %78, label %79, label %87

79:                                               ; preds = %75
  %80 = load i32, ptr %3, align 4
  %81 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 1), align 4
  %82 = icmp eq i32 %80, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %79
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %85 = load i32, ptr %6, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %6, align 4
  br label %89

87:                                               ; preds = %79, %75
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %89

89:                                               ; preds = %87, %83
  br label %90

90:                                               ; preds = %89, %71
  br label %91

91:                                               ; preds = %90, %59
  br label %92

92:                                               ; preds = %91, %47
  br label %93

93:                                               ; preds = %92, %35
  %94 = load i32, ptr %5, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %5, align 4
  br label %98

96:                                               ; preds = %24, %19
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %98

98:                                               ; preds = %96, %93
  br label %16, !llvm.loop !10

99:                                               ; preds = %16
  %100 = load i32, ptr %6, align 4
  %101 = icmp eq i32 %100, 5
  br i1 %101, label %102, label %106

102:                                              ; preds = %99
  %103 = load i32, ptr %4, align 4
  %104 = add nsw i32 %103, 1
  %105 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %104)
  br label %112

106:                                              ; preds = %99
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %108

108:                                              ; preds = %106
  br label %109

109:                                              ; preds = %108
  %110 = load i32, ptr %4, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %4, align 4
  br label %9, !llvm.loop !11

112:                                              ; preds = %102, %9
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
