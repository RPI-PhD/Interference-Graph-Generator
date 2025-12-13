; ModuleID = 'LLVM_IR/gpt35-75897.ll'
source_filename = "DATASETv2/gpt35-75897.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"Enter password: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"\0AWeak Password!\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"Password length must be between 8 and 20 characters.\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"\0AStrong Password!\0A\00", align 1
@.str.5 = private unnamed_addr constant [56 x i8] c"- Password must contain at least one uppercase letter.\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"- Password must contain at least one lowercase letter.\0A\00", align 1
@.str.7 = private unnamed_addr constant [45 x i8] c"- Password must contain at least one digit.\0A\00", align 1
@.str.8 = private unnamed_addr constant [57 x i8] c"- Password must contain at least one special character.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [20 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %3)
  %5 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %6 = call i64 @strlen(ptr noundef %5) #5
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %0
  %10 = icmp sgt i32 %7, 20
  br i1 %10, label %11, label %14

11:                                               ; preds = %9, %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 0) #6
  unreachable

14:                                               ; preds = %9
  br label %15

15:                                               ; preds = %83, %14
  %.06 = phi i32 [ 0, %14 ], [ %.17, %83 ]
  %.04 = phi i32 [ 0, %14 ], [ %.15, %83 ]
  %.03 = phi i32 [ 0, %14 ], [ %84, %83 ]
  %.01 = phi i32 [ 0, %14 ], [ %.12, %83 ]
  %.0 = phi i32 [ 0, %14 ], [ %.1, %83 ]
  %16 = icmp slt i32 %.03, %7
  br i1 %16, label %17, label %85

17:                                               ; preds = %15
  %18 = call ptr @__ctype_b_loc() #7
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %.03 to i64
  %21 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, ptr %19, i64 %24
  %26 = load i16, ptr %25, align 2
  %27 = zext i16 %26 to i32
  %28 = and i32 %27, 256
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %17
  %31 = add nsw i32 %.04, 1
  br label %32

32:                                               ; preds = %30, %17
  %.15 = phi i32 [ %31, %30 ], [ %.04, %17 ]
  %33 = call ptr @__ctype_b_loc() #7
  %34 = load ptr, ptr %33, align 8
  %35 = sext i32 %.03 to i64
  %36 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i16, ptr %34, i64 %39
  %41 = load i16, ptr %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %42, 512
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %32
  %46 = add nsw i32 %.06, 1
  br label %47

47:                                               ; preds = %45, %32
  %.17 = phi i32 [ %46, %45 ], [ %.06, %32 ]
  %48 = call ptr @__ctype_b_loc() #7
  %49 = load ptr, ptr %48, align 8
  %50 = sext i32 %.03 to i64
  %51 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, ptr %49, i64 %54
  %56 = load i16, ptr %55, align 2
  %57 = zext i16 %56 to i32
  %58 = and i32 %57, 2048
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %62

60:                                               ; preds = %47
  %61 = add nsw i32 %.01, 1
  br label %62

62:                                               ; preds = %60, %47
  %.12 = phi i32 [ %61, %60 ], [ %.01, %47 ]
  %63 = sext i32 %.03 to i64
  %64 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp sge i32 %66, 33
  br i1 %67, label %68, label %74

68:                                               ; preds = %62
  %69 = sext i32 %.03 to i64
  %70 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %69
  %71 = load i8, ptr %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp sle i32 %72, 46
  br i1 %73, label %80, label %74

74:                                               ; preds = %68, %62
  %75 = sext i32 %.03 to i64
  %76 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %78, 64
  br i1 %79, label %80, label %82

80:                                               ; preds = %74, %68
  %81 = add nsw i32 %.0, 1
  br label %82

82:                                               ; preds = %80, %74
  %.1 = phi i32 [ %81, %80 ], [ %.0, %74 ]
  br label %83

83:                                               ; preds = %82
  %84 = add nsw i32 %.03, 1
  br label %15, !llvm.loop !6

85:                                               ; preds = %15
  %86 = icmp sge i32 %.04, 1
  br i1 %86, label %87, label %95

87:                                               ; preds = %85
  %88 = icmp sge i32 %.06, 1
  br i1 %88, label %89, label %95

89:                                               ; preds = %87
  %90 = icmp sge i32 %.01, 1
  br i1 %90, label %91, label %95

91:                                               ; preds = %89
  %92 = icmp sge i32 %.0, 1
  br i1 %92, label %93, label %95

93:                                               ; preds = %91
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %113

95:                                               ; preds = %91, %89, %87, %85
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %97 = icmp slt i32 %.04, 1
  br i1 %97, label %98, label %100

98:                                               ; preds = %95
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %100

100:                                              ; preds = %98, %95
  %101 = icmp slt i32 %.06, 1
  br i1 %101, label %102, label %104

102:                                              ; preds = %100
  %103 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %104

104:                                              ; preds = %102, %100
  %105 = icmp slt i32 %.01, 1
  br i1 %105, label %106, label %108

106:                                              ; preds = %104
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %108

108:                                              ; preds = %106, %104
  %109 = icmp slt i32 %.0, 1
  br i1 %109, label %110, label %112

110:                                              ; preds = %108
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %112

112:                                              ; preds = %110, %108
  br label %113

113:                                              ; preds = %112, %93
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(none) }

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
