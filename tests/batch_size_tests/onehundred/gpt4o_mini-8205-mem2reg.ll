; ModuleID = 'LLVM_IR/gpt4o_mini-8205.ll'
source_filename = "DATASETv2/gpt4o_mini-8205.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [64 x i8] c"Surprise! Welcome to the world of cryptographic hash functions!\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Hash: \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.3 = private unnamed_addr constant [56 x i8] c"\0ASurprise! That's the hash of the input message above!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [32 x i8], align 16
  %2 = call i64 @strlen(ptr noundef @.str) #5
  %3 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  call void @hash_message(ptr noundef @.str, i64 noundef %2, ptr noundef %3)
  %4 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  call void @print_hash(ptr noundef %4)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @hash_message(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca [8 x i32], align 16
  %5 = alloca [64 x i8], align 16
  %6 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  call void @initialize_state(ptr noundef %6)
  br label %7

7:                                                ; preds = %13, %3
  %.01 = phi i64 [ %1, %3 ], [ %23, %13 ]
  %.0 = phi i64 [ 0, %3 ], [ %22, %13 ]
  %8 = icmp ugt i64 %.01, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %7
  %10 = icmp ult i64 %.01, 64
  br i1 %10, label %11, label %12

11:                                               ; preds = %9
  br label %13

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %12, %11
  %14 = phi i64 [ %.01, %11 ], [ 64, %12 ]
  %15 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %16 = getelementptr inbounds i8, ptr %0, i64 %.0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %15, ptr align 1 %16, i64 %14, i1 false)
  %17 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %18 = getelementptr inbounds i8, ptr %17, i64 %14
  %19 = sub i64 64, %14
  call void @llvm.memset.p0.i64(ptr align 1 %18, i8 0, i64 %19, i1 false)
  %20 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  %21 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  call void @process_block(ptr noundef %20, ptr noundef %21)
  %22 = add i64 %.0, %14
  %23 = sub i64 %.01, %14
  br label %7, !llvm.loop !6

24:                                               ; preds = %7
  %25 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  call void @finalize_hash(ptr noundef %25, ptr noundef %2)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_hash(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %3

3:                                                ; preds = %11, %1
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %4 = icmp slt i32 %.0, 32
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %9)
  br label %11

11:                                               ; preds = %5
  %12 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

13:                                               ; preds = %3
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialize_state(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.0 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = sext i32 %.0 to i64
  %4 = icmp ult i64 %3, 8
  br i1 %4, label %5, label %11

5:                                                ; preds = %2
  %6 = xor i32 %.0, -1412623820
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i32, ptr %0, i64 %7
  store i32 %6, ptr %8, align 4
  br label %9

9:                                                ; preds = %5
  %10 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

11:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @process_block(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %37, %2
  %.01 = phi i32 [ 0, %2 ], [ %38, %37 ]
  %4 = icmp slt i32 %.01, 64
  br i1 %4, label %5, label %39

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds i8, ptr %1, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = add nsw i32 %.01, 1
  %11 = mul nsw i32 %9, %10
  %12 = sext i32 %.01 to i64
  %13 = urem i64 %12, 8
  %14 = getelementptr inbounds i32, ptr %0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = xor i32 %15, %11
  store i32 %16, ptr %14, align 4
  br label %17

17:                                               ; preds = %34, %5
  %.0 = phi i32 [ 0, %5 ], [ %35, %34 ]
  %18 = icmp slt i32 %.0, 32
  br i1 %18, label %19, label %36

19:                                               ; preds = %17
  %20 = sext i32 %.01 to i64
  %21 = urem i64 %20, 8
  %22 = getelementptr inbounds i32, ptr %0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = shl i32 %23, 5
  %25 = sext i32 %.01 to i64
  %26 = urem i64 %25, 8
  %27 = getelementptr inbounds i32, ptr %0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = lshr i32 %28, 27
  %30 = or i32 %24, %29
  %31 = sext i32 %.01 to i64
  %32 = urem i64 %31, 8
  %33 = getelementptr inbounds i32, ptr %0, i64 %32
  store i32 %30, ptr %33, align 4
  br label %34

34:                                               ; preds = %19
  %35 = add nsw i32 %.0, 1
  br label %17, !llvm.loop !10

36:                                               ; preds = %17
  br label %37

37:                                               ; preds = %36
  %38 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !11

39:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @finalize_hash(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %45, %2
  %.0 = phi i32 [ 0, %2 ], [ %46, %45 ]
  %4 = sext i32 %.0 to i64
  %5 = icmp ult i64 %4, 8
  br i1 %5, label %6, label %47

6:                                                ; preds = %3
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i32, ptr %0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = lshr i32 %9, 24
  %11 = and i32 %10, 255
  %12 = trunc i32 %11 to i8
  %13 = sext i32 %.0 to i64
  %14 = mul i64 %13, 4
  %15 = getelementptr inbounds i8, ptr %1, i64 %14
  store i8 %12, ptr %15, align 1
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds i32, ptr %0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = lshr i32 %18, 16
  %20 = and i32 %19, 255
  %21 = trunc i32 %20 to i8
  %22 = sext i32 %.0 to i64
  %23 = mul i64 %22, 4
  %24 = add i64 %23, 1
  %25 = getelementptr inbounds i8, ptr %1, i64 %24
  store i8 %21, ptr %25, align 1
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds i32, ptr %0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = lshr i32 %28, 8
  %30 = and i32 %29, 255
  %31 = trunc i32 %30 to i8
  %32 = sext i32 %.0 to i64
  %33 = mul i64 %32, 4
  %34 = add i64 %33, 2
  %35 = getelementptr inbounds i8, ptr %1, i64 %34
  store i8 %31, ptr %35, align 1
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds i32, ptr %0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = and i32 %38, 255
  %40 = trunc i32 %39 to i8
  %41 = sext i32 %.0 to i64
  %42 = mul i64 %41, 4
  %43 = add i64 %42, 3
  %44 = getelementptr inbounds i8, ptr %1, i64 %43
  store i8 %40, ptr %44, align 1
  br label %45

45:                                               ; preds = %6
  %46 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !12

47:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
