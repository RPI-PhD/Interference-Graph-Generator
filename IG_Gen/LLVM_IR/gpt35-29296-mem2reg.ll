; ModuleID = 'LLVM_IR/gpt35-29296.ll'
source_filename = "DATASETv2/gpt35-29296.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Error: Cannot open the dictionary\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Error: Cannot open the text file\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"Line %d, word %s: Possible spelling mistake\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Enter the path to dictionary: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [45 x i8] c"Enter the path to text file to spell check: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @load_dict(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [100 x i8], align 16
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef -1) #5
  unreachable

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %13, %8
  %.0 = phi i32 [ 0, %8 ], [ %17, %13 ]
  %10 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %11 = call ptr @fgets(ptr noundef %10, i32 noundef 100, ptr noundef %4)
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %23

13:                                               ; preds = %9
  %14 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %15 = call i64 @strcspn(ptr noundef %14, ptr noundef @.str.2) #6
  %16 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %15
  store i8 0, ptr %16, align 1
  %17 = add nsw i32 %.0, 1
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x i8], ptr %1, i64 %18
  %20 = getelementptr inbounds [100 x i8], ptr %19, i64 0, i64 0
  %21 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %22 = call ptr @strcpy(ptr noundef %20, ptr noundef %21) #7
  br label %9, !llvm.loop !6

23:                                               ; preds = %9
  %24 = call i32 @fclose(ptr noundef %4)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @spell_check(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [100 x i8], align 16
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef -1) #5
  unreachable

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %73, %8
  %.0 = phi i32 [ 0, %8 ], [ %14, %73 ]
  %10 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %11 = call ptr @fgets(ptr noundef %10, i32 noundef 100, ptr noundef %4)
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %74

13:                                               ; preds = %9
  %14 = add nsw i32 %.0, 1
  %15 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %16 = call i64 @strlen(ptr noundef %15) #6
  %17 = trunc i64 %16 to i32
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %30

19:                                               ; preds = %13
  %20 = sub nsw i32 %17, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 10
  br i1 %25, label %26, label %30

26:                                               ; preds = %19
  %27 = sub nsw i32 %17, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %28
  store i8 0, ptr %29, align 1
  br label %30

30:                                               ; preds = %26, %19, %13
  br label %31

31:                                               ; preds = %45, %30
  %.02 = phi i32 [ 0, %30 ], [ %46, %45 ]
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = icmp ne i8 %34, 0
  br i1 %35, label %36, label %47

36:                                               ; preds = %31
  %37 = sext i32 %.02 to i64
  %38 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = call i32 @tolower(i32 noundef %40) #6
  %42 = trunc i32 %41 to i8
  %43 = sext i32 %.02 to i64
  %44 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %43
  store i8 %42, ptr %44, align 1
  br label %45

45:                                               ; preds = %36
  %46 = add nsw i32 %.02, 1
  br label %31, !llvm.loop !8

47:                                               ; preds = %31
  br label %48

48:                                               ; preds = %66, %47
  %.1 = phi i32 [ 0, %47 ], [ %67, %66 ]
  %49 = icmp slt i32 %.1, 50000
  br i1 %49, label %50, label %68

50:                                               ; preds = %48
  %51 = sext i32 %.1 to i64
  %52 = getelementptr inbounds [100 x i8], ptr %1, i64 %51
  %53 = getelementptr inbounds [100 x i8], ptr %52, i64 0, i64 0
  %54 = call i64 @strlen(ptr noundef %53) #6
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %50
  br label %68

57:                                               ; preds = %50
  %58 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %59 = sext i32 %.1 to i64
  %60 = getelementptr inbounds [100 x i8], ptr %1, i64 %59
  %61 = getelementptr inbounds [100 x i8], ptr %60, i64 0, i64 0
  %62 = call i32 @strcmp(ptr noundef %58, ptr noundef %61) #6
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %57
  br label %68

65:                                               ; preds = %57
  br label %66

66:                                               ; preds = %65
  %67 = add nsw i32 %.1, 1
  br label %48, !llvm.loop !9

68:                                               ; preds = %64, %56, %48
  %.01 = phi i32 [ 0, %56 ], [ 1, %64 ], [ 0, %48 ]
  %69 = icmp ne i32 %.01, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %68
  %71 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %14, ptr noundef %71)
  br label %73

73:                                               ; preds = %70, %68
  br label %9, !llvm.loop !10

74:                                               ; preds = %9
  %75 = call i32 @fclose(ptr noundef %4)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = alloca [50000 x [100 x i8]], align 16
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %5 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %5)
  %7 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %8 = getelementptr inbounds [50000 x [100 x i8]], ptr %3, i64 0, i64 0
  call void @load_dict(ptr noundef %7, ptr noundef %8)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %10 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %10)
  %12 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %13 = getelementptr inbounds [50000 x [100 x i8]], ptr %3, i64 0, i64 0
  call void @spell_check(ptr noundef %12, ptr noundef %13)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind willreturn memory(read) }
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
