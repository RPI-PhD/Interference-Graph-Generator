; ModuleID = 'LLVM_IR/falcon180b-55667.ll'
source_filename = "DATASETv2/falcon180b-55667.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.generate_message.charset = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 16
@.str = private unnamed_addr constant [22 x i8] c"Original message: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Watermark: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Embedded image: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Extracted watermark: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_message(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [63 x i8], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.generate_message.charset, i64 63, i1 false)
  br label %4

4:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = call i32 @rand() #7
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [63 x i8], ptr %3, i64 0, i64 0
  %10 = call i64 @strlen(ptr noundef %9) #8
  %11 = urem i64 %8, %10
  %12 = getelementptr inbounds [63 x i8], ptr %3, i64 0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  store i8 %13, ptr %15, align 1
  br label %16

16:                                               ; preds = %6
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

18:                                               ; preds = %4
  %19 = sext i32 %1 to i64
  %20 = getelementptr inbounds i8, ptr %0, i64 %19
  store i8 0, ptr %20, align 1
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @embed_watermark(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %23, %4
  %.0 = phi i32 [ 0, %4 ], [ %24, %23 ]
  %6 = icmp slt i32 %.0, %2
  br i1 %6, label %7, label %25

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  br label %25

14:                                               ; preds = %7
  %15 = srem i32 %.0, %3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = getelementptr inbounds i8, ptr %1, i64 0
  %19 = load i8, ptr %18, align 1
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds i8, ptr %0, i64 %20
  store i8 %19, ptr %21, align 1
  br label %22

22:                                               ; preds = %17, %14
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !8

25:                                               ; preds = %13, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @extract_watermark(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = add nsw i32 %2, 1
  %5 = sext i32 %4 to i64
  %6 = call noalias ptr @malloc(i64 noundef %5) #9
  %7 = add nsw i32 %2, 1
  %8 = sext i32 %7 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %6, i8 0, i64 %8, i1 false)
  br label %9

9:                                                ; preds = %29, %3
  %.01 = phi i32 [ 0, %3 ], [ %.1, %29 ]
  %.0 = phi i32 [ 0, %3 ], [ %30, %29 ]
  %10 = icmp slt i32 %.0, %1
  br i1 %10, label %11, label %31

11:                                               ; preds = %9
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i8, ptr %0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %11
  br label %31

18:                                               ; preds = %11
  %19 = srem i32 %.0, %2
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = add nsw i32 %.01, 1
  %26 = sext i32 %.01 to i64
  %27 = getelementptr inbounds i8, ptr %6, i64 %26
  store i8 %24, ptr %27, align 1
  br label %28

28:                                               ; preds = %21, %18
  %.1 = phi i32 [ %25, %21 ], [ %.01, %18 ]
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !9

31:                                               ; preds = %17, %9
  ret ptr %6
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000000 x i8], align 16
  %2 = alloca [1000000 x i8], align 16
  %3 = getelementptr inbounds [1000000 x i8], ptr %1, i64 0, i64 0
  %4 = call i32 @rand() #7
  %5 = srem i32 %4, 1000000
  call void @generate_message(ptr noundef %3, i32 noundef %5)
  %6 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %7 = call i32 @rand() #7
  %8 = srem i32 %7, 1000000
  call void @generate_message(ptr noundef %6, i32 noundef %8)
  %9 = getelementptr inbounds [1000000 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %9)
  %11 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %11)
  %13 = getelementptr inbounds [1000000 x i8], ptr %1, i64 0, i64 0
  %14 = call i64 @strlen(ptr noundef %13) #8
  %15 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %16 = call i64 @strlen(ptr noundef %15) #8
  %17 = add i64 %14, %16
  %18 = add i64 %17, 1
  %19 = call noalias ptr @malloc(i64 noundef %18) #9
  %20 = getelementptr inbounds [1000000 x i8], ptr %1, i64 0, i64 0
  %21 = call ptr @strcpy(ptr noundef %19, ptr noundef %20) #7
  %22 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %23 = getelementptr inbounds [1000000 x i8], ptr %1, i64 0, i64 0
  %24 = call i64 @strlen(ptr noundef %23) #8
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %27 = call i64 @strlen(ptr noundef %26) #8
  %28 = trunc i64 %27 to i32
  call void @embed_watermark(ptr noundef %19, ptr noundef %22, i32 noundef %25, i32 noundef %28)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %19)
  %30 = call i64 @strlen(ptr noundef %19) #8
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds [1000000 x i8], ptr %2, i64 0, i64 0
  %33 = call i64 @strlen(ptr noundef %32) #8
  %34 = trunc i64 %33 to i32
  %35 = call ptr @extract_watermark(ptr noundef %19, i32 noundef %31, i32 noundef %34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %35)
  call void @free(ptr noundef %19) #7
  call void @free(ptr noundef %35) #7
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
