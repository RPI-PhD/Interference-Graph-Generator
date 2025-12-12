; ModuleID = 'DATASETv2/falcon180b-67052.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_subnets(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %25, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.subnet_t, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.subnet_t, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.subnet_t, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %17, i32 noundef %23)
  br label %25

25:                                               ; preds = %11
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %7, !llvm.loop !6

28:                                               ; preds = %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %2)
  %10 = load i32, ptr %2, align 4
  %11 = icmp sgt i32 %10, 10
  br i1 %11, label %12, label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef 10)
  store i32 1, ptr %1, align 4
  br label %83

14:                                               ; preds = %0
  %15 = load i32, ptr %2, align 4
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave.p0()
  store ptr %17, ptr %3, align 8
  %18 = alloca %struct.subnet_t, i64 %16, align 16
  store i64 %16, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %70, %14
  %20 = load i32, ptr %6, align 4
  %21 = load i32, ptr %2, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %73

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %25)
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %28
  %30 = getelementptr inbounds %struct.subnet_t, ptr %29, i32 0, i32 0
  %31 = getelementptr inbounds [32 x i8], ptr %30, i64 0, i64 0
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %31)
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %34
  %36 = getelementptr inbounds %struct.subnet_t, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds [32 x i8], ptr %36, i64 0, i64 0
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %37)
  %39 = load i32, ptr %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %40
  %42 = getelementptr inbounds %struct.subnet_t, ptr %41, i32 0, i32 1
  %43 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %42)
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %45
  %47 = getelementptr inbounds %struct.subnet_t, ptr %46, i32 0, i32 1
  %48 = load i32, ptr %47, align 8
  %49 = icmp sgt i32 %48, 32
  br i1 %49, label %50, label %52

50:                                               ; preds = %23
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef 32)
  store i32 1, ptr %1, align 4
  store i32 1, ptr %7, align 4
  br label %81

52:                                               ; preds = %23
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %54
  %56 = getelementptr inbounds %struct.subnet_t, ptr %55, i32 0, i32 1
  %57 = load i32, ptr %56, align 8
  %58 = sub nsw i32 %57, 2
  %59 = load i32, ptr %6, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %60
  %62 = getelementptr inbounds %struct.subnet_t, ptr %61, i32 0, i32 2
  store i32 %58, ptr %62, align 4
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.subnet_t, ptr %18, i64 %64
  %66 = getelementptr inbounds %struct.subnet_t, ptr %65, i32 0, i32 2
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %5, align 4
  br label %70

70:                                               ; preds = %52
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %6, align 4
  br label %19, !llvm.loop !8

73:                                               ; preds = %19
  %74 = load i32, ptr %5, align 4
  %75 = icmp sgt i32 %74, 100
  br i1 %75, label %76, label %78

76:                                               ; preds = %73
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 100)
  store i32 1, ptr %1, align 4
  store i32 1, ptr %7, align 4
  br label %81

78:                                               ; preds = %73
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %80 = load i32, ptr %2, align 4
  call void @print_subnets(ptr noundef %18, i32 noundef %80)
  store i32 0, ptr %1, align 4
  store i32 1, ptr %7, align 4
  br label %81

81:                                               ; preds = %78, %76, %50
  %82 = load ptr, ptr %3, align 8
  call void @llvm.stackrestore.p0(ptr %82)
  br label %83

83:                                               ; preds = %81, %12
  %84 = load i32, ptr %1, align 4
  ret i32 %84
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
