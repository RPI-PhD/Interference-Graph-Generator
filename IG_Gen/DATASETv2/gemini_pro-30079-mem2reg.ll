; ModuleID = 'DATASETv2/gemini_pro-30079.ll'
source_filename = "DATASETv2/gemini_pro-30079.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.transaction = type { ptr, double, ptr }
%struct.personal_finance_planner = type { ptr, double, [100 x %struct.transaction], i32 }

@.str = private unnamed_addr constant [10 x i8] c"%s %f %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Bought groceries\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Groceries\00", align 1
@__const.main.transaction1 = private unnamed_addr constant %struct.transaction { ptr @.str.2, double -5.000000e+01, ptr @.str.3 }, align 8
@.str.4 = private unnamed_addr constant [16 x i8] c"Received salary\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Salary\00", align 1
@__const.main.transaction2 = private unnamed_addr constant %struct.transaction { ptr @.str.4, double 1.000000e+03, ptr @.str.5 }, align 8
@.str.6 = private unnamed_addr constant [10 x i8] c"Paid rent\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Rent\00", align 1
@__const.main.transaction3 = private unnamed_addr constant %struct.transaction { ptr @.str.6, double -5.000000e+02, ptr @.str.7 }, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_personal_finance_planner(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 2424) #6
  %3 = call i64 @strlen(ptr noundef %0) #7
  %4 = add i64 %3, 1
  %5 = call noalias ptr @malloc(i64 noundef %4) #6
  %6 = getelementptr inbounds %struct.personal_finance_planner, ptr %2, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = getelementptr inbounds %struct.personal_finance_planner, ptr %2, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = call ptr @strcpy(ptr noundef %8, ptr noundef %0) #8
  %10 = getelementptr inbounds %struct.personal_finance_planner, ptr %2, i32 0, i32 1
  store double 0.000000e+00, ptr %10, align 8
  %11 = getelementptr inbounds %struct.personal_finance_planner, ptr %2, i32 0, i32 3
  store i32 0, ptr %11, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_transaction(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %4 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 3
  %5 = load i32, ptr %4, align 8
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [100 x %struct.transaction], ptr %3, i64 0, i64 %6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %1, i64 24, i1 false)
  %8 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %8, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_transactions(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %23, %1
  %.0 = phi i32 [ 0, %1 ], [ %24, %23 ]
  %3 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 3
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %25

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.transaction], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.transaction, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.transaction], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.transaction, ptr %14, i32 0, i32 1
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x %struct.transaction], ptr %17, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.transaction, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %11, double noundef %16, ptr noundef %21)
  br label %23

23:                                               ; preds = %6
  %24 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

25:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_personal_finance_planner(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #8
  br label %4

4:                                                ; preds = %19, %1
  %.0 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %5 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 3
  %6 = load i32, ptr %5, align 8
  %7 = icmp slt i32 %.0, %6
  br i1 %7, label %8, label %21

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.transaction], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.transaction, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13) #8
  %14 = getelementptr inbounds %struct.personal_finance_planner, ptr %0, i32 0, i32 2
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [100 x %struct.transaction], ptr %14, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.transaction, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %18) #8
  br label %19

19:                                               ; preds = %8
  %20 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !8

21:                                               ; preds = %4
  call void @free(ptr noundef %0) #8
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.transaction, align 8
  %2 = alloca %struct.transaction, align 8
  %3 = alloca %struct.transaction, align 8
  %4 = call ptr @create_personal_finance_planner(ptr noundef @.str.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %1, ptr align 8 @__const.main.transaction1, i64 24, i1 false)
  call void @add_transaction(ptr noundef %4, ptr noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 @__const.main.transaction2, i64 24, i1 false)
  call void @add_transaction(ptr noundef %4, ptr noundef %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 @__const.main.transaction3, i64 24, i1 false)
  call void @add_transaction(ptr noundef %4, ptr noundef %3)
  call void @print_transactions(ptr noundef %4)
  call void @free_personal_finance_planner(ptr noundef %4)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }

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
