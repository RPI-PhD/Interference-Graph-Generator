; ModuleID = 'LLVM_IR/gpt35-52558.ll'
source_filename = "DATASETv2/gpt35-52558.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.contact = type { [50 x i8], [20 x i8], [50 x i8] }

@.str = private unnamed_addr constant [21 x i8] c"Enter contact name: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Enter phone number: \00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Enter email: \00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Contact added successfully.\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Enter contact name to delete: \00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Contact not found.\0A\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"Contact deleted successfully.\0A\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"Name: %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"Phone Number: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"Email: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"Cyberpunk Phone Book Menu\0A\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"1. Add Contact\0A\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"2. Delete Contact\0A\00", align 1
@.str.15 = private unnamed_addr constant [21 x i8] c"3. Display Contacts\0A\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"4. Exit\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [15 x i8] c"Enter option: \00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.19 = private unnamed_addr constant [17 x i8] c"Invalid option.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_contact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %struct.contact, ptr %0, i64 %5
  %7 = getelementptr inbounds %struct.contact, ptr %6, i32 0, i32 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = load i32, ptr %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.contact, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.contact, ptr %12, i32 0, i32 1
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.contact, ptr %0, i64 %17
  %19 = getelementptr inbounds %struct.contact, ptr %18, i32 0, i32 2
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %19)
  %21 = load i32, ptr %1, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %1, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @delete_contact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [50 x i8], align 16
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %5 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %5)
  br label %7

7:                                                ; preds = %20, %2
  %.01 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %.01, %8
  br i1 %9, label %10, label %22

10:                                               ; preds = %7
  %11 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds %struct.contact, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.contact, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 @strcmp(ptr noundef %11, ptr noundef %15) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %10
  br label %22

19:                                               ; preds = %10
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.01, 1
  br label %7, !llvm.loop !6

22:                                               ; preds = %18, %7
  %.02 = phi i32 [ %.01, %18 ], [ -1, %7 ]
  %23 = icmp eq i32 %.02, -1
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %43

26:                                               ; preds = %22
  br label %27

27:                                               ; preds = %37, %26
  %.0 = phi i32 [ %.02, %26 ], [ %38, %37 ]
  %28 = load i32, ptr %1, align 4
  %29 = sub nsw i32 %28, 1
  %30 = icmp slt i32 %.0, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds %struct.contact, ptr %0, i64 %32
  %34 = add nsw i32 %.0, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.contact, ptr %0, i64 %35
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %33, ptr align 1 %36, i64 120, i1 false)
  br label %37

37:                                               ; preds = %31
  %38 = add nsw i32 %.0, 1
  br label %27, !llvm.loop !8

39:                                               ; preds = %27
  %40 = load i32, ptr %1, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, ptr %1, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %43

43:                                               ; preds = %39, %24
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_contact(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %22, %2
  %.0 = phi i32 [ 0, %2 ], [ %23, %22 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %24

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.contact, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.contact, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %9)
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.contact, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.contact, ptr %12, i32 0, i32 1
  %14 = getelementptr inbounds [20 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %14)
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds %struct.contact, ptr %0, i64 %16
  %18 = getelementptr inbounds %struct.contact, ptr %17, i32 0, i32 2
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %22

22:                                               ; preds = %5
  %23 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

24:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x %struct.contact], align 16
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %23, %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.18, ptr noundef %1)
  %12 = load i32, ptr %1, align 4
  switch i32 %12, label %21 [
    i32 1, label %13
    i32 2, label %15
    i32 3, label %17
    i32 4, label %20
  ]

13:                                               ; preds = %4
  %14 = getelementptr inbounds [100 x %struct.contact], ptr %3, i64 0, i64 0
  call void @add_contact(ptr noundef %14, ptr noundef %2)
  br label %23

15:                                               ; preds = %4
  %16 = getelementptr inbounds [100 x %struct.contact], ptr %3, i64 0, i64 0
  call void @delete_contact(ptr noundef %16, ptr noundef %2)
  br label %23

17:                                               ; preds = %4
  %18 = getelementptr inbounds [100 x %struct.contact], ptr %3, i64 0, i64 0
  %19 = load i32, ptr %2, align 4
  call void @display_contact(ptr noundef %18, i32 noundef %19)
  br label %23

20:                                               ; preds = %4
  call void @exit(i32 noundef 0) #6
  unreachable

21:                                               ; preds = %4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %23

23:                                               ; preds = %21, %17, %15, %13
  br label %4
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { noreturn nounwind }

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
