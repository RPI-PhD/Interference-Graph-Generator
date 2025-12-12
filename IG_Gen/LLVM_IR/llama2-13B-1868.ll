; ModuleID = 'DATASETv2/llama2-13B-1868.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @read_person(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.person_t, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 20, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.person_t, ptr %10, i32 0, i32 1
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.person_t, ptr %14, i32 0, i32 2
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr @stdin, align 8
  %18 = call ptr @fgets(ptr noundef %16, i32 noundef 50, ptr noundef %17)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_person(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %22, %2
  %7 = load i32, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %7, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %6
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.person_t, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.person_t, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [20 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 @strcmp(ptr noundef %17, ptr noundef @.str.7) #5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %11
  br label %25

21:                                               ; preds = %11
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %5, align 4
  br label %6, !llvm.loop !6

25:                                               ; preds = %20, %6
  %26 = load i32, ptr %5, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %27, align 4
  %29 = icmp eq i32 %26, %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %25
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %51

32:                                               ; preds = %25
  %33 = load ptr, ptr %3, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.person_t, ptr %33, i64 %35
  %37 = getelementptr inbounds %struct.person_t, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, 1
  %40 = load ptr, ptr %3, align 8
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.person_t, ptr %40, i64 %42
  %44 = getelementptr inbounds %struct.person_t, ptr %43, i32 0, i32 1
  store i32 %39, ptr %44, align 4
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %46)
  %48 = load ptr, ptr %4, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %48, align 4
  br label %51

51:                                               ; preds = %32, %30
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @remove_person(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %36

9:                                                ; preds = %3
  %10 = load i32, ptr %6, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = load i32, ptr %11, align 4
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %36

14:                                               ; preds = %9
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.person_t, ptr %15, i64 %17
  %19 = load ptr, ptr %4, align 8
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.person_t, ptr %19, i64 %21
  %23 = getelementptr inbounds %struct.person_t, ptr %22, i64 1
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %6, align 4
  %27 = sub nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = mul i64 %28, 76
  call void @llvm.memmove.p0.p0.i64(ptr align 4 %18, ptr align 4 %23, i64 %29, i1 false)
  %30 = load ptr, ptr %5, align 8
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 %31, 1
  store i32 %32, ptr %30, align 4
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 1
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %34)
  br label %38

36:                                               ; preds = %9, %3
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %38

38:                                               ; preds = %36, %14
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @search_person(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %26, %3
  %10 = load i32, ptr %8, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %29

13:                                               ; preds = %9
  %14 = load ptr, ptr %5, align 8
  %15 = load i32, ptr %8, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.person_t, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.person_t, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %7, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %13
  %24 = load i32, ptr %8, align 4
  store i32 %24, ptr %4, align 4
  br label %30

25:                                               ; preds = %13
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %8, align 4
  br label %9, !llvm.loop !8

29:                                               ; preds = %9
  store i32 -1, ptr %4, align 4
  br label %30

30:                                               ; preds = %29, %23
  %31 = load i32, ptr %4, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x %struct.person_t], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.person_t, align 8
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %27, %0
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %8, 100
  br i1 %9, label %10, label %30

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.person_t, ptr %13, i32 0, i32 1
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.person_t, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = call ptr @strcpy(ptr noundef %19, ptr noundef @.str.12) #6
  %21 = load i32, ptr %4, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.person_t, ptr %23, i32 0, i32 2
  %25 = getelementptr inbounds [50 x i8], ptr %24, i64 0, i64 0
  %26 = call ptr @strcpy(ptr noundef %25, ptr noundef @.str.13) #6
  br label %27

27:                                               ; preds = %10
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %4, align 4
  br label %7, !llvm.loop !9

30:                                               ; preds = %7
  %31 = load i32, ptr %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 %32
  call void @read_person(ptr noundef %33)
  %34 = load i32, ptr %2, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %2, align 4
  %36 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 0
  call void @add_person(ptr noundef %36, ptr noundef %2)
  %37 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 0
  call void @remove_person(ptr noundef %37, ptr noundef %2, i32 noundef 2)
  %38 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 0
  %39 = load i32, ptr %2, align 4
  %40 = call i32 @search_person(ptr noundef %38, i32 noundef %39, ptr noundef @.str.14)
  store i32 %40, ptr %5, align 4
  %41 = load i32, ptr %5, align 4
  %42 = icmp ne i32 %41, -1
  br i1 %42, label %43, label %47

43:                                               ; preds = %30
  %44 = load i32, ptr %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x %struct.person_t], ptr %3, i64 0, i64 %45
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 4 %46, i64 76, i1 false)
  call void @display_person(ptr noundef byval(%struct.person_t) align 8 %6)
  br label %49

47:                                               ; preds = %30
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %49

49:                                               ; preds = %47, %43
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
