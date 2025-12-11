; ModuleID = 'DATASETv2/falcon2-11B-8713.ll'
source_filename = "DATASETv2/falcon2-11B-8713.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.User = type { [100 x i8], [100 x i8], [20 x i8], [200 x i8] }
%struct.MailingList = type { i32, ptr }

@.str = private unnamed_addr constant [23 x i8] c"Mailing list is full!\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Mailing list:\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"User %d: %s - %s - %s - %s\0A\00", align 1
@__const.main.user1 = private unnamed_addr constant %struct.User { [100 x i8] c"John Doe\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [100 x i8] c"johndoe@example.com\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"1234567890\00\00\00\00\00\00\00\00\00\00", [200 x i8] c"123 Main St\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1
@__const.main.user2 = private unnamed_addr constant %struct.User { [100 x i8] c"Jane Smith\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [100 x i8] c"janesmith@example.com\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"0987654321\00\00\00\00\00\00\00\00\00\00", [200 x i8] c"456 Elm St\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1
@__const.main.user3 = private unnamed_addr constant %struct.User { [100 x i8] c"Bob Johnson\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [100 x i8] c"bobjohnson@example.com\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"5555555555\00\00\00\00\00\00\00\00\00\00", [200 x i8] c"789 Oak St\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

; Function Attrs: noinline nounwind uwtable
define dso_local { i32, ptr } @createMailingList(i32 noundef %0) #0 {
  %2 = alloca %struct.MailingList, align 8
  %3 = getelementptr inbounds %struct.MailingList, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 8
  %4 = sext i32 %0 to i64
  %5 = mul i64 %4, 420
  %6 = call noalias ptr @malloc(i64 noundef %5) #4
  %7 = getelementptr inbounds %struct.MailingList, ptr %2, i32 0, i32 1
  store ptr %6, ptr %7, align 8
  %8 = load { i32, ptr }, ptr %2, align 8
  ret { i32, ptr } %8
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addUser(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = sext i32 %4 to i64
  %6 = inttoptr i64 %5 to ptr
  %7 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = icmp uge ptr %6, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %22

12:                                               ; preds = %2
  %13 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.User, ptr %14, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %18, ptr align 1 %1, i64 420, i1 false)
  %19 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %19, align 8
  br label %22

22:                                               ; preds = %12, %10
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayMailingList(i32 %0, ptr %1) #0 {
  %3 = alloca %struct.MailingList, align 8
  %4 = getelementptr inbounds { i32, ptr }, ptr %3, i32 0, i32 0
  store i32 %0, ptr %4, align 8
  %5 = getelementptr inbounds { i32, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %7

7:                                                ; preds = %38, %2
  %.0 = phi i32 [ 0, %2 ], [ %39, %38 ]
  %8 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %7
  %12 = add nsw i32 %.0, 1
  %13 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.User, ptr %14, i64 %15
  %17 = getelementptr inbounds %struct.User, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [100 x i8], ptr %17, i64 0, i64 0
  %19 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds %struct.User, ptr %20, i64 %21
  %23 = getelementptr inbounds %struct.User, ptr %22, i32 0, i32 1
  %24 = getelementptr inbounds [100 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds %struct.User, ptr %26, i64 %27
  %29 = getelementptr inbounds %struct.User, ptr %28, i32 0, i32 2
  %30 = getelementptr inbounds [20 x i8], ptr %29, i64 0, i64 0
  %31 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = sext i32 %.0 to i64
  %34 = getelementptr inbounds %struct.User, ptr %32, i64 %33
  %35 = getelementptr inbounds %struct.User, ptr %34, i32 0, i32 3
  %36 = getelementptr inbounds [200 x i8], ptr %35, i64 0, i64 0
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12, ptr noundef %18, ptr noundef %24, ptr noundef %30, ptr noundef %36)
  br label %38

38:                                               ; preds = %11
  %39 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

40:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.MailingList, align 8
  %2 = alloca %struct.User, align 1
  %3 = alloca %struct.User, align 1
  %4 = alloca %struct.User, align 1
  %5 = call { i32, ptr } @createMailingList(i32 noundef 5)
  %6 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %7 = extractvalue { i32, ptr } %5, 0
  store i32 %7, ptr %6, align 8
  %8 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 1
  %9 = extractvalue { i32, ptr } %5, 1
  store ptr %9, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.user1, i64 420, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.user2, i64 420, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %4, ptr align 1 @__const.main.user3, i64 420, i1 false)
  call void @addUser(ptr noundef %1, ptr noundef %2)
  call void @addUser(ptr noundef %1, ptr noundef %3)
  call void @addUser(ptr noundef %1, ptr noundef %4)
  %10 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  call void @displayMailingList(i32 %11, ptr %13)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind allocsize(0) }

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
