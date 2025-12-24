; ModuleID = 'LLVM_IR/gemini_pro-15071.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_diary() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 1608) #5
  %2 = getelementptr inbounds %struct.DigitalDiary, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 8
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_entry(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %45

7:                                                ; preds = %3
  %8 = call i64 @strlen(ptr noundef %1) #6
  %9 = add i64 %8, 1
  %10 = call noalias ptr @malloc(i64 noundef %9) #5
  %11 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %12 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %11, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 0
  store ptr %10, ptr %16, align 8
  %17 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %18 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %19 = load i32, ptr %18, align 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %17, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = call ptr @strcpy(ptr noundef %23, ptr noundef %1) #7
  %25 = call i64 @strlen(ptr noundef %2) #6
  %26 = add i64 %25, 1
  %27 = call noalias ptr @malloc(i64 noundef %26) #5
  %28 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %29 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %28, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.DiaryEntry, ptr %32, i32 0, i32 1
  store ptr %27, ptr %33, align 8
  %34 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %35 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %34, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.DiaryEntry, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = call ptr @strcpy(ptr noundef %40, ptr noundef %2) #7
  %42 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %43 = load i32, ptr %42, align 8
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %42, align 8
  br label %45

45:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_diary(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %20, %1
  %.0 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %3 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %22

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.DiaryEntry, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %11)
  %13 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %13, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %20

20:                                               ; preds = %6
  %21 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

22:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_diary(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %17, %1
  %.0 = phi i32 [ 0, %1 ], [ %18, %17 ]
  %3 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %19

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.DiaryEntry, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %11) #7
  %12 = getelementptr inbounds %struct.DigitalDiary, ptr %0, i32 0, i32 0
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.DiaryEntry, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16) #7
  br label %17

17:                                               ; preds = %6
  %18 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

19:                                               ; preds = %2
  call void @free(ptr noundef %0) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_diary()
  call void @add_entry(ptr noundef %1, ptr noundef @.str.3, ptr noundef @.str.4)
  call void @add_entry(ptr noundef %1, ptr noundef @.str.5, ptr noundef @.str.6)
  call void @add_entry(ptr noundef %1, ptr noundef @.str.7, ptr noundef @.str.8)
  call void @print_diary(ptr noundef %1)
  call void @free_diary(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
