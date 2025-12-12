; ModuleID = 'DATASETv2/llama2-13B-18316.c'
source_filename = "DATASETv2/llama2-13B-18316.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.encryption_ctx = type { [16 x i8], [16 x i8] }

@__const.main.plaintext = private unnamed_addr constant [14 x i8] c"Hello, World!\00", align 1
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_ctx(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.encryption_ctx, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 1 %5, i8 0, i64 16, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.encryption_ctx, ptr %6, i32 0, i32 1
  %8 = getelementptr inbounds [16 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 1 %8, i8 0, i64 16, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encrypt(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %59, %2
  %9 = load i32, ptr %5, align 4
  %10 = sext i32 %9 to i64
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @strlen(ptr noundef %11) #6
  %13 = icmp ult i64 %10, %12
  br i1 %13, label %14, label %62

14:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %43, %14
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 16
  br i1 %17, label %18, label %46

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = srem i32 %21, 16
  store i32 %22, ptr %7, align 4
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.encryption_ctx, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [16 x i8], ptr %30, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = xor i32 %28, %35
  %37 = trunc i32 %36 to i8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.encryption_ctx, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [16 x i8], ptr %39, i64 0, i64 %41
  store i8 %37, ptr %42, align 1
  br label %43

43:                                               ; preds = %18
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %6, align 4
  br label %15, !llvm.loop !6

46:                                               ; preds = %15
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.encryption_ctx, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 0
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds %struct.encryption_ctx, ptr %50, i32 0, i32 1
  %52 = getelementptr inbounds [16 x i8], ptr %51, i64 0, i64 0
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %52, i64 %54
  %56 = load i32, ptr %6, align 4
  %57 = sub nsw i32 16, %56
  %58 = sext i32 %57 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %49, ptr align 1 %55, i64 %58, i1 false)
  br label %59

59:                                               ; preds = %46
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %5, align 4
  br label %8, !llvm.loop !8

62:                                               ; preds = %8
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @decrypt(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %59, %2
  %9 = load i32, ptr %5, align 4
  %10 = sext i32 %9 to i64
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @strlen(ptr noundef %11) #6
  %13 = icmp ult i64 %10, %12
  br i1 %13, label %14, label %62

14:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %43, %14
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 16
  br i1 %17, label %18, label %46

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = srem i32 %21, 16
  store i32 %22, ptr %7, align 4
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.encryption_ctx, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [16 x i8], ptr %30, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = xor i32 %28, %35
  %37 = trunc i32 %36 to i8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.encryption_ctx, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [16 x i8], ptr %39, i64 0, i64 %41
  store i8 %37, ptr %42, align 1
  br label %43

43:                                               ; preds = %18
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %6, align 4
  br label %15, !llvm.loop !9

46:                                               ; preds = %15
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.encryption_ctx, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 0
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds %struct.encryption_ctx, ptr %50, i32 0, i32 1
  %52 = getelementptr inbounds [16 x i8], ptr %51, i64 0, i64 0
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %52, i64 %54
  %56 = load i32, ptr %6, align 4
  %57 = sub nsw i32 16, %56
  %58 = sext i32 %57 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %49, ptr align 1 %55, i64 %58, i1 false)
  br label %59

59:                                               ; preds = %46
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %5, align 4
  br label %8, !llvm.loop !10

62:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.encryption_ctx, align 1
  %3 = alloca [14 x i8], align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  call void @init_ctx(ptr noundef %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.plaintext, i64 14, i1 false)
  %6 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0
  %7 = call i64 @strlen(ptr noundef %6) #6
  %8 = mul i64 %7, 16
  %9 = call ptr @llvm.stacksave.p0()
  store ptr %9, ptr %4, align 8
  %10 = alloca i8, i64 %8, align 16
  store i64 %8, ptr %5, align 8
  %11 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0
  call void @encrypt(ptr noundef %2, ptr noundef %11)
  %12 = getelementptr inbounds %struct.encryption_ctx, ptr %2, i32 0, i32 1
  %13 = getelementptr inbounds [16 x i8], ptr %12, i64 0, i64 0
  %14 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0
  %15 = call i64 @strlen(ptr noundef %14) #6
  %16 = mul i64 %15, 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %10, ptr align 1 %13, i64 %16, i1 false)
  call void @decrypt(ptr noundef %2, ptr noundef %10)
  %17 = getelementptr inbounds %struct.encryption_ctx, ptr %2, i32 0, i32 1
  %18 = getelementptr inbounds [16 x i8], ptr %17, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %18)
  store i32 0, ptr %1, align 4
  %20 = load ptr, ptr %4, align 8
  call void @llvm.stackrestore.p0(ptr %20)
  %21 = load i32, ptr %1, align 4
  ret i32 %21
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #4

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }

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
