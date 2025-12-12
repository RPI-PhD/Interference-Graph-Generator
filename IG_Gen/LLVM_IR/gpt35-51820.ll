; ModuleID = 'DATASETv2/gpt35-51820.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addContact(ptr noundef %0, ptr noundef byval(%struct.Contact) align 8 %1) #0 {
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.ContactList, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %6, 100
  br i1 %7, label %8, label %17

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.ContactList, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.ContactList, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 4
  %15 = sext i32 %13 to i64
  %16 = getelementptr inbounds [100 x %struct.Contact], ptr %10, i64 0, i64 %15
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %16, ptr align 8 %1, i64 50, i1 false)
  br label %19

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %19

19:                                               ; preds = %17, %8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @removeContact(ptr noundef %0, ptr noundef byval(%struct.Contact) align 8 %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %69, %2
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.ContactList, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %72

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.ContactList, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.Contact], ptr %14, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Contact, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 0
  %21 = getelementptr inbounds [20 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 @strcmp(ptr noundef %19, ptr noundef %21) #4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %68

24:                                               ; preds = %12
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.ContactList, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %4, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct.Contact], ptr %26, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Contact, ptr %29, i32 0, i32 1
  %31 = getelementptr inbounds [30 x i8], ptr %30, i64 0, i64 0
  %32 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 1
  %33 = getelementptr inbounds [30 x i8], ptr %32, i64 0, i64 0
  %34 = call i32 @strcmp(ptr noundef %31, ptr noundef %33) #4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %68

36:                                               ; preds = %24
  %37 = load i32, ptr %4, align 4
  store i32 %37, ptr %5, align 4
  br label %38

38:                                               ; preds = %57, %36
  %39 = load i32, ptr %5, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds %struct.ContactList, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %39, %43
  br i1 %44, label %45, label %60

45:                                               ; preds = %38
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.ContactList, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %5, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [100 x %struct.Contact], ptr %47, i64 0, i64 %49
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds %struct.ContactList, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [100 x %struct.Contact], ptr %52, i64 0, i64 %55
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %50, ptr align 2 %56, i64 50, i1 false)
  br label %57

57:                                               ; preds = %45
  %58 = load i32, ptr %5, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %5, align 4
  br label %38, !llvm.loop !6

60:                                               ; preds = %38
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds %struct.ContactList, ptr %61, i32 0, i32 1
  %63 = load i32, ptr %62, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, ptr %62, align 4
  %65 = getelementptr inbounds %struct.Contact, ptr %1, i32 0, i32 0
  %66 = getelementptr inbounds [20 x i8], ptr %65, i64 0, i64 0
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %66)
  br label %72

68:                                               ; preds = %24, %12
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %4, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %4, align 4
  br label %6, !llvm.loop !8

72:                                               ; preds = %60, %6
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayContacts(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %26, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.ContactList, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %29

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.ContactList, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.Contact], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Contact, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [20 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.ContactList, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.Contact], ptr %19, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Contact, ptr %22, i32 0, i32 1
  %24 = getelementptr inbounds [30 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %17, ptr noundef %24)
  br label %26

26:                                               ; preds = %10
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %3, align 4
  br label %4, !llvm.loop !9

29:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @searchContact(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %51, %2
  %7 = load i32, ptr %5, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.ContactList, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %54

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.ContactList, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.Contact], ptr %14, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Contact, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %4, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %34, label %23

23:                                               ; preds = %12
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.ContactList, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.Contact], ptr %25, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Contact, ptr %28, i32 0, i32 1
  %30 = getelementptr inbounds [30 x i8], ptr %29, i64 0, i64 0
  %31 = load ptr, ptr %4, align 8
  %32 = call i32 @strcmp(ptr noundef %30, ptr noundef %31) #4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %50

34:                                               ; preds = %23, %12
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.ContactList, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %5, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x %struct.Contact], ptr %36, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.Contact, ptr %39, i32 0, i32 0
  %41 = getelementptr inbounds [20 x i8], ptr %40, i64 0, i64 0
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.ContactList, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x %struct.Contact], ptr %43, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.Contact, ptr %46, i32 0, i32 1
  %48 = getelementptr inbounds [30 x i8], ptr %47, i64 0, i64 0
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %41, ptr noundef %48)
  br label %50

50:                                               ; preds = %34, %23
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %5, align 4
  br label %6, !llvm.loop !10

54:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ContactList, align 4
  %3 = alloca %struct.Contact, align 8
  %4 = alloca %struct.Contact, align 8
  store i32 0, ptr %1, align 4
  %5 = getelementptr inbounds %struct.ContactList, ptr %2, i32 0, i32 1
  store i32 0, ptr %5, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.c1, i64 50, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %4, ptr align 1 @__const.main.c2, i64 50, i1 false)
  call void @addContact(ptr noundef %2, ptr noundef byval(%struct.Contact) align 8 %3)
  call void @addContact(ptr noundef %2, ptr noundef byval(%struct.Contact) align 8 %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @searchContact(ptr noundef %2, ptr noundef @.str.4)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  call void @removeContact(ptr noundef %2, ptr noundef byval(%struct.Contact) align 8 %4)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  call void @displayContacts(ptr noundef %2)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
