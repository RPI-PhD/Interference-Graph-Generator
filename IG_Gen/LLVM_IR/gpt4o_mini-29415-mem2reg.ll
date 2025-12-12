; ModuleID = 'LLVM_IR/gpt4o_mini-29415.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @addContact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 80) #5
  %4 = getelementptr inbounds %struct.Contact, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %6 = call ptr @strcpy(ptr noundef %5, ptr noundef %0) #6
  %7 = getelementptr inbounds %struct.Contact, ptr %3, i32 0, i32 1
  %8 = getelementptr inbounds [15 x i8], ptr %7, i64 0, i64 0
  %9 = call ptr @strcpy(ptr noundef %8, ptr noundef %1) #6
  %10 = load ptr, ptr @head, align 8
  %11 = getelementptr inbounds %struct.Contact, ptr %3, i32 0, i32 2
  store ptr %10, ptr %11, align 8
  store ptr %3, ptr @head, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0, ptr noundef %1)
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayContacts() #0 {
  %1 = load ptr, ptr @head, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %18

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %7 = load ptr, ptr @head, align 8
  br label %8

8:                                                ; preds = %10, %5
  %.0 = phi ptr [ %7, %5 ], [ %17, %10 ]
  %9 = icmp ne ptr %.0, null
  br i1 %9, label %10, label %18

10:                                               ; preds = %8
  %11 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 1
  %14 = getelementptr inbounds [15 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %12, ptr noundef %14)
  %16 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  br label %8, !llvm.loop !6

18:                                               ; preds = %8, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @searchContact(ptr noundef %0) #0 {
  %2 = load ptr, ptr @head, align 8
  br label %3

3:                                                ; preds = %16, %1
  %.0 = phi ptr [ %2, %1 ], [ %18, %16 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 0
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = call i32 @strcmp(ptr noundef %7, ptr noundef %0) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 1
  %14 = getelementptr inbounds [15 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %12, ptr noundef %14)
  br label %21

16:                                               ; preds = %5
  %17 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  br label %3, !llvm.loop !8

19:                                               ; preds = %3
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %0)
  br label %21

21:                                               ; preds = %19, %10
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @deleteContact(ptr noundef %0) #0 {
  %2 = load ptr, ptr @head, align 8
  br label %3

3:                                                ; preds = %12, %1
  %.01 = phi ptr [ %2, %1 ], [ %14, %12 ]
  %.0 = phi ptr [ null, %1 ], [ %.01, %12 ]
  %4 = icmp ne ptr %.01, null
  br i1 %4, label %5, label %10

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.Contact, ptr %.01, i32 0, i32 0
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = call i32 @strcmp(ptr noundef %7, ptr noundef %0) #7
  %9 = icmp ne i32 %8, 0
  br label %10

10:                                               ; preds = %5, %3
  %11 = phi i1 [ false, %3 ], [ %9, %5 ]
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = getelementptr inbounds %struct.Contact, ptr %.01, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  br label %3, !llvm.loop !9

15:                                               ; preds = %10
  %16 = icmp eq ptr %.01, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %0)
  br label %30

19:                                               ; preds = %15
  %20 = icmp eq ptr %.0, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds %struct.Contact, ptr %.01, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr @head, align 8
  br label %28

24:                                               ; preds = %19
  %25 = getelementptr inbounds %struct.Contact, ptr %.01, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 2
  store ptr %26, ptr %27, align 8
  br label %28

28:                                               ; preds = %24, %21
  call void @free(ptr noundef %.01) #6
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %0)
  br label %30

30:                                               ; preds = %28, %17
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @freeContacts() #0 {
  %1 = load ptr, ptr @head, align 8
  br label %2

2:                                                ; preds = %4, %0
  %.0 = phi ptr [ %1, %0 ], [ %6, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Contact, ptr %.0, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %.0) #6
  br label %2, !llvm.loop !10

7:                                                ; preds = %2
  store ptr null, ptr @head, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [50 x i8], align 16
  %2 = alloca [15 x i8], align 1
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %31, %0
  call void @menu()
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.14, ptr noundef %3)
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %29 [
    i32 1, label %7
    i32 2, label %16
    i32 3, label %17
    i32 4, label %22
    i32 5, label %27
  ]

7:                                                ; preds = %4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %9 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %12 = getelementptr inbounds [15 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %12)
  %14 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %15 = getelementptr inbounds [15 x i8], ptr %2, i64 0, i64 0
  call void @addContact(ptr noundef %14, ptr noundef %15)
  br label %31

16:                                               ; preds = %4
  call void @displayContacts()
  br label %31

17:                                               ; preds = %4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %19 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %19)
  %21 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  call void @searchContact(ptr noundef %21)
  br label %31

22:                                               ; preds = %4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %24 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %25 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %24)
  %26 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  call void @deleteContact(ptr noundef %26)
  br label %31

27:                                               ; preds = %4
  call void @freeContacts()
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  ret i32 0

29:                                               ; preds = %4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %31

31:                                               ; preds = %29, %22, %17, %16, %7
  br label %4
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
