; ModuleID = 'DATASETv2/falcon2-11B-2627.c'
source_filename = "DATASETv2/falcon2-11B-2627.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hotel = type { [100 x i8], i32, float, i32 }

@.str = private unnamed_addr constant [16 x i8] c"Hotel Name: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"Capacity: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Price: $%.2f\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Occupancy: %d/%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Room %d has been booked.\0A\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"Hotel is full.\0A\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Room %d has been checked out.\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"No rooms available.\0A\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"Total Price: $%.2f\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"ABC Hotel\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_hotel(ptr noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store float %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 112) #4
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = getelementptr inbounds %struct.hotel, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [100 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %4, align 8
  %13 = call ptr @strcpy(ptr noundef %11, ptr noundef %12) #5
  %14 = load i32, ptr %5, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.hotel, ptr %15, i32 0, i32 1
  store i32 %14, ptr %16, align 4
  %17 = load float, ptr %6, align 4
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct.hotel, ptr %18, i32 0, i32 2
  store float %17, ptr %19, align 4
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.hotel, ptr %20, i32 0, i32 3
  store i32 0, ptr %21, align 4
  %22 = load ptr, ptr %7, align 8
  ret ptr %22
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_hotel(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.hotel, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.hotel, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.hotel, ptr %11, i32 0, i32 2
  %13 = load float, ptr %12, align 4
  %14 = fpext float %13 to double
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %14)
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.hotel, ptr %16, i32 0, i32 3
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.hotel, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %18, i32 noundef %21)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @book_room(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.hotel, ptr %5, i32 0, i32 3
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.hotel, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.hotel, ptr %13, i32 0, i32 3
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 4
  %17 = load i32, ptr %4, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %17)
  br label %21

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %21

21:                                               ; preds = %19, %12
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @check_out(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.hotel, ptr %5, i32 0, i32 3
  %7 = load i32, ptr %6, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.hotel, ptr %10, i32 0, i32 3
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, ptr %11, align 4
  %14 = load i32, ptr %4, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %14)
  br label %18

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %18

18:                                               ; preds = %16, %9
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local float @calculate_price(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.hotel, ptr %6, i32 0, i32 2
  %8 = load float, ptr %7, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.hotel, ptr %9, i32 0, i32 3
  %11 = load i32, ptr %10, align 4
  %12 = sitofp i32 %11 to float
  %13 = fdiv float %12, 1.000000e+02
  %14 = fadd float 1.000000e+00, %13
  %15 = fmul float %8, %14
  store float %15, ptr %5, align 4
  %16 = load i32, ptr %4, align 4
  %17 = sitofp i32 %16 to float
  %18 = load float, ptr %5, align 4
  %19 = fmul float %17, %18
  ret float %19
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_bill(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call float @calculate_price(ptr noundef %6, i32 noundef %7)
  store float %8, ptr %5, align 4
  %9 = load float, ptr %5, align 4
  %10 = fpext float %9 to double
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %10)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  store i32 0, ptr %1, align 4
  %5 = call ptr @create_hotel(ptr noundef @.str.9, i32 noundef 100, float noundef 1.000000e+02)
  store ptr %5, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  call void @display_hotel(ptr noundef %6)
  %7 = load ptr, ptr %2, align 8
  call void @book_room(ptr noundef %7, i32 noundef 101)
  %8 = load ptr, ptr %2, align 8
  call void @book_room(ptr noundef %8, i32 noundef 102)
  %9 = load ptr, ptr %2, align 8
  call void @check_out(ptr noundef %9, i32 noundef 101)
  %10 = load ptr, ptr %2, align 8
  call void @check_out(ptr noundef %10, i32 noundef 102)
  store i32 10, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = call float @calculate_price(ptr noundef %11, i32 noundef %12)
  store float %13, ptr %4, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %3, align 4
  call void @print_bill(ptr noundef %14, i32 noundef %15)
  %16 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %16) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

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
