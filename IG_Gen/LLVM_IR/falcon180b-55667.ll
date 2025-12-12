; ModuleID = 'DATASETv2/falcon180b-55667.c'
source_filename = "DATASETv2/falcon180b-55667.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.generate_message.charset = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 16
@.str = private unnamed_addr constant [22 x i8] c"Original message: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Watermark: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Embedded image: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Extracted watermark: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_message(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [63 x i8], align 16
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.generate_message.charset, i64 63, i1 false)
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %23, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %7
  %12 = call i32 @rand() #7
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [63 x i8], ptr %5, i64 0, i64 0
  %15 = call i64 @strlen(ptr noundef %14) #8
  %16 = urem i64 %13, %15
  %17 = getelementptr inbounds [63 x i8], ptr %5, i64 0, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, ptr %19, i64 %21
  store i8 %18, ptr %22, align 1
  br label %23

23:                                               ; preds = %11
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %7, !llvm.loop !6

26:                                               ; preds = %7
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  store i8 0, ptr %30, align 1
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @embed_watermark(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %10

10:                                               ; preds = %37, %4
  %11 = load i32, ptr %9, align 4
  %12 = load i32, ptr %7, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %40

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr %15, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %14
  br label %40

23:                                               ; preds = %14
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %8, align 4
  %26 = srem i32 %24, %25
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds i8, ptr %29, i64 0
  %31 = load i8, ptr %30, align 1
  %32 = load ptr, ptr %5, align 8
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, ptr %32, i64 %34
  store i8 %31, ptr %35, align 1
  br label %36

36:                                               ; preds = %28, %23
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %9, align 4
  br label %10, !llvm.loop !8

40:                                               ; preds = %22, %10
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @extract_watermark(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = call noalias ptr @malloc(i64 noundef %12) #9
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %14, i8 0, i64 %17, i1 false)
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %18

18:                                               ; preds = %48, %3
  %19 = load i32, ptr %9, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %51

22:                                               ; preds = %18
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %22
  br label %51

31:                                               ; preds = %22
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %6, align 4
  %34 = srem i32 %32, %33
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %47

36:                                               ; preds = %31
  %37 = load ptr, ptr %4, align 8
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %37, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = load ptr, ptr %7, align 8
  %43 = load i32, ptr %8, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %8, align 4
  %45 = sext i32 %43 to i64
  %46 = getelementptr inbounds i8, ptr %42, i64 %45
  store i8 %41, ptr %46, align 1
  br label %47

47:                                               ; preds = %36, %31
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %9, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %9, align 4
  br label %18, !llvm.loop !9

51:                                               ; preds = %30, %18
  %52 = load ptr, ptr %7, align 8
  ret ptr %52
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000000 x i8], align 16
  %3 = alloca [1000000 x i8], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %6 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %7 = call i32 @rand() #7
  %8 = srem i32 %7, 1000000
  call void @generate_message(ptr noundef %6, i32 noundef %8)
  %9 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %10 = call i32 @rand() #7
  %11 = srem i32 %10, 1000000
  call void @generate_message(ptr noundef %9, i32 noundef %11)
  %12 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %12)
  %14 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %14)
  %16 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %17 = call i64 @strlen(ptr noundef %16) #8
  %18 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %19 = call i64 @strlen(ptr noundef %18) #8
  %20 = add i64 %17, %19
  %21 = add i64 %20, 1
  %22 = call noalias ptr @malloc(i64 noundef %21) #9
  store ptr %22, ptr %4, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %25 = call ptr @strcpy(ptr noundef %23, ptr noundef %24) #7
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %28 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %29 = call i64 @strlen(ptr noundef %28) #8
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %32 = call i64 @strlen(ptr noundef %31) #8
  %33 = trunc i64 %32 to i32
  call void @embed_watermark(ptr noundef %26, ptr noundef %27, i32 noundef %30, i32 noundef %33)
  %34 = load ptr, ptr %4, align 8
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %34)
  %36 = load ptr, ptr %4, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = call i64 @strlen(ptr noundef %37) #8
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds [1000000 x i8], ptr %3, i64 0, i64 0
  %41 = call i64 @strlen(ptr noundef %40) #8
  %42 = trunc i64 %41 to i32
  %43 = call ptr @extract_watermark(ptr noundef %36, i32 noundef %39, i32 noundef %42)
  store ptr %43, ptr %5, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %44)
  %46 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %46) #7
  %47 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %47) #7
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind allocsize(0) }

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
