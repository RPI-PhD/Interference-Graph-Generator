; ModuleID = 'DATASETv2/gpt4o_mini-17442.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @shuffle(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = call i64 @time(ptr noundef null) #5
  %9 = trunc i64 %8 to i32
  call void @srand(i32 noundef %9) #5
  %10 = load i32, ptr %4, align 4
  %11 = sub nsw i32 %10, 1
  store i32 %11, ptr %5, align 4
  br label %12

12:                                               ; preds = %39, %2
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %42

15:                                               ; preds = %12
  %16 = call i32 @rand() #5
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  %19 = srem i32 %16, %18
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, ptr %20, i64 %22
  %24 = load i8, ptr %23, align 1
  store i8 %24, ptr %7, align 1
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %25, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr %30, i64 %32
  store i8 %29, ptr %33, align 1
  %34 = load i8, ptr %7, align 1
  %35 = load ptr, ptr %3, align 8
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %35, i64 %37
  store i8 %34, ptr %38, align 1
  br label %39

39:                                               ; preds = %15
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, ptr %5, align 4
  br label %12, !llvm.loop !6

42:                                               ; preds = %12
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_password(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [4 x i32], align 16
  %4 = alloca [4 x i32], align 16
  %5 = alloca [4 x ptr], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.generate_password.types, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.generate_password.sets, i64 32, i1 false)
  %9 = call i32 @rand() #5
  %10 = srem i32 %9, 26
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [26 x i8], ptr @uppercase, i64 0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 0
  store i8 %13, ptr %15, align 1
  %16 = call i32 @rand() #5
  %17 = srem i32 %16, 26
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [26 x i8], ptr @lowercase, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds i8, ptr %21, i64 1
  store i8 %20, ptr %22, align 1
  %23 = call i32 @rand() #5
  %24 = srem i32 %23, 10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x i8], ptr @digits, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds i8, ptr %28, i64 2
  store i8 %27, ptr %29, align 1
  %30 = call i32 @rand() #5
  %31 = srem i32 %30, 10
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10 x i8], ptr @special, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds i8, ptr %35, i64 3
  store i8 %34, ptr %36, align 1
  %37 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %37, align 16
  %40 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 1
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %40, align 4
  %43 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 2
  %44 = load i32, ptr %43, align 8
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %43, align 8
  %46 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 3
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %46, align 4
  store i32 12, ptr %6, align 4
  store i32 4, ptr %7, align 4
  br label %49

49:                                               ; preds = %77, %1
  %50 = load i32, ptr %7, align 4
  %51 = icmp slt i32 %50, 16
  br i1 %51, label %52, label %80

52:                                               ; preds = %49
  %53 = call i32 @rand() #5
  %54 = srem i32 %53, 4
  store i32 %54, ptr %8, align 4
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [4 x ptr], ptr %5, i64 0, i64 %56
  %58 = load ptr, ptr %57, align 8
  %59 = call i32 @rand() #5
  %60 = load i32, ptr %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [4 x i32], ptr %4, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = srem i32 %59, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, ptr %58, i64 %65
  %67 = load i8, ptr %66, align 1
  %68 = load ptr, ptr %2, align 8
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, ptr %68, i64 %70
  store i8 %67, ptr %71, align 1
  %72 = load i32, ptr %8, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %74, align 4
  br label %77

77:                                               ; preds = %52
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %7, align 4
  br label %49, !llvm.loop !8

80:                                               ; preds = %49
  %81 = load ptr, ptr %2, align 8
  call void @shuffle(ptr noundef %81, i32 noundef 16)
  %82 = load ptr, ptr %2, align 8
  %83 = getelementptr inbounds i8, ptr %82, i64 16
  store i8 0, ptr %83, align 1
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_password(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [17 x i8], align 16
  store i32 0, ptr %1, align 4
  %3 = call i64 @time(ptr noundef null) #5
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #5
  %5 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  call void @generate_password(ptr noundef %5)
  %6 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  call void @display_password(ptr noundef %6)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
