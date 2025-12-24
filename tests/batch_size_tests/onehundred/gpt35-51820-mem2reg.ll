; ModuleID = 'LLVM_IR/gpt35-51820.ll'
source_filename = "DATASETv2/gpt35-51820.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Contact = type { [20 x i8], [30 x i8] }
%struct.ContactList = type { [100 x %struct.Contact], i32 }

@.str = private unnamed_addr constant [23 x i8] c"Contact list is full!\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"%s's contact removed from the list.\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@__const.main.c1 = private unnamed_addr constant %struct.Contact { [20 x i8] c"John Doe\00\00\00\00\00\00\00\00\00\00\00\00", [30 x i8] c"john.doe@example.com\00\00\00\00\00\00\00\00\00\00" }, align 1
@__const.main.c2 = private unnamed_addr constant %struct.Contact { [20 x i8] c"Jane Doe\00\00\00\00\00\00\00\00\00\00\00\00", [30 x i8] c"jane.doe@example.com\00\00\00\00\00\00\00\00\00\00" }, align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Searching for contact 'John Doe':\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"Removing Jane Doe's contact:\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Final Contact List:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addContact(ptr noundef %0, ptr noundef byval(%struct.Contact) align 8 %1) #0 {
  %3 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %8, align 4
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds [100 x %struct.Contact], ptr %7, i64 0, i64 %11
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %12, ptr align 8 %1, i64 50, i1 false)
  br label %15

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %15

15:                                               ; preds = %13, %6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @removeContact(ptr noundef %0, ptr noundef byval(%struct.Contact) align 8 %1) #0 {
  br label %3

3:                                                ; preds = %51, %2
  %.01 = phi i32 [ 0, %2 ], [ %52, %51 ]
  %4 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %53

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [100 x %struct.Contact], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Contact, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 0
  %14 = getelementptr inbounds [20 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 @strcmp(ptr noundef %12, ptr noundef %14) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %50

17:                                               ; preds = %7
  %18 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds [100 x %struct.Contact], ptr %18, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Contact, ptr %20, i32 0, i32 1
  %22 = getelementptr inbounds [30 x i8], ptr %21, i64 0, i64 0
  %23 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 1
  %24 = getelementptr inbounds [30 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 @strcmp(ptr noundef %22, ptr noundef %24) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %50

27:                                               ; preds = %17
  br label %28

28:                                               ; preds = %41, %27
  %.0 = phi i32 [ %.01, %27 ], [ %42, %41 ]
  %29 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = sub nsw i32 %30, 1
  %32 = icmp slt i32 %.0, %31
  br i1 %32, label %33, label %43

33:                                               ; preds = %28
  %34 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds [100 x %struct.Contact], ptr %34, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %38 = add nsw i32 %.0, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x %struct.Contact], ptr %37, i64 0, i64 %39
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %36, ptr align 2 %40, i64 50, i1 false)
  br label %41

41:                                               ; preds = %33
  %42 = add nsw i32 %.0, 1
  br label %28, !llvm.loop !6

43:                                               ; preds = %28
  %44 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, ptr %44, align 4
  %47 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 0
  %48 = getelementptr inbounds [20 x i8], ptr %47, i64 0, i64 0
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %48)
  br label %53

50:                                               ; preds = %17, %7
  br label %51

51:                                               ; preds = %50
  %52 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

53:                                               ; preds = %43, %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayContacts(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %18, %1
  %.0 = phi i32 [ 0, %1 ], [ %19, %18 ]
  %3 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %20

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.Contact], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Contact, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  %12 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.Contact], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Contact, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [30 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %11, ptr noundef %16)
  br label %18

18:                                               ; preds = %6
  %19 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

20:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @searchContact(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %36, %2
  %.0 = phi i32 [ 0, %2 ], [ %37, %36 ]
  %4 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %38

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.Contact], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Contact, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef %1) #4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %23, label %15

15:                                               ; preds = %7
  %16 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.Contact], ptr %16, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Contact, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds [30 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef %1) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %35

23:                                               ; preds = %15, %7
  %24 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [100 x %struct.Contact], ptr %24, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Contact, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds [20 x i8], ptr %27, i64 0, i64 0
  %29 = getelementptr inbounds %struct.ContactList, ptr %0, i32 0, i32 0
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds [100 x %struct.Contact], ptr %29, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Contact, ptr %31, i32 0, i32 1
  %33 = getelementptr inbounds [30 x i8], ptr %32, i64 0, i64 0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %28, ptr noundef %33)
  br label %35

35:                                               ; preds = %23, %15
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

38:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.ContactList, align 4
  %2 = alloca %struct.Contact, align 8
  %3 = alloca %struct.Contact, align 8
  %4 = getelementptr inbounds %struct.ContactList, ptr %1, i32 0, i32 1
  store i32 0, ptr %4, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.c1, i64 50, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.c2, i64 50, i1 false)
  call void @addContact(ptr noundef %1, ptr noundef byval(%struct.Contact) align 8 %2)
  call void @addContact(ptr noundef %1, ptr noundef byval(%struct.Contact) align 8 %3)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @searchContact(ptr noundef %1, ptr noundef @.str.4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  call void @removeContact(ptr noundef %1, ptr noundef byval(%struct.Contact) align 8 %3)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  call void @displayContacts(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
