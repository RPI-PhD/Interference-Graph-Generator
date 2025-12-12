; ModuleID = 'DATASETv2/gemma7b-36947.c'
source_filename = "DATASETv2/gemma7b-36947.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { [50 x i8], i32, ptr }

@.str = private unnamed_addr constant [19 x i8] c"Name: %s, Age: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Record not found.\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Peter Pan\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @insertRecord(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 64) #5
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = getelementptr inbounds %struct.Record, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %5, align 8
  %13 = call ptr @strcpy(ptr noundef %11, ptr noundef %12) #6
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.Record, ptr %15, i32 0, i32 1
  store i32 %14, ptr %16, align 4
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.Record, ptr %17, i32 0, i32 2
  store ptr null, ptr %18, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %3
  %22 = load ptr, ptr %7, align 8
  store ptr %22, ptr %4, align 8
  br label %27

23:                                               ; preds = %3
  %24 = load ptr, ptr %7, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.Record, ptr %25, i32 0, i32 2
  store ptr %24, ptr %26, align 8
  br label %27

27:                                               ; preds = %23, %21
  %28 = load ptr, ptr %4, align 8
  ret ptr %28
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @searchRecord(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  br label %5

5:                                                ; preds = %23, %2
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %27

8:                                                ; preds = %5
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.Record, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %4, align 8
  %13 = call i32 @strcmp(ptr noundef %11, ptr noundef %12) #7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.Record, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.Record, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %18, i32 noundef %21)
  br label %29

23:                                               ; preds = %8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.Record, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %3, align 8
  br label %5, !llvm.loop !6

27:                                               ; preds = %5
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %29

29:                                               ; preds = %27, %15
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @insertRecord(ptr noundef %3, ptr noundef @.str.2, i32 noundef 25)
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @insertRecord(ptr noundef %5, ptr noundef @.str.3, i32 noundef 30)
  %7 = load ptr, ptr %2, align 8
  %8 = call ptr @insertRecord(ptr noundef %7, ptr noundef @.str.4, i32 noundef 12)
  %9 = load ptr, ptr %2, align 8
  call void @searchRecord(ptr noundef %9, ptr noundef @.str.3)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }
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
