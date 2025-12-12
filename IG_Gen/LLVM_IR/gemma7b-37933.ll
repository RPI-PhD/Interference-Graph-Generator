; ModuleID = 'DATASETv2/gemma7b-37933.c'
source_filename = "DATASETv2/gemma7b-37933.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { [50 x i8], i32, double, ptr }

@.str = private unnamed_addr constant [42 x i8] c"Name: %s, Account No: %d, Balance: %.2lf\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Peter Pan\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createRecord(ptr noundef %0, i32 noundef %1, double noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store double %2, ptr %6, align 8
  %8 = call noalias ptr @malloc(i64 noundef 72) #4
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = getelementptr inbounds %struct.Record, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %4, align 8
  %13 = call ptr @strcpy(ptr noundef %11, ptr noundef %12) #5
  %14 = load i32, ptr %5, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.Record, ptr %15, i32 0, i32 1
  store i32 %14, ptr %16, align 4
  %17 = load double, ptr %6, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct.Record, ptr %18, i32 0, i32 2
  store double %17, ptr %19, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.Record, ptr %20, i32 0, i32 3
  store ptr null, ptr %21, align 8
  %22 = load ptr, ptr %7, align 8
  ret ptr %22
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addRecord(ptr noundef %0, ptr noundef %1, i32 noundef %2, double noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store double %3, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i32, ptr %7, align 4
  %12 = load double, ptr %8, align 8
  %13 = call ptr @createRecord(ptr noundef %10, i32 noundef %11, double noundef %12)
  store ptr %13, ptr %9, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %4
  %17 = load ptr, ptr %9, align 8
  store ptr %17, ptr %5, align 8
  br label %23

18:                                               ; preds = %4
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %9, align 8
  %21 = getelementptr inbounds %struct.Record, ptr %20, i32 0, i32 3
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %9, align 8
  store ptr %22, ptr %5, align 8
  br label %23

23:                                               ; preds = %18, %16
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printRecords(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %6, %1
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %20

6:                                                ; preds = %3
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Record, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.Record, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Record, ptr %13, i32 0, i32 2
  %15 = load double, ptr %14, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %9, i32 noundef %12, double noundef %15)
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.Record, ptr %17, i32 0, i32 3
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %2, align 8
  br label %3, !llvm.loop !6

20:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @addRecord(ptr noundef %3, ptr noundef @.str.1, i32 noundef 123456, double noundef 1.000000e+03)
  %4 = load ptr, ptr %2, align 8
  call void @addRecord(ptr noundef %4, ptr noundef @.str.2, i32 noundef 654321, double noundef 2.000000e+03)
  %5 = load ptr, ptr %2, align 8
  call void @addRecord(ptr noundef %5, ptr noundef @.str.3, i32 noundef 321468, double noundef 3.000000e+03)
  %6 = load ptr, ptr %2, align 8
  call void @printRecords(ptr noundef %6)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
