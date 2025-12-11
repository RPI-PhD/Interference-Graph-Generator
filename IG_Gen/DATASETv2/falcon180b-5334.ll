; ModuleID = 'DATASETv2/falcon180b-5334.c'
source_filename = "DATASETv2/falcon180b-5334.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.log_entry_t = type { ptr, ptr, i32 }

@num_log_entries = dso_local global i32 0, align 4
@log_entries = dso_local global [1000 x %struct.log_entry_t] zeroinitializer, align 16
@.str = private unnamed_addr constant [20 x i8] c"Error: log is full\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"%s (%d requests)\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"access.log\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Error: could not open log file\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_log_entry(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %27, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr @num_log_entries, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %30

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.log_entry_t, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = call i32 @strcmp(ptr noundef %15, ptr noundef %16) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %10
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.log_entry_t, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 8
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 8
  br label %54

26:                                               ; preds = %10
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %5, align 4
  br label %6, !llvm.loop !6

30:                                               ; preds = %6
  %31 = load i32, ptr @num_log_entries, align 4
  %32 = icmp sge i32 %31, 1000
  br i1 %32, label %33, label %35

33:                                               ; preds = %30
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %54

35:                                               ; preds = %30
  %36 = load ptr, ptr %3, align 8
  %37 = call noalias ptr @strdup(ptr noundef %36) #5
  %38 = load i32, ptr @num_log_entries, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.log_entry_t, ptr %40, i32 0, i32 0
  store ptr %37, ptr %41, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = call noalias ptr @strdup(ptr noundef %42) #5
  %44 = load i32, ptr @num_log_entries, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.log_entry_t, ptr %46, i32 0, i32 1
  store ptr %43, ptr %47, align 8
  %48 = load i32, ptr @num_log_entries, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %49
  %51 = getelementptr inbounds %struct.log_entry_t, ptr %50, i32 0, i32 2
  store i32 1, ptr %51, align 8
  %52 = load i32, ptr @num_log_entries, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr @num_log_entries, align 4
  br label %54

54:                                               ; preds = %35, %33, %19
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_log_entries() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @num_log_entries, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %21

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.log_entry_t, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1000 x %struct.log_entry_t], ptr @log_entries, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.log_entry_t, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %11, i32 noundef %16)
  br label %18

18:                                               ; preds = %6
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %2, !llvm.loop !8

21:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [1024 x i8], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %7 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  store ptr %7, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %12

10:                                               ; preds = %0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 1, ptr %1, align 4
  br label %40

12:                                               ; preds = %0
  br label %13

13:                                               ; preds = %34, %33, %28, %23, %12
  %14 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %15 = load ptr, ptr %2, align 8
  %16 = call ptr @fgets(ptr noundef %14, i32 noundef 1024, ptr noundef %15)
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %37

18:                                               ; preds = %13
  %19 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %20 = call ptr @strtok(ptr noundef %19, ptr noundef @.str.5) #5
  store ptr %20, ptr %4, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %18
  br label %13, !llvm.loop !9

24:                                               ; preds = %18
  %25 = call ptr @strtok(ptr noundef null, ptr noundef @.str.5) #5
  store ptr %25, ptr %5, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  br label %13, !llvm.loop !9

29:                                               ; preds = %24
  %30 = call ptr @strtok(ptr noundef null, ptr noundef @.str.5) #5
  store ptr %30, ptr %6, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %34

33:                                               ; preds = %29
  br label %13, !llvm.loop !9

34:                                               ; preds = %29
  %35 = load ptr, ptr %5, align 8
  %36 = load ptr, ptr %6, align 8
  call void @add_log_entry(ptr noundef %35, ptr noundef %36)
  br label %13, !llvm.loop !9

37:                                               ; preds = %13
  %38 = load ptr, ptr %2, align 8
  %39 = call i32 @fclose(ptr noundef %38)
  call void @print_log_entries()
  store i32 0, ptr %1, align 4
  br label %40

40:                                               ; preds = %37, %10
  %41 = load i32, ptr %1, align 4
  ret i32 %41
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
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
