; ModuleID = 'LLVM_IR/gemini_pro-33393.ll'
source_filename = "DATASETv2/gemini_pro-33393.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@charset = dso_local global [13 x i8] c" .,-;:=+*#%@\00", align 1
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Enter the text string: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Enter the width and height of the ASCII art: \00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @text_to_ascii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = call i64 @strlen(ptr noundef %0) #5
  %6 = udiv i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = sdiv i32 %2, 5
  %9 = sext i32 %2 to i64
  %10 = mul i64 %9, 8
  %11 = call noalias ptr @malloc(i64 noundef %10) #6
  br label %12

12:                                               ; preds = %20, %3
  %.06 = phi i32 [ 0, %3 ], [ %21, %20 ]
  %13 = icmp slt i32 %.06, %2
  br i1 %13, label %14, label %22

14:                                               ; preds = %12
  %15 = sext i32 %1 to i64
  %16 = mul i64 %15, 1
  %17 = call noalias ptr @malloc(i64 noundef %16) #6
  %18 = sext i32 %.06 to i64
  %19 = getelementptr inbounds ptr, ptr %11, i64 %18
  store ptr %17, ptr %19, align 8
  br label %20

20:                                               ; preds = %14
  %21 = add nsw i32 %.06, 1
  br label %12, !llvm.loop !6

22:                                               ; preds = %12
  br label %23

23:                                               ; preds = %62, %22
  %.08 = phi i32 [ 0, %22 ], [ %.19, %62 ]
  %.07 = phi i32 [ 0, %22 ], [ %.1, %62 ]
  %.05 = phi i32 [ 0, %22 ], [ %63, %62 ]
  %24 = sext i32 %.05 to i64
  %25 = call i64 @strlen(ptr noundef %0) #5
  %26 = icmp ult i64 %24, %25
  br i1 %26, label %27, label %64

27:                                               ; preds = %23
  %28 = sext i32 %.05 to i64
  %29 = getelementptr inbounds i8, ptr %0, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = sub nsw i32 %31, 32
  %33 = mul nsw i32 %32, 16
  %34 = sdiv i32 %33, 31
  br label %35

35:                                               ; preds = %54, %27
  %.04 = phi i32 [ 0, %27 ], [ %55, %54 ]
  %36 = icmp slt i32 %.04, %7
  br i1 %36, label %37, label %56

37:                                               ; preds = %35
  br label %38

38:                                               ; preds = %51, %37
  %.03 = phi i32 [ 0, %37 ], [ %52, %51 ]
  %39 = icmp slt i32 %.03, %8
  br i1 %39, label %40, label %53

40:                                               ; preds = %38
  %41 = sext i32 %34 to i64
  %42 = getelementptr inbounds [13 x i8], ptr @charset, i64 0, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = add nsw i32 %.08, %.03
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds ptr, ptr %11, i64 %45
  %47 = load ptr, ptr %46, align 8
  %48 = add nsw i32 %.07, %.04
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, ptr %47, i64 %49
  store i8 %43, ptr %50, align 1
  br label %51

51:                                               ; preds = %40
  %52 = add nsw i32 %.03, 1
  br label %38, !llvm.loop !8

53:                                               ; preds = %38
  br label %54

54:                                               ; preds = %53
  %55 = add nsw i32 %.04, 1
  br label %35, !llvm.loop !9

56:                                               ; preds = %35
  %57 = add nsw i32 %.07, %7
  %58 = icmp sge i32 %57, %1
  br i1 %58, label %59, label %61

59:                                               ; preds = %56
  %60 = add nsw i32 %.08, %8
  br label %61

61:                                               ; preds = %59, %56
  %.19 = phi i32 [ %60, %59 ], [ %.08, %56 ]
  %.1 = phi i32 [ 0, %59 ], [ %57, %56 ]
  br label %62

62:                                               ; preds = %61
  %63 = add nsw i32 %.05, 1
  br label %23, !llvm.loop !10

64:                                               ; preds = %23
  br label %65

65:                                               ; preds = %83, %64
  %.02 = phi i32 [ 0, %64 ], [ %84, %83 ]
  %66 = icmp slt i32 %.02, %2
  br i1 %66, label %67, label %85

67:                                               ; preds = %65
  br label %68

68:                                               ; preds = %79, %67
  %.01 = phi i32 [ 0, %67 ], [ %80, %79 ]
  %69 = icmp slt i32 %.01, %1
  br i1 %69, label %70, label %81

70:                                               ; preds = %68
  %71 = sext i32 %.02 to i64
  %72 = getelementptr inbounds ptr, ptr %11, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = sext i32 %.01 to i64
  %75 = getelementptr inbounds i8, ptr %73, i64 %74
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %77)
  br label %79

79:                                               ; preds = %70
  %80 = add nsw i32 %.01, 1
  br label %68, !llvm.loop !11

81:                                               ; preds = %68
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %83

83:                                               ; preds = %81
  %84 = add nsw i32 %.02, 1
  br label %65, !llvm.loop !12

85:                                               ; preds = %65
  br label %86

86:                                               ; preds = %92, %85
  %.0 = phi i32 [ 0, %85 ], [ %93, %92 ]
  %87 = icmp slt i32 %.0, %2
  br i1 %87, label %88, label %94

88:                                               ; preds = %86
  %89 = sext i32 %.0 to i64
  %90 = getelementptr inbounds ptr, ptr %11, i64 %89
  %91 = load ptr, ptr %90, align 8
  call void @free(ptr noundef %91) #7
  br label %92

92:                                               ; preds = %88
  %93 = add nsw i32 %.0, 1
  br label %86, !llvm.loop !13

94:                                               ; preds = %86
  call void @free(ptr noundef %11) #7
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %2, ptr noundef %3)
  %9 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  call void @text_to_ascii(ptr noundef %9, i32 noundef %10, i32 noundef %11)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }

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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
