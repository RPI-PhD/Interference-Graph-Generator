; ModuleID = 'LLVM_IR/llama2-13B-18316.ll'
source_filename = "DATASETv2/llama2-13B-18316.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.encryption_ctx = type { [16 x i8], [16 x i8] }

@__const.main.plaintext = private unnamed_addr constant [14 x i8] c"Hello, World!\00", align 1
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_ctx(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 1 %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %5 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 1 %5, i8 0, i64 16, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %38, %2
  %.01 = phi i32 [ 0, %2 ], [ %39, %38 ]
  %4 = sext i32 %.01 to i64
  %5 = call i64 @strlen(ptr noundef %1) #6
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %40

7:                                                ; preds = %3
  br label %8

8:                                                ; preds = %27, %7
  %.0 = phi i32 [ 0, %7 ], [ %28, %27 ]
  %9 = icmp slt i32 %.0, 16
  br i1 %9, label %10, label %29

10:                                               ; preds = %8
  %11 = add nsw i32 %.01, %.0
  %12 = srem i32 %11, 16
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds i8, ptr %1, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 0
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds [16 x i8], ptr %17, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = xor i32 %16, %21
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [16 x i8], ptr %24, i64 0, i64 %25
  store i8 %23, ptr %26, align 1
  br label %27

27:                                               ; preds = %10
  %28 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !6

29:                                               ; preds = %8
  %30 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %31 = getelementptr inbounds [16 x i8], ptr %30, i64 0, i64 0
  %32 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %33 = getelementptr inbounds [16 x i8], ptr %32, i64 0, i64 0
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  %36 = sub nsw i32 16, %.0
  %37 = sext i32 %36 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %31, ptr align 1 %35, i64 %37, i1 false)
  br label %38

38:                                               ; preds = %29
  %39 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

40:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @decrypt(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %38, %2
  %.01 = phi i32 [ 0, %2 ], [ %39, %38 ]
  %4 = sext i32 %.01 to i64
  %5 = call i64 @strlen(ptr noundef %1) #6
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %40

7:                                                ; preds = %3
  br label %8

8:                                                ; preds = %27, %7
  %.0 = phi i32 [ 0, %7 ], [ %28, %27 ]
  %9 = icmp slt i32 %.0, 16
  br i1 %9, label %10, label %29

10:                                               ; preds = %8
  %11 = add nsw i32 %.01, %.0
  %12 = srem i32 %11, 16
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds i8, ptr %1, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 0
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds [16 x i8], ptr %17, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = xor i32 %16, %21
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [16 x i8], ptr %24, i64 0, i64 %25
  store i8 %23, ptr %26, align 1
  br label %27

27:                                               ; preds = %10
  %28 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !9

29:                                               ; preds = %8
  %30 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %31 = getelementptr inbounds [16 x i8], ptr %30, i64 0, i64 0
  %32 = getelementptr inbounds %struct.encryption_ctx, ptr %0, i32 0, i32 1
  %33 = getelementptr inbounds [16 x i8], ptr %32, i64 0, i64 0
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  %36 = sub nsw i32 16, %.0
  %37 = sext i32 %36 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %31, ptr align 1 %35, i64 %37, i1 false)
  br label %38

38:                                               ; preds = %29
  %39 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !10

40:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.encryption_ctx, align 1
  %2 = alloca [14 x i8], align 1
  call void @init_ctx(ptr noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.plaintext, i64 14, i1 false)
  %3 = getelementptr inbounds [14 x i8], ptr %2, i64 0, i64 0
  %4 = call i64 @strlen(ptr noundef %3) #6
  %5 = mul i64 %4, 16
  %6 = call ptr @llvm.stacksave.p0()
  %7 = alloca i8, i64 %5, align 16
  %8 = getelementptr inbounds [14 x i8], ptr %2, i64 0, i64 0
  call void @encrypt(ptr noundef %1, ptr noundef %8)
  %9 = getelementptr inbounds %struct.encryption_ctx, ptr %1, i32 0, i32 1
  %10 = getelementptr inbounds [16 x i8], ptr %9, i64 0, i64 0
  %11 = getelementptr inbounds [14 x i8], ptr %2, i64 0, i64 0
  %12 = call i64 @strlen(ptr noundef %11) #6
  %13 = mul i64 %12, 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 1 %10, i64 %13, i1 false)
  call void @decrypt(ptr noundef %1, ptr noundef %7)
  %14 = getelementptr inbounds %struct.encryption_ctx, ptr %1, i32 0, i32 1
  %15 = getelementptr inbounds [16 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %15)
  call void @llvm.stackrestore.p0(ptr %6)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #4

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
