; ModuleID = 'DATASETv2/codellama_13b-56.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @read_csv_row(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [1024 x i8], align 16
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = call noalias ptr @malloc(i64 noundef 88) #4
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.csv_row, ptr %7, i32 0, i32 1
  store i32 0, ptr %8, align 8
  br label %9

9:                                                ; preds = %32, %1
  %10 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @fgets(ptr noundef %10, i32 noundef 1024, ptr noundef %11)
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %33

14:                                               ; preds = %9
  %15 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %16 = call ptr @strtok(ptr noundef %15, ptr noundef @.str) #5
  store ptr %16, ptr %5, align 8
  br label %17

17:                                               ; preds = %20, %14
  %18 = load ptr, ptr %5, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %32

20:                                               ; preds = %17
  %21 = load ptr, ptr %5, align 8
  %22 = call noalias ptr @strdup(ptr noundef %21) #5
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.csv_row, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.csv_row, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %26, align 8
  %29 = sext i32 %27 to i64
  %30 = getelementptr inbounds [10 x ptr], ptr %24, i64 0, i64 %29
  store ptr %22, ptr %30, align 8
  %31 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #5
  store ptr %31, ptr %5, align 8
  br label %17, !llvm.loop !6

32:                                               ; preds = %17
  br label %9, !llvm.loop !8

33:                                               ; preds = %9
  %34 = load ptr, ptr %3, align 8
  ret ptr %34
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_csv_row(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %17, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.csv_row, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.csv_row, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x ptr], ptr %12, i64 0, i64 %14
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16) #5
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  br label %4, !llvm.loop !9

20:                                               ; preds = %4
  %21 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  store ptr %5, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 1, ptr %1, align 4
  br label %41

10:                                               ; preds = %0
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @read_csv_row(ptr noundef %11)
  store ptr %12, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %17 = load ptr, ptr %2, align 8
  %18 = call i32 @fclose(ptr noundef %17)
  store i32 1, ptr %1, align 4
  br label %41

19:                                               ; preds = %10
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %34, %19
  %21 = load i32, ptr %4, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.csv_row, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %37

26:                                               ; preds = %20
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.csv_row, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x ptr], ptr %28, i64 0, i64 %30
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %32)
  br label %34

34:                                               ; preds = %26
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  br label %20, !llvm.loop !10

37:                                               ; preds = %20
  %38 = load ptr, ptr %3, align 8
  call void @free_csv_row(ptr noundef %38)
  %39 = load ptr, ptr %2, align 8
  %40 = call i32 @fclose(ptr noundef %39)
  store i32 0, ptr %1, align 4
  br label %41

41:                                               ; preds = %37, %15, %8
  %42 = load i32, ptr %1, align 4
  ret i32 %42
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
