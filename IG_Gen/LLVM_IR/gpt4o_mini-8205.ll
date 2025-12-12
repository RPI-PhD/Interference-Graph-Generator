; ModuleID = 'DATASETv2/gpt4o_mini-8205.c'
source_filename = "DATASETv2/gpt4o_mini-8205.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [64 x i8] c"Surprise! Welcome to the world of cryptographic hash functions!\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Hash: \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.3 = private unnamed_addr constant [56 x i8] c"\0ASurprise! That's the hash of the input message above!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [32 x i8], align 16
  store i32 0, ptr %1, align 4
  store ptr @.str, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call i64 @strlen(ptr noundef %5) #5
  %7 = getelementptr inbounds [32 x i8], ptr %3, i64 0, i64 0
  call void @hash_message(ptr noundef %4, i64 noundef %6, ptr noundef %7)
  %8 = getelementptr inbounds [32 x i8], ptr %3, i64 0, i64 0
  call void @print_hash(ptr noundef %8)
  ret i32 0
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @hash_message(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [8 x i32], align 16
  %8 = alloca [64 x i8], align 16
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %11 = getelementptr inbounds [8 x i32], ptr %7, i64 0, i64 0
  call void @initialize_state(ptr noundef %11)
  store i64 0, ptr %9, align 8
  br label %12

12:                                               ; preds = %21, %3
  %13 = load i64, ptr %5, align 8
  %14 = icmp ugt i64 %13, 0
  br i1 %14, label %15, label %41

15:                                               ; preds = %12
  %16 = load i64, ptr %5, align 8
  %17 = icmp ult i64 %16, 64
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load i64, ptr %5, align 8
  br label %21

20:                                               ; preds = %15
  br label %21

21:                                               ; preds = %20, %18
  %22 = phi i64 [ %19, %18 ], [ 64, %20 ]
  store i64 %22, ptr %10, align 8
  %23 = getelementptr inbounds [64 x i8], ptr %8, i64 0, i64 0
  %24 = load ptr, ptr %4, align 8
  %25 = load i64, ptr %9, align 8
  %26 = getelementptr inbounds i8, ptr %24, i64 %25
  %27 = load i64, ptr %10, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %23, ptr align 1 %26, i64 %27, i1 false)
  %28 = getelementptr inbounds [64 x i8], ptr %8, i64 0, i64 0
  %29 = load i64, ptr %10, align 8
  %30 = getelementptr inbounds i8, ptr %28, i64 %29
  %31 = load i64, ptr %10, align 8
  %32 = sub i64 64, %31
  call void @llvm.memset.p0.i64(ptr align 1 %30, i8 0, i64 %32, i1 false)
  %33 = getelementptr inbounds [8 x i32], ptr %7, i64 0, i64 0
  %34 = getelementptr inbounds [64 x i8], ptr %8, i64 0, i64 0
  call void @process_block(ptr noundef %33, ptr noundef %34)
  %35 = load i64, ptr %10, align 8
  %36 = load i64, ptr %9, align 8
  %37 = add i64 %36, %35
  store i64 %37, ptr %9, align 8
  %38 = load i64, ptr %10, align 8
  %39 = load i64, ptr %5, align 8
  %40 = sub i64 %39, %38
  store i64 %40, ptr %5, align 8
  br label %12, !llvm.loop !6

41:                                               ; preds = %12
  %42 = getelementptr inbounds [8 x i32], ptr %7, i64 0, i64 0
  %43 = load ptr, ptr %6, align 8
  call void @finalize_hash(ptr noundef %42, ptr noundef %43)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_hash(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %16, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 32
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr %9, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %14)
  br label %16

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %5, !llvm.loop !8

19:                                               ; preds = %5
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_state(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %15, %1
  %5 = load i32, ptr %3, align 4
  %6 = sext i32 %5 to i64
  %7 = icmp ult i64 %6, 8
  br i1 %7, label %8, label %18

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = xor i32 %9, -1412623820
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  store i32 %10, ptr %14, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  br label %4, !llvm.loop !9

18:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @process_block(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %55, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %58

10:                                               ; preds = %7
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, ptr %11, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  %19 = mul nsw i32 %16, %18
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = urem i64 %22, 8
  %24 = getelementptr inbounds i32, ptr %20, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = xor i32 %25, %19
  store i32 %26, ptr %24, align 4
  store i32 0, ptr %6, align 4
  br label %27

27:                                               ; preds = %51, %10
  %28 = load i32, ptr %6, align 4
  %29 = icmp slt i32 %28, 32
  br i1 %29, label %30, label %54

30:                                               ; preds = %27
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = urem i64 %33, 8
  %35 = getelementptr inbounds i32, ptr %31, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = shl i32 %36, 5
  %38 = load ptr, ptr %3, align 8
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %41 = urem i64 %40, 8
  %42 = getelementptr inbounds i32, ptr %38, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = lshr i32 %43, 27
  %45 = or i32 %37, %44
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = urem i64 %48, 8
  %50 = getelementptr inbounds i32, ptr %46, i64 %49
  store i32 %45, ptr %50, align 4
  br label %51

51:                                               ; preds = %30
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %6, align 4
  br label %27, !llvm.loop !10

54:                                               ; preds = %27
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %5, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %5, align 4
  br label %7, !llvm.loop !11

58:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @finalize_hash(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %65, %2
  %7 = load i32, ptr %5, align 4
  %8 = sext i32 %7 to i64
  %9 = icmp ult i64 %8, 8
  br i1 %9, label %10, label %68

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = lshr i32 %15, 24
  %17 = and i32 %16, 255
  %18 = trunc i32 %17 to i8
  %19 = load ptr, ptr %4, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 4
  %23 = getelementptr inbounds i8, ptr %19, i64 %22
  store i8 %18, ptr %23, align 1
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %24, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = lshr i32 %28, 16
  %30 = and i32 %29, 255
  %31 = trunc i32 %30 to i8
  %32 = load ptr, ptr %4, align 8
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 4
  %36 = add i64 %35, 1
  %37 = getelementptr inbounds i8, ptr %32, i64 %36
  store i8 %31, ptr %37, align 1
  %38 = load ptr, ptr %3, align 8
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = lshr i32 %42, 8
  %44 = and i32 %43, 255
  %45 = trunc i32 %44 to i8
  %46 = load ptr, ptr %4, align 8
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = mul i64 %48, 4
  %50 = add i64 %49, 2
  %51 = getelementptr inbounds i8, ptr %46, i64 %50
  store i8 %45, ptr %51, align 1
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %5, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %52, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = and i32 %56, 255
  %58 = trunc i32 %57 to i8
  %59 = load ptr, ptr %4, align 8
  %60 = load i32, ptr %5, align 4
  %61 = sext i32 %60 to i64
  %62 = mul i64 %61, 4
  %63 = add i64 %62, 3
  %64 = getelementptr inbounds i8, ptr %59, i64 %63
  store i8 %58, ptr %64, align 1
  br label %65

65:                                               ; preds = %10
  %66 = load i32, ptr %5, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %5, align 4
  br label %6, !llvm.loop !12

68:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind willreturn memory(read) }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
