; ModuleID = 'LLVM_IR/gemma7b-37933.ll'
source_filename = "DATASETv2/gemma7b-37933.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { [50 x i8], i32, double, ptr }

@.str = private unnamed_addr constant [42 x i8] c"Name: %s, Account No: %d, Balance: %.2lf\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Peter Pan\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createRecord(ptr noundef %0, i32 noundef %1, double noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 72) #4
  %5 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef %0) #5
  %8 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 1
  store i32 %1, ptr %8, align 4
  %9 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 2
  store double %2, ptr %9, align 8
  %10 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 3
  store ptr null, ptr %10, align 8
  ret ptr %4
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @addRecord(ptr noundef %0, ptr noundef %1, i32 noundef %2, double noundef %3) #0 {
  %5 = call ptr @createRecord(ptr noundef %1, i32 noundef %2, double noundef %3)
  %6 = icmp eq ptr %0, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %10

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.Record, ptr %5, i32 0, i32 3
  store ptr %0, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printRecords(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi ptr [ %0, %1 ], [ %13, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %14

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 0
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 2
  %10 = load double, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %6, i32 noundef %8, double noundef %10)
  %12 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  br label %2, !llvm.loop !6

14:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @addRecord(ptr noundef null, ptr noundef @.str.1, i32 noundef 123456, double noundef 1.000000e+03)
  call void @addRecord(ptr noundef null, ptr noundef @.str.2, i32 noundef 654321, double noundef 2.000000e+03)
  call void @addRecord(ptr noundef null, ptr noundef @.str.3, i32 noundef 321468, double noundef 3.000000e+03)
  call void @printRecords(ptr noundef null)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
