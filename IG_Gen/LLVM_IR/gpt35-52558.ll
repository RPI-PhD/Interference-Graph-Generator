; ModuleID = 'DATASETv2/gpt35-52558.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_contact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.contact, ptr %6, i64 %9
  %11 = getelementptr inbounds %struct.contact, ptr %10, i32 0, i32 0
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.contact, ptr %14, i64 %17
  %19 = getelementptr inbounds %struct.contact, ptr %18, i32 0, i32 1
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.contact, ptr %22, i64 %25
  %27 = getelementptr inbounds %struct.contact, ptr %26, i32 0, i32 2
  %28 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %27)
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %29, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @delete_contact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [50 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %10 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %10)
  store i32 -1, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %12

12:                                               ; preds = %30, %2
  %13 = load i32, ptr %7, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %14, align 4
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %33

17:                                               ; preds = %12
  %18 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.contact, ptr %19, i64 %21
  %23 = getelementptr inbounds %struct.contact, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [50 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 @strcmp(ptr noundef %18, ptr noundef %24) #5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %17
  %28 = load i32, ptr %7, align 4
  store i32 %28, ptr %6, align 4
  br label %33

29:                                               ; preds = %17
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %7, align 4
  br label %12, !llvm.loop !6

33:                                               ; preds = %27, %12
  %34 = load i32, ptr %6, align 4
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %64

38:                                               ; preds = %33
  %39 = load i32, ptr %6, align 4
  store i32 %39, ptr %8, align 4
  br label %40

40:                                               ; preds = %56, %38
  %41 = load i32, ptr %8, align 4
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %43, 1
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %59

46:                                               ; preds = %40
  %47 = load ptr, ptr %3, align 8
  %48 = load i32, ptr %8, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.contact, ptr %47, i64 %49
  %51 = load ptr, ptr %3, align 8
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %52, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.contact, ptr %51, i64 %54
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %50, ptr align 1 %55, i64 120, i1 false)
  br label %56

56:                                               ; preds = %46
  %57 = load i32, ptr %8, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %8, align 4
  br label %40, !llvm.loop !8

59:                                               ; preds = %40
  %60 = load ptr, ptr %4, align 8
  %61 = load i32, ptr %60, align 4
  %62 = add nsw i32 %61, -1
  store i32 %62, ptr %60, align 4
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %64

64:                                               ; preds = %59, %36
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_contact(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %33, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %36

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.contact, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.contact, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %16)
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.contact, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.contact, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [20 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.contact, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.contact, ptr %28, i32 0, i32 2
  %30 = getelementptr inbounds [50 x i8], ptr %29, i64 0, i64 0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %33

33:                                               ; preds = %10
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %6, !llvm.loop !9

36:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [100 x %struct.contact], align 16
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %0, %24
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.18, ptr noundef %2)
  %13 = load i32, ptr %2, align 4
  switch i32 %13, label %22 [
    i32 1, label %14
    i32 2, label %16
    i32 3, label %18
    i32 4, label %21
  ]

14:                                               ; preds = %5
  %15 = getelementptr inbounds [100 x %struct.contact], ptr %4, i64 0, i64 0
  call void @add_contact(ptr noundef %15, ptr noundef %3)
  br label %24

16:                                               ; preds = %5
  %17 = getelementptr inbounds [100 x %struct.contact], ptr %4, i64 0, i64 0
  call void @delete_contact(ptr noundef %17, ptr noundef %3)
  br label %24

18:                                               ; preds = %5
  %19 = getelementptr inbounds [100 x %struct.contact], ptr %4, i64 0, i64 0
  %20 = load i32, ptr %3, align 4
  call void @display_contact(ptr noundef %19, i32 noundef %20)
  br label %24

21:                                               ; preds = %5
  call void @exit(i32 noundef 0) #6
  unreachable

22:                                               ; preds = %5
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %24

24:                                               ; preds = %22, %18, %16, %14
  br label %5
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
