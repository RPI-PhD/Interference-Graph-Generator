; ModuleID = 'LLVM_IR/gpt4o_mini-2225.ll'
source_filename = "DATASETv2/gpt4o_mini-2225.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Appointment = type { [11 x i8], [6 x i8], [256 x i8] }

@appointment_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [46 x i8] c"Cannot add more appointments, limit reached!\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Enter the date (YYYY-MM-DD): \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%10s\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Enter the time (HH:MM): \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%5s\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"Enter appointment description: \00", align 1
@stdin = external global ptr, align 8
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@appointments = dso_local global [100 x %struct.Appointment] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [33 x i8] c"Appointment added successfully!\0A\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"No appointments scheduled.\0A\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"\0AScheduled Appointments:\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"%d. %s at %s: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [41 x i8] c"Enter the appointment number to remove: \00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.13 = private unnamed_addr constant [29 x i8] c"Invalid appointment number!\0A\00", align 1
@.str.14 = private unnamed_addr constant [35 x i8] c"Appointment removed successfully!\0A\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"appointments.txt\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.17 = private unnamed_addr constant [33 x i8] c"Error opening file for writing!\0A\00", align 1
@.str.18 = private unnamed_addr constant [10 x i8] c"%s,%s,%s\0A\00", align 1
@.str.19 = private unnamed_addr constant [42 x i8] c"Appointments saved to file successfully!\0A\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.21 = private unnamed_addr constant [45 x i8] c"No appointments file found. Starting fresh!\0A\00", align 1
@.str.22 = private unnamed_addr constant [25 x i8] c"%10[^,],%5[^,],%255[^\0A]\0A\00", align 1
@.str.23 = private unnamed_addr constant [35 x i8] c"Appointments loaded successfully!\0A\00", align 1
@.str.24 = private unnamed_addr constant [24 x i8] c"\0AAppointment Scheduler\0A\00", align 1
@.str.25 = private unnamed_addr constant [20 x i8] c"1. Add Appointment\0A\00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"2. List Appointments\0A\00", align 1
@.str.27 = private unnamed_addr constant [23 x i8] c"3. Remove Appointment\0A\00", align 1
@.str.28 = private unnamed_addr constant [22 x i8] c"4. Save Appointments\0A\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.31 = private unnamed_addr constant [33 x i8] c"Exiting the scheduler. Goodbye!\0A\00", align 1
@.str.32 = private unnamed_addr constant [35 x i8] c"Invalid choice! Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_appointment() #0 {
  %1 = alloca %struct.Appointment, align 1
  %2 = load i32, ptr @appointment_count, align 4
  %3 = icmp sge i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %31

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = getelementptr inbounds %struct.Appointment, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds [11 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %12 = getelementptr inbounds %struct.Appointment, ptr %1, i32 0, i32 1
  %13 = getelementptr inbounds [6 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %16 = call i32 @getchar()
  %17 = getelementptr inbounds %struct.Appointment, ptr %1, i32 0, i32 2
  %18 = getelementptr inbounds [256 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr @stdin, align 8
  %20 = call ptr @fgets(ptr noundef %18, i32 noundef 256, ptr noundef %19)
  %21 = getelementptr inbounds %struct.Appointment, ptr %1, i32 0, i32 2
  %22 = getelementptr inbounds %struct.Appointment, ptr %1, i32 0, i32 2
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i64 @strcspn(ptr noundef %23, ptr noundef @.str.6) #4
  %25 = getelementptr inbounds [256 x i8], ptr %21, i64 0, i64 %24
  store i8 0, ptr %25, align 1
  %26 = load i32, ptr @appointment_count, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr @appointment_count, align 4
  %28 = sext i32 %26 to i64
  %29 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %28
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %29, ptr align 1 %1, i64 273, i1 false)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %31

31:                                               ; preds = %6, %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @list_appointments() #0 {
  %1 = load i32, ptr @appointment_count, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %27

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %7

7:                                                ; preds = %25, %5
  %.0 = phi i32 [ 0, %5 ], [ %26, %25 ]
  %8 = load i32, ptr @appointment_count, align 4
  %9 = icmp slt i32 %.0, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Appointment, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [11 x i8], ptr %14, i64 0, i64 0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Appointment, ptr %17, i32 0, i32 1
  %19 = getelementptr inbounds [6 x i8], ptr %18, i64 0, i64 0
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Appointment, ptr %21, i32 0, i32 2
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %11, ptr noundef %15, ptr noundef %19, ptr noundef %23)
  br label %25

25:                                               ; preds = %10
  %26 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

27:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_appointment() #0 {
  %1 = alloca i32, align 4
  call void @list_appointments()
  %2 = load i32, ptr @appointment_count, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  br label %35

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %1)
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %14, label %10

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4
  %12 = load i32, ptr @appointment_count, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %10, %5
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %35

