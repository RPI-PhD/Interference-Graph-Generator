; ModuleID = 'LLVM_IR/falcon180b-60071.ll'
source_filename = "DATASETv2/falcon180b-60071.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.token_t = type { ptr, i32 }

@.str = private unnamed_addr constant [24 x i8] c"Error: Too many tokens\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"%s (%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"input.html\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"Error: Could not open input file\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_token(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = load i32, ptr %1, align 4
  %6 = icmp sge i32 %5, 1000
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #6
  unreachable

9:                                                ; preds = %4
  %10 = add nsw i32 %3, 1
  %11 = sext i32 %10 to i64
  %12 = call noalias ptr @malloc(i64 noundef %11) #7
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.token_t, ptr %0, i64 %14
  %16 = getelementptr inbounds %struct.token_t, ptr %15, i32 0, i32 0
  store ptr %12, ptr %16, align 8
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.token_t, ptr %0, i64 %18
  %20 = getelementptr inbounds %struct.token_t, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = sext i32 %3 to i64
  %23 = call ptr @strncpy(ptr noundef %21, ptr noundef %2, i64 noundef %22) #8
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.token_t, ptr %0, i64 %25
  %27 = getelementptr inbounds %struct.token_t, ptr %26, i32 0, i32 1
  store i32 %3, ptr %27, align 8
  %28 = load i32, ptr %1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %1, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_tokens(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %15, %2
  %.0 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.token_t, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.token_t, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds %struct.token_t, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.token_t, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9, i32 noundef %13)
  br label %15

15:                                               ; preds = %5
  %16 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

17:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca [1000 x %struct.token_t], align 16
  %4 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #6
  unreachable

8:                                                ; preds = %0
  store i32 0, ptr %2, align 4
  br label %9

9:                                                ; preds = %91, %8
  %.02 = phi i32 [ 0, %8 ], [ %21, %91 ]
  %10 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %11 = sext i32 %.02 to i64
  %12 = getelementptr inbounds i8, ptr %10, i64 %11
  %13 = sub nsw i32 100, %.02
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef %13, ptr noundef %4)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %92

16:                                               ; preds = %9
  %17 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %18 = call i64 @strlen(ptr noundef %17) #9
  %19 = sext i32 %.02 to i64
  %20 = add i64 %19, %18
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  br label %23

23:                                               ; preds = %90, %16
  %.03 = phi ptr [ %22, %16 ], [ %.2, %90 ]
  %24 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds i8, ptr %24, i64 %25
  %27 = icmp ult ptr %.03, %26
  br i1 %27, label %28, label %91

28:                                               ; preds = %23
  %29 = load i8, ptr %.03, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 60
  br i1 %31, label %32, label %59

32:                                               ; preds = %28
  br label %33

33:                                               ; preds = %44, %32
  %.01 = phi ptr [ %.03, %32 ], [ %45, %44 ]
  %34 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %35 = sext i32 %21 to i64
  %36 = getelementptr inbounds i8, ptr %34, i64 %35
  %37 = icmp ult ptr %.01, %36
  br i1 %37, label %38, label %42

38:                                               ; preds = %33
  %39 = load i8, ptr %.01, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp ne i32 %40, 62
  br label %42

42:                                               ; preds = %38, %33
  %43 = phi i1 [ false, %33 ], [ %41, %38 ]
  br i1 %43, label %44, label %46

44:                                               ; preds = %42
  %45 = getelementptr inbounds i8, ptr %.01, i32 1
  br label %33, !llvm.loop !8

46:                                               ; preds = %42
  %47 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %48 = sext i32 %21 to i64
  %49 = getelementptr inbounds i8, ptr %47, i64 %48
  %50 = icmp ult ptr %.01, %49
  br i1 %50, label %51, label %57

51:                                               ; preds = %46
  store i8 0, ptr %.01, align 1
  %52 = getelementptr inbounds [1000 x %struct.token_t], ptr %3, i64 0, i64 0
  %53 = getelementptr inbounds i8, ptr %.01, i64 1
  %54 = getelementptr inbounds i8, ptr %.01, i64 1
  %55 = call i64 @strlen(ptr noundef %54) #9
  %56 = trunc i64 %55 to i32
  call void @add_token(ptr noundef %52, ptr noundef %2, ptr noundef %53, i32 noundef %56)
  br label %57

57:                                               ; preds = %51, %46
  %58 = getelementptr inbounds i8, ptr %.01, i64 1
  br label %90

59:                                               ; preds = %28
  %60 = load i8, ptr %.03, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 62
  br i1 %62, label %63, label %87

63:                                               ; preds = %59
  br label %64

64:                                               ; preds = %74, %63
  %.0 = phi ptr [ %.03, %63 ], [ %75, %74 ]
  %65 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %66 = icmp ugt ptr %.0, %65
  br i1 %66, label %67, label %72

67:                                               ; preds = %64
  %68 = getelementptr inbounds i8, ptr %.0, i64 -1
  %69 = load i8, ptr %68, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp ne i32 %70, 60
  br label %72

72:                                               ; preds = %67, %64
  %73 = phi i1 [ false, %64 ], [ %71, %67 ]
  br i1 %73, label %74, label %76

74:                                               ; preds = %72
  %75 = getelementptr inbounds i8, ptr %.0, i32 -1
  br label %64, !llvm.loop !9

76:                                               ; preds = %72
  %77 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %78 = icmp ugt ptr %.0, %77
  br i1 %78, label %79, label %85

79:                                               ; preds = %76
  store i8 0, ptr %.0, align 1
  %80 = getelementptr inbounds [1000 x %struct.token_t], ptr %3, i64 0, i64 0
  %81 = getelementptr inbounds i8, ptr %.0, i64 1
  %82 = getelementptr inbounds i8, ptr %.0, i64 1
  %83 = call i64 @strlen(ptr noundef %82) #9
  %84 = trunc i64 %83 to i32
  call void @add_token(ptr noundef %80, ptr noundef %2, ptr noundef %81, i32 noundef %84)
  br label %85

85:                                               ; preds = %79, %76
  %86 = getelementptr inbounds i8, ptr %.0, i64 1
  br label %89

87:                                               ; preds = %59
  %88 = getelementptr inbounds i8, ptr %.03, i32 1
  br label %89

89:                                               ; preds = %87, %85
  %.1 = phi ptr [ %86, %85 ], [ %88, %87 ]
  br label %90

90:                                               ; preds = %89, %57
  %.2 = phi ptr [ %58, %57 ], [ %.1, %89 ]
  br label %23, !llvm.loop !10

91:                                               ; preds = %23
  br label %9, !llvm.loop !11

92:                                               ; preds = %9
  %93 = call i32 @fclose(ptr noundef %4)
  %94 = getelementptr inbounds [1000 x %struct.token_t], ptr %3, i64 0, i64 0
  %95 = load i32, ptr %2, align 4
  call void @print_tokens(ptr noundef %94, i32 noundef %95)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare i32 @fclose(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { nounwind willreturn memory(read) }

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
