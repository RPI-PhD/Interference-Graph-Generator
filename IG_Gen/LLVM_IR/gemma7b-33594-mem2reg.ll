; ModuleID = 'LLVM_IR/gemma7b-33594.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_hotel_management_system_record() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 120) #4
  %2 = getelementptr inbounds %struct.HotelManagementSystem, ptr %1, i32 0, i32 0
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  store i8 0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.HotelManagementSystem, ptr %1, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.HotelManagementSystem, ptr %1, i32 0, i32 2
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  store i8 0, ptr %6, align 8
  %7 = getelementptr inbounds %struct.HotelManagementSystem, ptr %1, i32 0, i32 3
  store i32 0, ptr %7, align 4
  %8 = getelementptr inbounds %struct.HotelManagementSystem, ptr %1, i32 0, i32 4
  store double 0.000000e+00, ptr %8, align 8
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_guest(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %7 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 1
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %10 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 2
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %14 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 3
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %14)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @calculate_total_cost(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 2
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 @strcmp(ptr noundef %3, ptr noundef @.str.6) #5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %21

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.7) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %7
  br label %20

13:                                               ; preds = %7
  %14 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 2
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 @strcmp(ptr noundef %15, ptr noundef @.str.8) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %13
  br label %19

19:                                               ; preds = %18, %13
  %.0 = phi double [ 1.000000e+02, %18 ], [ 0.000000e+00, %13 ]
  br label %20

20:                                               ; preds = %19, %12
  %.1 = phi double [ 7.500000e+01, %12 ], [ %.0, %19 ]
  br label %21

21:                                               ; preds = %20, %6
  %.2 = phi double [ 5.000000e+01, %6 ], [ %.1, %20 ]
  %22 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 3
  %23 = load i32, ptr %22, align 4
  %24 = sitofp i32 %23 to double
  %25 = fmul double %.2, %24
  %26 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 4
  store double %25, ptr %26, align 8
  %27 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 4
  %28 = load double, ptr %27, align 8
  ret double %28
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_hotel_management_system_record(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %3)
  %5 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %6)
  %8 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %9)
  %11 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 3
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %12)
  %14 = getelementptr inbounds %struct.HotelManagementSystem, ptr %0, i32 0, i32 4
  %15 = load double, ptr %14, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, double noundef %15)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_hotel_management_system_record()
  call void @add_guest(ptr noundef %1)
  %2 = call double @calculate_total_cost(ptr noundef %1)
  call void @display_hotel_management_system_record(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
