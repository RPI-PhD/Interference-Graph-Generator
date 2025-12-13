; ModuleID = 'LLVM_IR/codellama_13b-56.ll'
source_filename = "DATASETv2/codellama_13b-56.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.csv_row = type { [10 x ptr], i32 }

@.str = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"example.csv\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Error opening file.\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Error reading CSV file.\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @read_csv_row(ptr noundef %0) #0 {
  %2 = alloca [1024 x i8], align 16
  %3 = call noalias ptr @malloc(i64 noundef 88) #4
  %4 = getelementptr inbounds %struct.csv_row, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 8
  br label %5

5:                                                ; preds = %23, %1
  %6 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %7 = call ptr @fgets(ptr noundef %6, i32 noundef 1024, ptr noundef %0)
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %24

9:                                                ; preds = %5
  %10 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %11 = call ptr @strtok(ptr noundef %10, ptr noundef @.str) #5
  br label %12

12:                                               ; preds = %14, %9
  %.0 = phi ptr [ %11, %9 ], [ %22, %14 ]
  %13 = icmp ne ptr %.0, null
  br i1 %13, label %14, label %23

14:                                               ; preds = %12
  %15 = call noalias ptr @strdup(ptr noundef %.0) #5
  %16 = getelementptr inbounds %struct.csv_row, ptr %3, i32 0, i32 0
  %17 = getelementptr inbounds %struct.csv_row, ptr %3, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds [10 x ptr], ptr %16, i64 0, i64 %20
  store ptr %15, ptr %21, align 8
  %22 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #5
  br label %12, !llvm.loop !6

23:                                               ; preds = %12
  br label %5, !llvm.loop !8

24:                                               ; preds = %5
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_csv_row(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %11, %1
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %3 = getelementptr inbounds %struct.csv_row, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.csv_row, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [10 x ptr], ptr %7, i64 0, i64 %8
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10) #5
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

13:                                               ; preds = %2
  call void @free(ptr noundef %0) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %26

5:                                                ; preds = %0
  %6 = call ptr @read_csv_row(ptr noundef %1)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %10 = call i32 @fclose(ptr noundef %1)
  br label %26

11:                                               ; preds = %5
  br label %12

12:                                               ; preds = %22, %11
  %.01 = phi i32 [ 0, %11 ], [ %23, %22 ]
  %13 = getelementptr inbounds %struct.csv_row, ptr %6, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %16, label %24

16:                                               ; preds = %12
  %17 = getelementptr inbounds %struct.csv_row, ptr %6, i32 0, i32 0
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [10 x ptr], ptr %17, i64 0, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %20)
  br label %22

22:                                               ; preds = %16
  %23 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !10

24:                                               ; preds = %12
  call void @free_csv_row(ptr noundef %6)
  %25 = call i32 @fclose(ptr noundef %1)
  br label %26

26:                                               ; preds = %24, %8, %3
  %.0 = phi i32 [ 1, %3 ], [ 1, %8 ], [ 0, %24 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
