; ModuleID = 'LLVM_IR/gemma7b-36947.ll'
source_filename = "DATASETv2/gemma7b-36947.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { [50 x i8], i32, ptr }

@.str = private unnamed_addr constant [19 x i8] c"Name: %s, Age: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Record not found.\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Peter Pan\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @insertRecord(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 64) #5
  %5 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef %1) #6
  %8 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 1
  store i32 %2, ptr %8, align 4
  %9 = getelementptr inbounds %struct.Record, ptr %4, i32 0, i32 2
  store ptr null, ptr %9, align 8
  %10 = icmp eq ptr %0, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %14

12:                                               ; preds = %3
  %13 = getelementptr inbounds %struct.Record, ptr %0, i32 0, i32 2
  store ptr %4, ptr %13, align 8
  br label %14

14:                                               ; preds = %12, %11
  %.0 = phi ptr [ %4, %11 ], [ %0, %12 ]
  ret ptr %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @searchRecord(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.0 = phi ptr [ %0, %2 ], [ %18, %16 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 0
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = call i32 @strcmp(ptr noundef %7, ptr noundef %1) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %12, i32 noundef %14)
  br label %21

16:                                               ; preds = %5
  %17 = getelementptr inbounds %struct.Record, ptr %.0, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  br label %3, !llvm.loop !6

19:                                               ; preds = %3
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19, %10
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @insertRecord(ptr noundef null, ptr noundef @.str.2, i32 noundef 25)
  %2 = call ptr @insertRecord(ptr noundef null, ptr noundef @.str.3, i32 noundef 30)
  %3 = call ptr @insertRecord(ptr noundef null, ptr noundef @.str.4, i32 noundef 12)
  call void @searchRecord(ptr noundef null, ptr noundef @.str.3)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
