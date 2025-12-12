; ModuleID = 'DATASETv2/gpt4o_mini-28542.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @log_error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @stderr, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Error, ptr %7, i32 0, i32 1
  %9 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str, i32 noundef %6, ptr noundef %9)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @read_file(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.Error, align 4
  %5 = alloca [256 x i8], align 16
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call noalias ptr @fopen(ptr noundef %7, ptr noundef @.str.1)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 0
  store i32 22, ptr %12, align 4
  %13 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 1
  %14 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %14, i64 noundef 256, ptr noundef @.str.2, ptr noundef %15) #5
  call void @log_error(ptr noundef %4)
  call void @exit(i32 noundef 1) #6
  unreachable

17:                                               ; preds = %1
  store i32 0, ptr %6, align 4
  br label %18

18:                                               ; preds = %48, %17
  %19 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %20 = load ptr, ptr %3, align 8
  %21 = call ptr @fgets(ptr noundef %19, i32 noundef 256, ptr noundef %20)
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %49

23:                                               ; preds = %18
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  %26 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %27 = call ptr @strstr(ptr noundef %26, ptr noundef @.str.3) #7
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %36

29:                                               ; preds = %23
  %30 = load i32, ptr %6, align 4
  %31 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 0
  store i32 %30, ptr %31, align 4
  %32 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 1
  %33 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 0
  %34 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %35 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %33, i64 noundef 256, ptr noundef @.str.4, ptr noundef %34) #5
  call void @log_error(ptr noundef %4)
  br label %48

36:                                               ; preds = %23
  %37 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %38 = load i8, ptr %37, align 16
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %47

41:                                               ; preds = %36
  %42 = load i32, ptr %6, align 4
  %43 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 0
  store i32 %42, ptr %43, align 4
  %44 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 1
  %45 = getelementptr inbounds [256 x i8], ptr %44, i64 0, i64 0
  %46 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %45, i64 noundef 256, ptr noundef @.str.5) #5
  call void @log_error(ptr noundef %4)
  br label %47

47:                                               ; preds = %41, %36
  br label %48

48:                                               ; preds = %47, %29
  br label %18, !llvm.loop !6

49:                                               ; preds = %18
  %50 = load ptr, ptr %3, align 8
  %51 = call i32 @feof(ptr noundef %50) #5
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %58

53:                                               ; preds = %49
  %54 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 0
  store i32 49, ptr %54, align 4
  %55 = getelementptr inbounds %struct.Error, ptr %4, i32 0, i32 1
  %56 = getelementptr inbounds [256 x i8], ptr %55, i64 0, i64 0
  %57 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %56, i64 noundef 256, ptr noundef @.str.6) #5
  call void @log_error(ptr noundef %4)
  br label %58

58:                                               ; preds = %53, %49
  %59 = load ptr, ptr %3, align 8
  %60 = call i32 @fclose(ptr noundef %59)
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.Error, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = icmp ne i32 %7, 2
  br i1 %8, label %9, label %17

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.Error, ptr %6, i32 0, i32 0
  store i32 61, ptr %10, align 4
  %11 = getelementptr inbounds %struct.Error, ptr %6, i32 0, i32 1
  %12 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %12, i64 noundef 256, ptr noundef @.str.7, ptr noundef %15) #5
  call void @log_error(ptr noundef %6)
  call void @exit(i32 noundef 1) #6
  unreachable

17:                                               ; preds = %2
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  call void @read_file(ptr noundef %20)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
