; ModuleID = 'LLVM_IR/gpt4o_mini-17442.ll'
source_filename = "DATASETv2/gpt4o_mini-17442.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@uppercase = dso_local constant [26 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ", align 16
@lowercase = dso_local constant [26 x i8] c"abcdefghijklmnopqrstuvwxyz", align 16
@digits = dso_local constant [10 x i8] c"0123456789", align 1
@special = dso_local constant [10 x i8] c"!@#$%^&*()", align 1
@__const.generate_password.types = private unnamed_addr constant [4 x i32] [i32 26, i32 26, i32 10, i32 10], align 16
@__const.generate_password.sets = private unnamed_addr constant [4 x ptr] [ptr @uppercase, ptr @lowercase, ptr @digits, ptr @special], align 16
@.str = private unnamed_addr constant [31 x i8] c"Generated Secure Password: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i64 @time(ptr noundef null) #5
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #5
  %5 = sub nsw i32 %1, 1
  br label %6

6:                                                ; preds = %22, %2
  %.0 = phi i32 [ %5, %2 ], [ %23, %22 ]
  %7 = icmp sgt i32 %.0, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %6
  %9 = call i32 @rand() #5
  %10 = add nsw i32 %.0, 1
  %11 = srem i32 %9, %10
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i8, ptr %0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i32 %11 to i64
  %16 = getelementptr inbounds i8, ptr %0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds i8, ptr %0, i64 %18
  store i8 %17, ptr %19, align 1
  %20 = sext i32 %11 to i64
  %21 = getelementptr inbounds i8, ptr %0, i64 %20
  store i8 %14, ptr %21, align 1
  br label %22

22:                                               ; preds = %8
  %23 = add nsw i32 %.0, -1
  br label %6, !llvm.loop !6

24:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_password(ptr noundef %0) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = alloca [4 x i32], align 16
  %4 = alloca [4 x ptr], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.generate_password.types, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.generate_password.sets, i64 32, i1 false)
  %5 = call i32 @rand() #5
  %6 = srem i32 %5, 26
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [26 x i8], ptr @uppercase, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = getelementptr inbounds i8, ptr %0, i64 0
  store i8 %9, ptr %10, align 1
  %11 = call i32 @rand() #5
  %12 = srem i32 %11, 26
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [26 x i8], ptr @lowercase, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = getelementptr inbounds i8, ptr %0, i64 1
  store i8 %15, ptr %16, align 1
  %17 = call i32 @rand() #5
  %18 = srem i32 %17, 10
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x i8], ptr @digits, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = getelementptr inbounds i8, ptr %0, i64 2
  store i8 %21, ptr %22, align 1
  %23 = call i32 @rand() #5
  %24 = srem i32 %23, 10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x i8], ptr @special, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = getelementptr inbounds i8, ptr %0, i64 3
  store i8 %27, ptr %28, align 1
  %29 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 0
  %30 = load i32, ptr %29, align 16
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %29, align 16
  %32 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 1
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %32, align 4
  %35 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 2
  %36 = load i32, ptr %35, align 8
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %35, align 8
  %38 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 3
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %38, align 4
  br label %41

41:                                               ; preds = %63, %1
  %.0 = phi i32 [ 4, %1 ], [ %64, %63 ]
  %42 = icmp slt i32 %.0, 16
  br i1 %42, label %43, label %65

43:                                               ; preds = %41
  %44 = call i32 @rand() #5
  %45 = srem i32 %44, 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [4 x ptr], ptr %4, i64 0, i64 %46
  %48 = load ptr, ptr %47, align 8
  %49 = call i32 @rand() #5
  %50 = sext i32 %45 to i64
  %51 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = srem i32 %49, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %48, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = sext i32 %.0 to i64
  %58 = getelementptr inbounds i8, ptr %0, i64 %57
  store i8 %56, ptr %58, align 1
  %59 = sext i32 %45 to i64
  %60 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %60, align 4
  br label %63

63:                                               ; preds = %43
  %64 = add nsw i32 %.0, 1
  br label %41, !llvm.loop !8

65:                                               ; preds = %41
  call void @shuffle(ptr noundef %0, i32 noundef 16)
  %66 = getelementptr inbounds i8, ptr %0, i64 16
  store i8 0, ptr %66, align 1
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_password(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [17 x i8], align 16
  %2 = call i64 @time(ptr noundef null) #5
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #5
  %4 = getelementptr inbounds [17 x i8], ptr %1, i64 0, i64 0
  call void @generate_password(ptr noundef %4)
  %5 = getelementptr inbounds [17 x i8], ptr %1, i64 0, i64 0
  call void @display_password(ptr noundef %5)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