16:                                               ; preds = %10
  %17 = load i32, ptr %1, align 4
  %18 = sub nsw i32 %17, 1
  br label %19

19:                                               ; preds = %29, %16
  %.0 = phi i32 [ %18, %16 ], [ %30, %29 ]
  %20 = load i32, ptr @appointment_count, align 4
  %21 = sub nsw i32 %20, 1
  %22 = icmp slt i32 %.0, %21
  br i1 %22, label %23, label %31

23:                                               ; preds = %19
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %24
  %26 = add nsw i32 %.0, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %27
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %25, ptr align 1 %28, i64 273, i1 false)
  br label %29

29:                                               ; preds = %23
  %30 = add nsw i32 %.0, 1
  br label %19, !llvm.loop !8

31:                                               ; preds = %19
  %32 = load i32, ptr @appointment_count, align 4
  %33 = add nsw i32 %32, -1
  store i32 %33, ptr @appointment_count, align 4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %35

35:                                               ; preds = %31, %14, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @save_appointments_to_file() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.16)
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %28

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %23, %5
  %.0 = phi i32 [ 0, %5 ], [ %24, %23 ]
  %7 = load i32, ptr @appointment_count, align 4
  %8 = icmp slt i32 %.0, %7
  br i1 %8, label %9, label %25

9:                                                ; preds = %6
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Appointment, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [11 x i8], ptr %12, i64 0, i64 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Appointment, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [6 x i8], ptr %16, i64 0, i64 0
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Appointment, ptr %19, i32 0, i32 2
  %21 = getelementptr inbounds [256 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.18, ptr noundef %13, ptr noundef %17, ptr noundef %21)
  br label %23

23:                                               ; preds = %9
  %24 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !9

25:                                               ; preds = %6
  %26 = call i32 @fclose(ptr noundef %1)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %28

28:                                               ; preds = %25, %3
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @load_appointments_from_file() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.20)
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %34

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %30, %5
  %7 = load i32, ptr @appointment_count, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Appointment, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [11 x i8], ptr %10, i64 0, i64 0
  %12 = load i32, ptr @appointment_count, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Appointment, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [6 x i8], ptr %15, i64 0, i64 0
  %17 = load i32, ptr @appointment_count, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x %struct.Appointment], ptr @appointments, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Appointment, ptr %19, i32 0, i32 2
  %21 = getelementptr inbounds [256 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %1, ptr noundef @.str.22, ptr noundef %11, ptr noundef %16, ptr noundef %21)
  %23 = icmp eq i32 %22, 3
  br i1 %23, label %24, label %31

24:                                               ; preds = %6
  %25 = load i32, ptr @appointment_count, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr @appointment_count, align 4
  %27 = load i32, ptr @appointment_count, align 4
  %28 = icmp sge i32 %27, 100
  br i1 %28, label %29, label %30

29:                                               ; preds = %24
  br label %31

30:                                               ; preds = %24
  br label %6, !llvm.loop !10

31:                                               ; preds = %29, %6
  %32 = call i32 @fclose(ptr noundef %1)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %34

34:                                               ; preds = %31, %3
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @load_appointments_from_file()
  br label %2

2:                                                ; preds = %20, %0
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %1)
  %11 = load i32, ptr %1, align 4
  switch i32 %11, label %18 [
    i32 1, label %12
    i32 2, label %13
    i32 3, label %14
    i32 4, label %15
    i32 5, label %16
  ]

12:                                               ; preds = %2
  call void @add_appointment()
  br label %20

13:                                               ; preds = %2
  call void @list_appointments()
  br label %20

14:                                               ; preds = %2
  call void @remove_appointment()
  br label %20

15:                                               ; preds = %2
  call void @save_appointments_to_file()
  br label %20

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  call void @save_appointments_to_file()
  ret i32 0

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %20

20:                                               ; preds = %18, %15, %14, %13, %12
  br label %2
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) }

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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
