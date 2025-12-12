; ModuleID = 'LLVM_IR/falcon180b-34007.ll'
source_filename = "DATASETv2/falcon180b-34007.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.WordFrequency = type { [50 x i8], i32 }

@.str = private unnamed_addr constant [12 x i8] c"example.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Error opening file.\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c",.?!;:\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compareStrings(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  %4 = load ptr, ptr %1, align 8
  %5 = call i32 @strcmp(ptr noundef %3, ptr noundef %4) #6
  ret i32 %5
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca [1000 x %struct.WordFrequency], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 56000, i1 false)
  %3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #7
  unreachable

7:                                                ; preds = %0
  br label %8

8:                                                ; preds = %69, %7
  %.03 = phi i32 [ 0, %7 ], [ %.1, %69 ]
  %9 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %10 = call ptr @fgets(ptr noundef %9, i32 noundef 1024, ptr noundef %3)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %70

12:                                               ; preds = %8
  br label %13

13:                                               ; preds = %28, %12
  %.04 = phi i32 [ 0, %12 ], [ %29, %28 ]
  %14 = sext i32 %.04 to i64
  %15 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %30

19:                                               ; preds = %13
  %20 = sext i32 %.04 to i64
  %21 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = call i32 @tolower(i32 noundef %23) #6
  %25 = trunc i32 %24 to i8
  %26 = sext i32 %.04 to i64
  %27 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 %26
  store i8 %25, ptr %27, align 1
  br label %28

28:                                               ; preds = %19
  %29 = add nsw i32 %.04, 1
  br label %13, !llvm.loop !6

30:                                               ; preds = %13
  %31 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %32 = call ptr @strtok(ptr noundef %31, ptr noundef @.str.3) #8
  br label %33

33:                                               ; preds = %67, %30
  %.1 = phi i32 [ %.03, %30 ], [ %.2, %67 ]
  %.02 = phi ptr [ %32, %30 ], [ %68, %67 ]
  %34 = icmp ne ptr %.02, null
  br i1 %34, label %35, label %69

35:                                               ; preds = %33
  br label %36

36:                                               ; preds = %47, %35
  %.01 = phi i32 [ 0, %35 ], [ %48, %47 ]
  %37 = icmp slt i32 %.01, %.1
  br i1 %37, label %38, label %45

38:                                               ; preds = %36
  %39 = sext i32 %.01 to i64
  %40 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.WordFrequency, ptr %40, i32 0, i32 0
  %42 = getelementptr inbounds [50 x i8], ptr %41, i64 0, i64 0
  %43 = call i32 @strcmp(ptr noundef %42, ptr noundef %.02) #6
  %44 = icmp ne i32 %43, 0
  br label %45

45:                                               ; preds = %38, %36
  %46 = phi i1 [ false, %36 ], [ %44, %38 ]
  br i1 %46, label %47, label %49

47:                                               ; preds = %45
  %48 = add nsw i32 %.01, 1
  br label %36, !llvm.loop !8

49:                                               ; preds = %45
  %50 = icmp eq i32 %.01, %.1
  br i1 %50, label %51, label %61

51:                                               ; preds = %49
  %52 = sext i32 %.1 to i64
  %53 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.WordFrequency, ptr %53, i32 0, i32 0
  %55 = getelementptr inbounds [50 x i8], ptr %54, i64 0, i64 0
  %56 = call ptr @strcpy(ptr noundef %55, ptr noundef %.02) #8
  %57 = sext i32 %.1 to i64
  %58 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %57
  %59 = getelementptr inbounds %struct.WordFrequency, ptr %58, i32 0, i32 1
  store i32 1, ptr %59, align 4
  %60 = add nsw i32 %.1, 1
  br label %67

61:                                               ; preds = %49
  %62 = sext i32 %.01 to i64
  %63 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %62
  %64 = getelementptr inbounds %struct.WordFrequency, ptr %63, i32 0, i32 1
  %65 = load i32, ptr %64, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %64, align 4
  br label %67

67:                                               ; preds = %61, %51
  %.2 = phi i32 [ %60, %51 ], [ %.1, %61 ]
  %68 = call ptr @strtok(ptr noundef null, ptr noundef @.str.3) #8
  br label %33, !llvm.loop !9

69:                                               ; preds = %33
  br label %8, !llvm.loop !10

70:                                               ; preds = %8
  %71 = call i32 @fclose(ptr noundef %3)
  %72 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 0
  %73 = sext i32 %.03 to i64
  call void @qsort(ptr noundef %72, i64 noundef %73, i64 noundef 56, ptr noundef @compareStrings)
  br label %74

74:                                               ; preds = %86, %70
  %.0 = phi i32 [ 0, %70 ], [ %87, %86 ]
  %75 = icmp slt i32 %.0, %.03
  br i1 %75, label %76, label %88

76:                                               ; preds = %74
  %77 = sext i32 %.0 to i64
  %78 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %77
  %79 = getelementptr inbounds %struct.WordFrequency, ptr %78, i32 0, i32 0
  %80 = getelementptr inbounds [50 x i8], ptr %79, i64 0, i64 0
  %81 = sext i32 %.0 to i64
  %82 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %2, i64 0, i64 %81
  %83 = getelementptr inbounds %struct.WordFrequency, ptr %82, i32 0, i32 1
  %84 = load i32, ptr %83, align 4
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %80, i32 noundef %84)
  br label %86

86:                                               ; preds = %76
  %87 = add nsw i32 %.0, 1
  br label %74, !llvm.loop !11

88:                                               ; preds = %74
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #5

declare i32 @fclose(ptr noundef) #3

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

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
