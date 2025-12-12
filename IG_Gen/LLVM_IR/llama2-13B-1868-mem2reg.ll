; ModuleID = 'LLVM_IR/llama2-13B-1868.ll'
source_filename = "DATASETv2/llama2-13B-1868.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.person_t = type { [20 x i8], i32, [50 x i8] }

@.str = private unnamed_addr constant [13 x i8] c"Enter name: \00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [12 x i8] c"Enter age: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Enter address: \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Name: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Age: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"Address: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"Database is full, cannot add new person\0A\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"Person %d added to the database\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"Person %d removed from the database\0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Invalid index\0A\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"No name\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"No address\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"John\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"Person not found\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @read_person(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 20, ptr noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 1
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %11 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 2
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 50, ptr noundef %13)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_person(ptr noundef byval(%struct.person_t) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %3)
  %5 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %6)
  %8 = getelementptr inbounds %struct.person_t, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %9)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_person(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %15, %2
  %.0 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %17

6:                                                ; preds = %3
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.person_t, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.person_t, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef @.str.7) #5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %6
  br label %17

14:                                               ; preds = %6
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

17:                                               ; preds = %13, %3
  %18 = load i32, ptr %1, align 4
  %19 = icmp eq i32 %.0, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %35

22:                                               ; preds = %17
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds %struct.person_t, ptr %0, i64 %23
  %25 = getelementptr inbounds %struct.person_t, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds %struct.person_t, ptr %0, i64 %28
  %30 = getelementptr inbounds %struct.person_t, ptr %29, i32 0, i32 1
  store i32 %27, ptr %30, align 4
  %31 = add nsw i32 %.0, 1
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %31)
  %33 = load i32, ptr %1, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %1, align 4
  br label %35

35:                                               ; preds = %22, %20
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_person(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = icmp sge i32 %2, 0
  br i1 %4, label %5, label %22

5:                                                ; preds = %3
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %2, %6
  br i1 %7, label %8, label %22

8:                                                ; preds = %5
  %9 = sext i32 %2 to i64
  %10 = getelementptr inbounds %struct.person_t, ptr %0, i64 %9
  %11 = sext i32 %2 to i64
  %12 = getelementptr inbounds %struct.person_t, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.person_t, ptr %12, i64 1
  %14 = load i32, ptr %1, align 4
  %15 = sub nsw i32 %14, %2
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 76
  call void @llvm.memmove.p0.p0.i64(ptr align 4 %10, ptr align 4 %13, i64 %17, i1 false)
  %18 = load i32, ptr %1, align 4
  %19 = sub nsw i32 %18, 1
  store i32 %19, ptr %1, align 4
  %20 = add nsw i32 %2, 1
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %20)
  br label %24

22:                                               ; preds = %5, %3
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %24

24:                                               ; preds = %22, %8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @search_person(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %15, %3
  %.01 = phi i32 [ 0, %3 ], [ %16, %15 ]
  %5 = icmp slt i32 %.01, %1
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds %struct.person_t, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.person_t, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %2) #5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %6
  br label %18

14:                                               ; preds = %6
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

17:                                               ; preds = %4
  br label %18

18:                                               ; preds = %17, %13
  %.0 = phi i32 [ %.01, %13 ], [ -1, %17 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x %struct.person_t], align 16
  %3 = alloca %struct.person_t, align 8
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %20, %0
  %.0 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %5 = icmp slt i32 %.0, 100
  br i1 %5, label %6, label %22

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.person_t, ptr %8, i32 0, i32 1
  store i32 0, ptr %9, align 4
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.person_t, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [20 x i8], ptr %12, i64 0, i64 0
  %14 = call ptr @strcpy(ptr noundef %13, ptr noundef @.str.12) #6
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.person_t, ptr %16, i32 0, i32 2
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = call ptr @strcpy(ptr noundef %18, ptr noundef @.str.13) #6
  br label %20

20:                                               ; preds = %6
  %21 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !9

22:                                               ; preds = %4
  %23 = load i32, ptr %1, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 %24
  call void @read_person(ptr noundef %25)
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4
  %28 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 0
  call void @add_person(ptr noundef %28, ptr noundef %1)
  %29 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 0
  call void @remove_person(ptr noundef %29, ptr noundef %1, i32 noundef 2)
  %30 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 0
  %31 = load i32, ptr %1, align 4
  %32 = call i32 @search_person(ptr noundef %30, i32 noundef %31, ptr noundef @.str.14)
  %33 = icmp ne i32 %32, -1
  br i1 %33, label %34, label %37

34:                                               ; preds = %22
  %35 = sext i32 %32 to i64
  %36 = getelementptr inbounds [100 x %struct.person_t], ptr %2, i64 0, i64 %35
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 4 %36, i64 76, i1 false)
  call void @display_person(ptr noundef byval(%struct.person_t) align 8 %3)
  br label %39

37:                                               ; preds = %22
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %39

39:                                               ; preds = %37, %34
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind }

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
