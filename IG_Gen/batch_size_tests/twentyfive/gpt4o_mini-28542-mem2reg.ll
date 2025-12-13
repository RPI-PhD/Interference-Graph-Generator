; ModuleID = 'LLVM_IR/gpt4o_mini-28542.ll'
source_filename = "DATASETv2/gpt4o_mini-28542.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Error = type { i32, [256 x i8] }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [22 x i8] c"Error at line %d: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Failed to open file: %s\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Found 'error' in line: %s\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Empty line encountered.\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"End of file not reached properly.\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"Usage: %s <filename>\00", align 1
@.str.8 = private unnamed_addr constant [44 x i8] c"Finished processing the file successfully.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @log_error(ptr noundef %0) #0 {
  %2 = load ptr, ptr @stderr, align 8
  %3 = getelementptr inbounds %struct.Error, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds %struct.Error, ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str, i32 noundef %4, ptr noundef %6)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @read_file(ptr noundef %0) #0 {
  %2 = alloca %struct.Error, align 4
  %3 = alloca [256 x i8], align 16
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.1)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 0
  store i32 22, ptr %7, align 4
  %8 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 1
  %9 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %9, i64 noundef 256, ptr noundef @.str.2, ptr noundef %0) #5
  call void @log_error(ptr noundef %2)
  call void @exit(i32 noundef 1) #6
  unreachable

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %38, %11
  %.0 = phi i32 [ 0, %11 ], [ %17, %38 ]
  %13 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %14 = call ptr @fgets(ptr noundef %13, i32 noundef 256, ptr noundef %4)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %39

16:                                               ; preds = %12
  %17 = add nsw i32 %.0, 1
  %18 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %19 = call ptr @strstr(ptr noundef %18, ptr noundef @.str.3) #7
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %27

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 0
  store i32 %17, ptr %22, align 4
  %23 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 1
  %24 = getelementptr inbounds [256 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %26 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %24, i64 noundef 256, ptr noundef @.str.4, ptr noundef %25) #5
  call void @log_error(ptr noundef %2)
  br label %38

27:                                               ; preds = %16
  %28 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %29 = load i8, ptr %28, align 16
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %37

32:                                               ; preds = %27
  %33 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 0
  store i32 %17, ptr %33, align 4
  %34 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 1
  %35 = getelementptr inbounds [256 x i8], ptr %34, i64 0, i64 0
  %36 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %35, i64 noundef 256, ptr noundef @.str.5) #5
  call void @log_error(ptr noundef %2)
  br label %37

37:                                               ; preds = %32, %27
  br label %38

38:                                               ; preds = %37, %21
  br label %12, !llvm.loop !6

39:                                               ; preds = %12
  %40 = call i32 @feof(ptr noundef %4) #5
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 0
  store i32 49, ptr %43, align 4
  %44 = getelementptr inbounds %struct.Error, ptr %2, i32 0, i32 1
  %45 = getelementptr inbounds [256 x i8], ptr %44, i64 0, i64 0
  %46 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %45, i64 noundef 256, ptr noundef @.str.6) #5
  call void @log_error(ptr noundef %2)
  br label %47

47:                                               ; preds = %42, %39
  %48 = call i32 @fclose(ptr noundef %4)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #2

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.Error, align 4
  %4 = icmp ne i32 %0, 2
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.Error, ptr %3, i32 0, i32 0
  store i32 61, ptr %6, align 4
  %7 = getelementptr inbounds %struct.Error, ptr %3, i32 0, i32 1
  %8 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %9 = getelementptr inbounds ptr, ptr %1, i64 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %8, i64 noundef 256, ptr noundef @.str.7, ptr noundef %10) #5
  call void @log_error(ptr noundef %3)
  call void @exit(i32 noundef 1) #6
  unreachable

12:                                               ; preds = %2
  %13 = getelementptr inbounds ptr, ptr %1, i64 1
  %14 = load ptr, ptr %13, align 8
  call void @read_file(ptr noundef %14)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(read) }

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
