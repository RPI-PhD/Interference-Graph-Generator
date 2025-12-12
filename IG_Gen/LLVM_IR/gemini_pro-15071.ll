; ModuleID = 'DATASETv2/gemini_pro-15071.c'
source_filename = "DATASETv2/gemini_pro-15071.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DigitalDiary = type { [100 x %struct.DiaryEntry], i32 }
%struct.DiaryEntry = type { ptr, ptr }

@.str = private unnamed_addr constant [10 x i8] c"Date: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Entry: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"2023-01-01\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"Today I went for a walk in the park.\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"2023-01-02\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"Today I met with a friend for coffee.\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"2023-01-03\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Today I worked on a new project.\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_diary() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 1608) #5
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.DigitalDiary, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 8
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_entry(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.DigitalDiary, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = icmp slt i32 %9, 100
  br i1 %10, label %11, label %62

11:                                               ; preds = %3
  %12 = load ptr, ptr %5, align 8
  %13 = call i64 @strlen(ptr noundef %12) #6
  %14 = add i64 %13, 1
  %15 = call noalias ptr @malloc(i64 noundef %14) #5
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.DigitalDiary, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.DigitalDiary, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %17, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.DiaryEntry, ptr %22, i32 0, i32 0
  store ptr %15, ptr %23, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.DigitalDiary, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.DigitalDiary, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 8
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %25, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.DiaryEntry, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = call ptr @strcpy(ptr noundef %32, ptr noundef %33) #7
  %35 = load ptr, ptr %6, align 8
  %36 = call i64 @strlen(ptr noundef %35) #6
  %37 = add i64 %36, 1
  %38 = call noalias ptr @malloc(i64 noundef %37) #5
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.DigitalDiary, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.DigitalDiary, ptr %41, i32 0, i32 1
  %43 = load i32, ptr %42, align 8
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %40, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.DiaryEntry, ptr %45, i32 0, i32 1
  store ptr %38, ptr %46, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.DigitalDiary, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.DigitalDiary, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %48, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.DiaryEntry, ptr %53, i32 0, i32 1
  %55 = load ptr, ptr %54, align 8
  %56 = load ptr, ptr %6, align 8
  %57 = call ptr @strcpy(ptr noundef %55, ptr noundef %56) #7
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds %struct.DigitalDiary, ptr %58, i32 0, i32 1
  %60 = load i32, ptr %59, align 8
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %59, align 8
  br label %62

62:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_diary(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %28, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.DigitalDiary, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %31

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.DigitalDiary, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17)
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.DigitalDiary, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %20, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.DiaryEntry, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %25)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %28

28:                                               ; preds = %10
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  br label %4, !llvm.loop !6

31:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_diary(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %25, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.DigitalDiary, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %28

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.DigitalDiary, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17) #7
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.DigitalDiary, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %19, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.DiaryEntry, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %24) #7
  br label %25

25:                                               ; preds = %10
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4
  br label %4, !llvm.loop !8

28:                                               ; preds = %4
  %29 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %29) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @create_diary()
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @add_entry(ptr noundef %4, ptr noundef @.str.3, ptr noundef @.str.4)
  %5 = load ptr, ptr %2, align 8
  call void @add_entry(ptr noundef %5, ptr noundef @.str.5, ptr noundef @.str.6)
  %6 = load ptr, ptr %2, align 8
  call void @add_entry(ptr noundef %6, ptr noundef @.str.7, ptr noundef @.str.8)
  %7 = load ptr, ptr %2, align 8
  call void @print_diary(ptr noundef %7)
  %8 = load ptr, ptr %2, align 8
  call void @free_diary(ptr noundef %8)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
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
