; ModuleID = 'LLVM_IR/falcon180b-19793.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @hash_init(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 0
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 1
  %4 = getelementptr inbounds [64 x i8], ptr %3, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 4 %4, i8 0, i64 64, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @hash_update(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4, align 4
  %6 = add nsw i32 %5, %2
  store i32 %6, ptr %4, align 4
  br label %7

7:                                                ; preds = %24, %3
  %.0 = phi i32 [ 0, %3 ], [ %25, %24 ]
  %8 = icmp slt i32 %.0, %2
  br i1 %8, label %9, label %26

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %1, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = zext i8 %12 to i32
  %14 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 1
  %15 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = srem i32 %16, 64
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [64 x i8], ptr %14, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = zext i8 %20 to i32
  %22 = xor i32 %21, %13
  %23 = trunc i32 %22 to i8
  store i8 %23, ptr %19, align 1
  br label %24

24:                                               ; preds = %9
  %25 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

26:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @hash_final(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = srem i32 %4, 64
  %6 = sub nsw i32 64, %5
  call void @hash_update(ptr noundef %0, ptr noundef @.str, i32 noundef %6)
  %7 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 0
  call void @hash_update(ptr noundef %0, ptr noundef %7, i32 noundef 4)
  br label %8

8:                                                ; preds = %20, %2
  %.0 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %9 = icmp slt i32 %.0, 64
  br i1 %9, label %10, label %22

10:                                               ; preds = %8
  %11 = mul nsw i32 %.0, 2
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %1, i64 %12
  %14 = getelementptr inbounds %struct.hash_t, ptr %0, i32 0, i32 1
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [64 x i8], ptr %14, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %13, ptr noundef @.str.1, i32 noundef %18) #4
  br label %20

20:                                               ; preds = %10
  %21 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !8

22:                                               ; preds = %8
  ret void
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i64, align 8
  %2 = alloca [64 x i8], align 16
  %3 = alloca %struct.hash_t, align 4
  %4 = alloca [4096 x i8], align 16
  %5 = alloca [129 x i8], align 16
  %6 = call i64 @time(ptr noundef null) #4
  store i64 %6, ptr %1, align 8
  %7 = call ptr @localtime(ptr noundef %1) #4
  %8 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 0
  %9 = call i64 @strftime(ptr noundef %8, i64 noundef 64, ptr noundef @.str.2, ptr noundef %7) #4
  call void @hash_init(ptr noundef %3)
  %10 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %39

14:                                               ; preds = %0
  br label %15

15:                                               ; preds = %20, %14
  %16 = getelementptr inbounds [4096 x i8], ptr %4, i64 0, i64 0
  %17 = call i64 @fread(ptr noundef %16, i64 noundef 1, i64 noundef 4096, ptr noundef %10)
  %18 = trunc i64 %17 to i32
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %15
  %21 = getelementptr inbounds [4096 x i8], ptr %4, i64 0, i64 0
  call void @hash_update(ptr noundef %3, ptr noundef %21, i32 noundef %18)
  br label %15, !llvm.loop !9

22:                                               ; preds = %15
  %23 = getelementptr inbounds [129 x i8], ptr %5, i64 0, i64 0
  call void @hash_final(ptr noundef %3, ptr noundef %23)
  %24 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %24)
  br label %26

26:                                               ; preds = %34, %22
  %.01 = phi i32 [ 0, %22 ], [ %35, %34 ]
  %27 = icmp slt i32 %.01, 128
  br i1 %27, label %28, label %36

28:                                               ; preds = %26
  %29 = sext i32 %.01 to i64
  %30 = getelementptr inbounds [129 x i8], ptr %5, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %32)
  br label %34

34:                                               ; preds = %28
  %35 = add nsw i32 %.01, 1
  br label %26, !llvm.loop !10

36:                                               ; preds = %26
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %38 = call i32 @fclose(ptr noundef %10)
  br label %39

39:                                               ; preds = %36, %12
  %.0 = phi i32 [ 0, %36 ], [ 1, %12 ]
  ret i32 %.0
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
