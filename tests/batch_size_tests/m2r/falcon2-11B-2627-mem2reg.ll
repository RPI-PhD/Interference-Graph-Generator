; ModuleID = 'LLVM_IR/falcon2-11B-2627.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_hotel(ptr noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 112) #4
  %5 = getelementptr inbounds %struct.hotel, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef %0) #5
  %8 = getelementptr inbounds %struct.hotel, ptr %4, i32 0, i32 1
  store i32 %1, ptr %8, align 4
  %9 = getelementptr inbounds %struct.hotel, ptr %4, i32 0, i32 2
  store float %2, ptr %9, align 4
  %10 = getelementptr inbounds %struct.hotel, ptr %4, i32 0, i32 3
  store i32 0, ptr %10, align 4
  ret ptr %4
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_hotel(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  %5 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6)
  %8 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 2
  %9 = load float, ptr %8, align 4
  %10 = fpext float %9 to double
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %10)
  %12 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %13, i32 noundef %15)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @book_room(ptr noundef %0, i32 noundef %1) #0 {
  %3 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %9, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %1)
  br label %15

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %15

15:                                               ; preds = %13, %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @check_out(ptr noundef %0, i32 noundef %1) #0 {
  %3 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, ptr %7, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %1)
  br label %13

11:                                               ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %13

13:                                               ; preds = %11, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @calculate_price(ptr noundef %0, i32 noundef %1) #0 {
  %3 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 2
  %4 = load float, ptr %3, align 4
  %5 = getelementptr inbounds %struct.hotel, ptr %0, i32 0, i32 3
  %6 = load i32, ptr %5, align 4
  %7 = sitofp i32 %6 to float
  %8 = fdiv float %7, 1.000000e+02
  %9 = fadd float 1.000000e+00, %8
  %10 = fmul float %4, %9
  %11 = sitofp i32 %1 to float
  %12 = fmul float %11, %10
  ret float %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_bill(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call float @calculate_price(ptr noundef %0, i32 noundef %1)
  %4 = fpext float %3 to double
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_hotel(ptr noundef @.str.9, i32 noundef 100, float noundef 1.000000e+02)
  call void @display_hotel(ptr noundef %1)
  call void @book_room(ptr noundef %1, i32 noundef 101)
  call void @book_room(ptr noundef %1, i32 noundef 102)
  call void @check_out(ptr noundef %1, i32 noundef 101)
  call void @check_out(ptr noundef %1, i32 noundef 102)
  %2 = call float @calculate_price(ptr noundef %1, i32 noundef 10)
  call void @print_bill(ptr noundef %1, i32 noundef 10)
  call void @free(ptr noundef %1) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

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
