; ModuleID = 'LLVM_IR/falcon180b-67052.ll'
source_filename = "DATASETv2/falcon180b-67052.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.subnet_t = type { [32 x i8], i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"Subnets:\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"%s (%d hosts)\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"Enter the number of subnets: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Error: Maximum number of subnets is %d.\0A\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"Enter the name of subnet %d: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"Enter the size of subnet %s: \00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"Error: Maximum subnet size is %d.\0A\00", align 1
@.str.9 = private unnamed_addr constant [50 x i8] c"Error: Total number of hosts must not exceed %d.\0A\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"Subnets created successfully!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_subnets(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %4

4:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.subnet_t, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.subnet_t, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [32 x i8], ptr %9, i64 0, i64 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.subnet_t, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.subnet_t, ptr %12, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %10, i32 noundef %14)
  br label %16

16:                                               ; preds = %6
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

18:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 10
  br i1 %5, label %6, label %8

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef 10)
  br label %64

8:                                                ; preds = %0
  %9 = load i32, ptr %1, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave.p0()
  %12 = alloca %struct.subnet_t, i64 %10, align 16
  br label %13

13:                                               ; preds = %54, %8
  %.02 = phi i32 [ 0, %8 ], [ %53, %54 ]
  %.01 = phi i32 [ 0, %8 ], [ %55, %54 ]
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %16, label %56

16:                                               ; preds = %13
  %17 = add nsw i32 %.01, 1
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %17)
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %19
  %21 = getelementptr inbounds %struct.subnet_t, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds [32 x i8], ptr %21, i64 0, i64 0
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %22)
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %24
  %26 = getelementptr inbounds %struct.subnet_t, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds [32 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %27)
  %29 = sext i32 %.01 to i64
  %30 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %29
  %31 = getelementptr inbounds %struct.subnet_t, ptr %30, i32 0, i32 1
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %31)
  %33 = sext i32 %.01 to i64
  %34 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %33
  %35 = getelementptr inbounds %struct.subnet_t, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp sgt i32 %36, 32
  br i1 %37, label %38, label %40

38:                                               ; preds = %16
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef 32)
  br label %63

40:                                               ; preds = %16
  %41 = sext i32 %.01 to i64
  %42 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %41
  %43 = getelementptr inbounds %struct.subnet_t, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 8
  %45 = sub nsw i32 %44, 2
  %46 = sext i32 %.01 to i64
  %47 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %46
  %48 = getelementptr inbounds %struct.subnet_t, ptr %47, i32 0, i32 2
  store i32 %45, ptr %48, align 4
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %49
  %51 = getelementptr inbounds %struct.subnet_t, ptr %50, i32 0, i32 2
  %52 = load i32, ptr %51, align 4
  %53 = add nsw i32 %.02, %52
  br label %54

54:                                               ; preds = %40
  %55 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !8

56:                                               ; preds = %13
  %57 = icmp sgt i32 %.02, 100
  br i1 %57, label %58, label %60

58:                                               ; preds = %56
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 100)
  br label %63

60:                                               ; preds = %56
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %62 = load i32, ptr %1, align 4
  call void @print_subnets(ptr noundef %12, i32 noundef %62)
  br label %63

63:                                               ; preds = %60, %58, %38
  %.0 = phi i32 [ 1, %38 ], [ 1, %58 ], [ 0, %60 ]
  call void @llvm.stackrestore.p0(ptr %11)
  br label %64

64:                                               ; preds = %63, %6
  %.1 = phi i32 [ 1, %6 ], [ %.0, %63 ]
  ret i32 %.1
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }

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
