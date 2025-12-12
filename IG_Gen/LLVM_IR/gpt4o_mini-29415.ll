; ModuleID = 'DATASETv2/gpt4o_mini-29415.c'
source_filename = "DATASETv2/gpt4o_mini-29415.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Contact = type { [50 x i8], [15 x i8], ptr }

@head = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [24 x i8] c"Contact added: %s - %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"No contacts available.\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Phone Book Contacts:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Name: %s, Phone: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Found Contact: %s - %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"Contact not found: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Contact deleted: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"\0APhone Book Menu:\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"1. Add Contact\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"2. Display Contacts\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"3. Search Contact\0A\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"4. Delete Contact\0A\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Select an option: \00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"Enter Name: \00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.17 = private unnamed_addr constant [14 x i8] c"Enter Phone: \00", align 1
@.str.18 = private unnamed_addr constant [23 x i8] c"Enter Name to search: \00", align 1
@.str.19 = private unnamed_addr constant [23 x i8] c"Enter Name to delete: \00", align 1
@.str.20 = private unnamed_addr constant [25 x i8] c"Exiting the phone book.\0A\00", align 1
@.str.21 = private unnamed_addr constant [35 x i8] c"Invalid option. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addContact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call noalias ptr @malloc(i64 noundef 80) #5
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.Contact, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = load ptr, ptr %3, align 8
  %11 = call ptr @strcpy(ptr noundef %9, ptr noundef %10) #6
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.Contact, ptr %12, i32 0, i32 1
  %14 = getelementptr inbounds [15 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @strcpy(ptr noundef %14, ptr noundef %15) #6
  %17 = load ptr, ptr @head, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.Contact, ptr %18, i32 0, i32 2
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %5, align 8
  store ptr %20, ptr @head, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %21, ptr noundef %22)
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayContacts() #0 {
  %1 = alloca ptr, align 8
  %2 = load ptr, ptr @head, align 8
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %23

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %8 = load ptr, ptr @head, align 8
  store ptr %8, ptr %1, align 8
  br label %9

9:                                                ; preds = %12, %6
  %10 = load ptr, ptr %1, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %23

12:                                               ; preds = %9
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds %struct.Contact, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = load ptr, ptr %1, align 8
  %17 = getelementptr inbounds %struct.Contact, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [15 x i8], ptr %17, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %15, ptr noundef %18)
  %20 = load ptr, ptr %1, align 8
  %21 = getelementptr inbounds %struct.Contact, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %1, align 8
  br label %9, !llvm.loop !6

23:                                               ; preds = %4, %9
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @searchContact(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr @head, align 8
  store ptr %4, ptr %3, align 8
  br label %5

5:                                                ; preds = %23, %1
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %27

8:                                                ; preds = %5
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.Contact, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %2, align 8
  %13 = call i32 @strcmp(ptr noundef %11, ptr noundef %12) #7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.Contact, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.Contact, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds [15 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %18, ptr noundef %21)
  br label %30

23:                                               ; preds = %8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.Contact, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %3, align 8
  br label %5, !llvm.loop !8

27:                                               ; preds = %5
  %28 = load ptr, ptr %2, align 8
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %28)
  br label %30

30:                                               ; preds = %27, %15
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @deleteContact(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr @head, align 8
  store ptr %5, ptr %3, align 8
  store ptr null, ptr %4, align 8
  br label %6

6:                                                ; preds = %18, %1
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.Contact, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = load ptr, ptr %2, align 8
  %14 = call i32 @strcmp(ptr noundef %12, ptr noundef %13) #7
  %15 = icmp ne i32 %14, 0
  br label %16

16:                                               ; preds = %9, %6
  %17 = phi i1 [ false, %6 ], [ %15, %9 ]
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  %19 = load ptr, ptr %3, align 8
  store ptr %19, ptr %4, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.Contact, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %3, align 8
  br label %6, !llvm.loop !9

23:                                               ; preds = %16
  %24 = load ptr, ptr %3, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %23
  %27 = load ptr, ptr %2, align 8
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %27)
  br label %46

29:                                               ; preds = %23
  %30 = load ptr, ptr %4, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.Contact, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr @head, align 8
  br label %42

36:                                               ; preds = %29
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.Contact, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.Contact, ptr %40, i32 0, i32 2
  store ptr %39, ptr %41, align 8
  br label %42

42:                                               ; preds = %36, %32
  %43 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %43) #6
  %44 = load ptr, ptr %2, align 8
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %44)
  br label %46

46:                                               ; preds = %42, %26
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @freeContacts() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = load ptr, ptr @head, align 8
  store ptr %3, ptr %1, align 8
  br label %4

4:                                                ; preds = %7, %0
  %5 = load ptr, ptr %1, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds %struct.Contact, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %1, align 8
  call void @free(ptr noundef %11) #6
  %12 = load ptr, ptr %2, align 8
  store ptr %12, ptr %1, align 8
  br label %4, !llvm.loop !10

13:                                               ; preds = %4
  store ptr null, ptr @head, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @menu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  %3 = alloca [15 x i8], align 1
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %0, %32
  call void @menu()
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.14, ptr noundef %4)
  %7 = load i32, ptr %4, align 4
  switch i32 %7, label %30 [
    i32 1, label %8
    i32 2, label %17
    i32 3, label %18
    i32 4, label %23
    i32 5, label %28
  ]

8:                                                ; preds = %5
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %10 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %13 = getelementptr inbounds [15 x i8], ptr %3, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %13)
  %15 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %16 = getelementptr inbounds [15 x i8], ptr %3, i64 0, i64 0
  call void @addContact(ptr noundef %15, ptr noundef %16)
  br label %32

17:                                               ; preds = %5
  call void @displayContacts()
  br label %32

18:                                               ; preds = %5
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %20 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %20)
  %22 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @searchContact(ptr noundef %22)
  br label %32

23:                                               ; preds = %5
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %25 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %26 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %25)
  %27 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @deleteContact(ptr noundef %27)
  br label %32

28:                                               ; preds = %5
  call void @freeContacts()
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  ret i32 0

30:                                               ; preds = %5
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %32

32:                                               ; preds = %30, %23, %18, %17, %8
  br label %5
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }

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
