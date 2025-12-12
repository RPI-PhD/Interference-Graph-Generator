; ModuleID = 'DATASETv2/gemma7b-33594.c'
source_filename = "DATASETv2/gemma7b-33594.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.HotelManagementSystem = type { [50 x i8], i32, [50 x i8], i32, double }

@.str = private unnamed_addr constant [18 x i8] c"Enter your name: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"Enter your room number: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Enter your room type: \00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Enter the number of days you will be staying: \00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Standard\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Deluxe\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"Suite\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Guest Name: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [17 x i8] c"Room Number: %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Room Type: %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"Number of Days: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Total Cost: %.2lf\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_hotel_management_system_record() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 120) #4
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.HotelManagementSystem, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  store i8 0, ptr %5, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds %struct.HotelManagementSystem, ptr %6, i32 0, i32 1
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds %struct.HotelManagementSystem, ptr %8, i32 0, i32 2
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  store i8 0, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds %struct.HotelManagementSystem, ptr %11, i32 0, i32 3
  store i32 0, ptr %12, align 4
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds %struct.HotelManagementSystem, ptr %13, i32 0, i32 4
  store double 0.000000e+00, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  ret ptr %15
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_guest(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.HotelManagementSystem, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.HotelManagementSystem, ptr %9, i32 0, i32 1
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.HotelManagementSystem, ptr %13, i32 0, i32 2
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %15)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.HotelManagementSystem, ptr %18, i32 0, i32 3
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %19)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local double @calculate_total_cost(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %3, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.HotelManagementSystem, ptr %4, i32 0, i32 2
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 @strcmp(ptr noundef %6, ptr noundef @.str.6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store double 5.000000e+01, ptr %3, align 8
  br label %26

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.HotelManagementSystem, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef @.str.7) #5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  store double 7.500000e+01, ptr %3, align 8
  br label %25

17:                                               ; preds = %10
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.HotelManagementSystem, ptr %18, i32 0, i32 2
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef @.str.8) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  store double 1.000000e+02, ptr %3, align 8
  br label %24

24:                                               ; preds = %23, %17
  br label %25

25:                                               ; preds = %24, %16
  br label %26

26:                                               ; preds = %25, %9
  %27 = load double, ptr %3, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.HotelManagementSystem, ptr %28, i32 0, i32 3
  %30 = load i32, ptr %29, align 4
  %31 = sitofp i32 %30 to double
  %32 = fmul double %27, %31
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.HotelManagementSystem, ptr %33, i32 0, i32 4
  store double %32, ptr %34, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.HotelManagementSystem, ptr %35, i32 0, i32 4
  %37 = load double, ptr %36, align 8
  ret double %37
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_hotel_management_system_record(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.HotelManagementSystem, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.HotelManagementSystem, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.HotelManagementSystem, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.HotelManagementSystem, ptr %15, i32 0, i32 3
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %17)
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.HotelManagementSystem, ptr %19, i32 0, i32 4
  %21 = load double, ptr %20, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, double noundef %21)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @create_hotel_management_system_record()
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @add_guest(ptr noundef %4)
  %5 = load ptr, ptr %2, align 8
  %6 = call double @calculate_total_cost(ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  call void @display_hotel_management_system_record(ptr noundef %7)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
