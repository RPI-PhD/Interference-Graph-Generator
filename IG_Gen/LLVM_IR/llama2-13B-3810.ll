; ModuleID = 'DATASETv2/llama2-13B-3810.c'
source_filename = "DATASETv2/llama2-13B-3810.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.record = type { [20 x i8], [3 x i8], [5 x i8] }

@.str = private unnamed_addr constant [8 x i8] c"Person \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Male\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Female\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Alice\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Found record: %s %d %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"Record not found\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"25\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insert_records(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %42, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %45

10:                                               ; preds = %6
  %11 = call i64 @time(ptr noundef null) #5
  %12 = trunc i64 %11 to i32
  call void @srand(i32 noundef %12) #5
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.record, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.record, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [20 x i8], ptr %17, i64 0, i64 0
  %19 = call ptr @strcpy(ptr noundef %18, ptr noundef @.str) #5
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.record, ptr %20, i64 %22
  %24 = getelementptr inbounds %struct.record, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds [3 x i8], ptr %24, i64 0, i64 0
  %26 = call i32 @rand() #5
  %27 = srem i32 %26, 100
  %28 = add nsw i32 %27, 1
  %29 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %25, ptr noundef @.str.1, i32 noundef %28) #5
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.record, ptr %30, i64 %32
  %34 = getelementptr inbounds %struct.record, ptr %33, i32 0, i32 2
  %35 = getelementptr inbounds [5 x i8], ptr %34, i64 0, i64 0
  %36 = call i32 @rand() #5
  %37 = srem i32 %36, 2
  %38 = icmp ne i32 %37, 0
  %39 = zext i1 %38 to i64
  %40 = select i1 %38, ptr @.str.2, ptr @.str.3
  %41 = call ptr @strcpy(ptr noundef %35, ptr noundef %40) #5
  br label %42

42:                                               ; preds = %10
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  br label %6, !llvm.loop !6

45:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @search_records(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %29, %3
  %10 = load i32, ptr %8, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %32

13:                                               ; preds = %9
  %14 = load ptr, ptr %5, align 8
  %15 = load i32, ptr %8, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.record, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.record, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %7, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %13
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %8, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.record, ptr %24, i64 %26
  store ptr %27, ptr %4, align 8
  br label %33

28:                                               ; preds = %13
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %8, align 4
  br label %9, !llvm.loop !8

32:                                               ; preds = %9
  store ptr null, ptr %4, align 8
  br label %33

33:                                               ; preds = %32, %23
  %34 = load ptr, ptr %4, align 8
  ret ptr %34
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @update_records(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %10

10:                                               ; preds = %34, %4
  %11 = load i32, ptr %9, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %37

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.record, ptr %15, i64 %17
  %19 = getelementptr inbounds %struct.record, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [20 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %7, align 8
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %33

24:                                               ; preds = %14
  %25 = load ptr, ptr %5, align 8
  %26 = load i32, ptr %9, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.record, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.record, ptr %28, i32 0, i32 1
  %30 = getelementptr inbounds [3 x i8], ptr %29, i64 0, i64 0
  %31 = load ptr, ptr %8, align 8
  %32 = call ptr @strcpy(ptr noundef %30, ptr noundef %31) #5
  br label %37

33:                                               ; preds = %14
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %9, align 4
  br label %10, !llvm.loop !9

37:                                               ; preds = %24, %10
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @delete_records(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %63, %3
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %5, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %66

12:                                               ; preds = %8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.record, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.record, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [20 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %6, align 8
  %20 = call i32 @strcmp(ptr noundef %18, ptr noundef %19) #6
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %62

22:                                               ; preds = %12
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %7, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.record, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.record, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds [20 x i8], ptr %27, i64 0, i64 0
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.record, ptr %29, i64 %31
  %33 = getelementptr inbounds %struct.record, ptr %32, i32 0, i32 0
  %34 = getelementptr inbounds [20 x i8], ptr %33, i64 0, i64 0
  %35 = call i64 @strlen(ptr noundef %34) #6
  call void @llvm.memset.p0.i64(ptr align 1 %28, i8 0, i64 %35, i1 false)
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.record, ptr %36, i64 %38
  %40 = getelementptr inbounds %struct.record, ptr %39, i32 0, i32 1
  %41 = getelementptr inbounds [3 x i8], ptr %40, i64 0, i64 0
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.record, ptr %42, i64 %44
  %46 = getelementptr inbounds %struct.record, ptr %45, i32 0, i32 1
  %47 = getelementptr inbounds [3 x i8], ptr %46, i64 0, i64 0
  %48 = call i64 @strlen(ptr noundef %47) #6
  call void @llvm.memset.p0.i64(ptr align 1 %41, i8 0, i64 %48, i1 false)
  %49 = load ptr, ptr %4, align 8
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.record, ptr %49, i64 %51
  %53 = getelementptr inbounds %struct.record, ptr %52, i32 0, i32 2
  %54 = getelementptr inbounds [5 x i8], ptr %53, i64 0, i64 0
  %55 = load ptr, ptr %4, align 8
  %56 = load i32, ptr %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %struct.record, ptr %55, i64 %57
  %59 = getelementptr inbounds %struct.record, ptr %58, i32 0, i32 2
  %60 = getelementptr inbounds [5 x i8], ptr %59, i64 0, i64 0
  %61 = call i64 @strlen(ptr noundef %60) #6
  call void @llvm.memset.p0.i64(ptr align 1 %54, i8 0, i64 %61, i1 false)
  br label %66

62:                                               ; preds = %12
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %8, !llvm.loop !10

66:                                               ; preds = %22, %8
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x %struct.record], align 16
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store i32 1000, ptr %3, align 4
  %5 = getelementptr inbounds [1000 x %struct.record], ptr %2, i64 0, i64 0
  %6 = load i32, ptr %3, align 4
  call void @insert_records(ptr noundef %5, i32 noundef %6)
  %7 = getelementptr inbounds [1000 x %struct.record], ptr %2, i64 0, i64 0
  %8 = load i32, ptr %3, align 4
  %9 = call ptr @search_records(ptr noundef %7, i32 noundef %8, ptr noundef @.str.4)
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %23

12:                                               ; preds = %0
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.record, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [20 x i8], ptr %14, i64 0, i64 0
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.record, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.record, ptr %19, i32 0, i32 2
  %21 = getelementptr inbounds [5 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %15, ptr noundef %18, ptr noundef %21)
  br label %25

23:                                               ; preds = %0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %25

25:                                               ; preds = %23, %12
  %26 = getelementptr inbounds [1000 x %struct.record], ptr %2, i64 0, i64 0
  %27 = load i32, ptr %3, align 4
  call void @update_records(ptr noundef %26, i32 noundef %27, ptr noundef @.str.4, ptr noundef @.str.7)
  %28 = getelementptr inbounds [1000 x %struct.record], ptr %2, i64 0, i64 0
  %29 = load i32, ptr %3, align 4
  %30 = call ptr @search_records(ptr noundef %28, i32 noundef %29, ptr noundef @.str.4)
  store ptr %30, ptr %4, align 8
  %31 = load ptr, ptr %4, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %44

33:                                               ; preds = %25
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.record, ptr %34, i32 0, i32 0
  %36 = getelementptr inbounds [20 x i8], ptr %35, i64 0, i64 0
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.record, ptr %37, i32 0, i32 1
  %39 = getelementptr inbounds [3 x i8], ptr %38, i64 0, i64 0
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.record, ptr %40, i32 0, i32 2
  %42 = getelementptr inbounds [5 x i8], ptr %41, i64 0, i64 0
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %36, ptr noundef %39, ptr noundef %42)
  br label %46

44:                                               ; preds = %25
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %46

46:                                               ; preds = %44, %33
  %47 = getelementptr inbounds [1000 x %struct.record], ptr %2, i64 0, i64 0
  %48 = load i32, ptr %3, align 4
  call void @delete_records(ptr noundef %47, i32 noundef %48, ptr noundef @.str.4)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
