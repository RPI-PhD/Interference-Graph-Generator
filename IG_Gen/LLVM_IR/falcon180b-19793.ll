; ModuleID = 'DATASETv2/falcon180b-19793.c'
source_filename = "DATASETv2/falcon180b-19793.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hash_t = type { i32, [64 x i8] }

@.str = private unnamed_addr constant [2 x i8] c"\80\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"%Y%m%d%H%M%S\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"input.txt\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"Hash of file 'input.txt' at %s:\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @hash_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.hash_t, ptr %3, i32 0, i32 0
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.hash_t, ptr %5, i32 0, i32 1
  %7 = getelementptr inbounds [64 x i8], ptr %6, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 4 %7, i8 0, i64 64, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @hash_update(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.hash_t, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, %8
  store i32 %12, ptr %10, align 4
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %36, %3
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %39

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %18, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = zext i8 %22 to i32
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.hash_t, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.hash_t, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 4
  %29 = srem i32 %28, 64
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [64 x i8], ptr %25, i64 0, i64 %30
  %32 = load i8, ptr %31, align 1
  %33 = zext i8 %32 to i32
  %34 = xor i32 %33, %23
  %35 = trunc i32 %34 to i8
  store i8 %35, ptr %31, align 1
  br label %36

36:                                               ; preds = %17
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %7, align 4
  br label %13, !llvm.loop !6

39:                                               ; preds = %13
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @hash_final(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.hash_t, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = srem i32 %9, 64
  %11 = sub nsw i32 64, %10
  store i32 %11, ptr %5, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  call void @hash_update(ptr noundef %12, ptr noundef @.str, i32 noundef %13)
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.hash_t, ptr %15, i32 0, i32 0
  call void @hash_update(ptr noundef %14, ptr noundef %16, i32 noundef 4)
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %34, %2
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 64
  br i1 %19, label %20, label %37

20:                                               ; preds = %17
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %6, align 4
  %23 = mul nsw i32 %22, 2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, ptr %21, i64 %24
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.hash_t, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [64 x i8], ptr %27, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %25, ptr noundef @.str.1, i32 noundef %32) #4
  br label %34

34:                                               ; preds = %20
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  br label %17, !llvm.loop !8

37:                                               ; preds = %17
  ret void
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [64 x i8], align 16
  %5 = alloca %struct.hash_t, align 4
  %6 = alloca ptr, align 8
  %7 = alloca [4096 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca [129 x i8], align 16
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %11 = call i64 @time(ptr noundef null) #4
  store i64 %11, ptr %2, align 8
  %12 = call ptr @localtime(ptr noundef %2) #4
  store ptr %12, ptr %3, align 8
  %13 = getelementptr inbounds [64 x i8], ptr %4, i64 0, i64 0
  %14 = load ptr, ptr %3, align 8
  %15 = call i64 @strftime(ptr noundef %13, i64 noundef 64, ptr noundef @.str.2, ptr noundef %14) #4
  call void @hash_init(ptr noundef %5)
  %16 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %21, label %19

19:                                               ; preds = %0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 1, ptr %1, align 4
  br label %52

21:                                               ; preds = %0
  br label %22

22:                                               ; preds = %28, %21
  %23 = getelementptr inbounds [4096 x i8], ptr %7, i64 0, i64 0
  %24 = load ptr, ptr %6, align 8
  %25 = call i64 @fread(ptr noundef %23, i64 noundef 1, i64 noundef 4096, ptr noundef %24)
  %26 = trunc i64 %25 to i32
  store i32 %26, ptr %8, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %22
  %29 = getelementptr inbounds [4096 x i8], ptr %7, i64 0, i64 0
  %30 = load i32, ptr %8, align 4
  call void @hash_update(ptr noundef %5, ptr noundef %29, i32 noundef %30)
  br label %22, !llvm.loop !9

31:                                               ; preds = %22
  %32 = getelementptr inbounds [129 x i8], ptr %9, i64 0, i64 0
  call void @hash_final(ptr noundef %5, ptr noundef %32)
  %33 = getelementptr inbounds [64 x i8], ptr %4, i64 0, i64 0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %33)
  store i32 0, ptr %10, align 4
  br label %35

35:                                               ; preds = %45, %31
  %36 = load i32, ptr %10, align 4
  %37 = icmp slt i32 %36, 128
  br i1 %37, label %38, label %48

38:                                               ; preds = %35
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [129 x i8], ptr %9, i64 0, i64 %40
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %43)
  br label %45

45:                                               ; preds = %38
  %46 = load i32, ptr %10, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %10, align 4
  br label %35, !llvm.loop !10

48:                                               ; preds = %35
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %50 = load ptr, ptr %6, align 8
  %51 = call i32 @fclose(ptr noundef %50)
  store i32 0, ptr %1, align 4
  br label %52

52:                                               ; preds = %48, %19
  %53 = load i32, ptr %1, align 4
  ret i32 %53
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #2

; Function Attrs: nounwind
declare i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
