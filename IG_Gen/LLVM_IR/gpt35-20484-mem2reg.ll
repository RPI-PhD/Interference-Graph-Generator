; ModuleID = 'LLVM_IR/gpt35-20484.ll'
source_filename = "DATASETv2/gpt35-20484.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Error opening file!\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.3 = private unnamed_addr constant [45 x i8] c"Invalid password! File cannot be decrypted.\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Choose an option:\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"1. Encrypt a file\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"2. Decrypt a file\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [39 x i8] c"Enter the file name (with extension): \00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [43 x i8] c"Enter the new file name (with extension): \00", align 1
@.str.11 = private unnamed_addr constant [45 x i8] c"Enter the password (maximum 10 characters): \00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"File encrypted successfully!\0A\00", align 1
@.str.13 = private unnamed_addr constant [30 x i8] c"File decrypted successfully!\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Invalid choice!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt_file(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca [1024 x i8], align 16
  %5 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #4
  unreachable

9:                                                ; preds = %3
  %10 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str.2)
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %14 = call i32 @fclose(ptr noundef %5)
  call void @exit(i32 noundef 1) #4
  unreachable

15:                                               ; preds = %9
  %16 = call i64 @fwrite(ptr noundef %2, i64 noundef 1, i64 noundef 10, ptr noundef %10)
  br label %17

17:                                               ; preds = %41, %15
  %18 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %19 = call i64 @fread(ptr noundef %18, i64 noundef 1, i64 noundef 1024, ptr noundef %5)
  %20 = trunc i64 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %45

22:                                               ; preds = %17
  br label %23

23:                                               ; preds = %39, %22
  %.0 = phi i32 [ 0, %22 ], [ %40, %39 ]
  %24 = icmp slt i32 %.0, %20
  br i1 %24, label %25, label %41

25:                                               ; preds = %23
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = srem i32 %.0, 10
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, ptr %2, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = xor i32 %29, %34
  %36 = trunc i32 %35 to i8
  %37 = sext i32 %.0 to i64
  %38 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %37
  store i8 %36, ptr %38, align 1
  br label %39

39:                                               ; preds = %25
  %40 = add nsw i32 %.0, 1
  br label %23, !llvm.loop !6

41:                                               ; preds = %23
  %42 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %43 = sext i32 %20 to i64
  %44 = call i64 @fwrite(ptr noundef %42, i64 noundef 1, i64 noundef %43, ptr noundef %10)
  br label %17, !llvm.loop !8

45:                                               ; preds = %17
  %46 = call i32 @fclose(ptr noundef %5)
  %47 = call i32 @fclose(ptr noundef %10)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @fclose(ptr noundef) #1

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @decrypt_file(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca [1024 x i8], align 16
  %5 = alloca [10 x i8], align 1
  %6 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #4
  unreachable

10:                                               ; preds = %3
  %11 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str.2)
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %15 = call i32 @fclose(ptr noundef %6)
  call void @exit(i32 noundef 1) #4
  unreachable

16:                                               ; preds = %10
  %17 = getelementptr inbounds [10 x i8], ptr %5, i64 0, i64 0
  %18 = call i64 @fread(ptr noundef %17, i64 noundef 1, i64 noundef 10, ptr noundef %6)
  %19 = getelementptr inbounds [10 x i8], ptr %5, i64 0, i64 0
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef %2) #5
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %16
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %24 = call i32 @fclose(ptr noundef %6)
  %25 = call i32 @fclose(ptr noundef %11)
  call void @exit(i32 noundef 1) #4
  unreachable

26:                                               ; preds = %16
  br label %27

27:                                               ; preds = %51, %26
  %28 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %29 = call i64 @fread(ptr noundef %28, i64 noundef 1, i64 noundef 1024, ptr noundef %6)
  %30 = trunc i64 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %55

32:                                               ; preds = %27
  br label %33

33:                                               ; preds = %49, %32
  %.0 = phi i32 [ 0, %32 ], [ %50, %49 ]
  %34 = icmp slt i32 %.0, %30
  br i1 %34, label %35, label %51

35:                                               ; preds = %33
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = srem i32 %.0, 10
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %2, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = xor i32 %39, %44
  %46 = trunc i32 %45 to i8
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %47
  store i8 %46, ptr %48, align 1
  br label %49

49:                                               ; preds = %35
  %50 = add nsw i32 %.0, 1
  br label %33, !llvm.loop !9

51:                                               ; preds = %33
  %52 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %53 = sext i32 %30 to i64
  %54 = call i64 @fwrite(ptr noundef %52, i64 noundef 1, i64 noundef %53, ptr noundef %11)
  br label %27, !llvm.loop !10

55:                                               ; preds = %27
  %56 = call i32 @fclose(ptr noundef %6)
  %57 = call i32 @fclose(ptr noundef %11)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = alloca [10 x i8], align 1
  %4 = alloca i32, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %4)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %10 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %13 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %16 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 0
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %16)
  %18 = load i32, ptr %4, align 4
  switch i32 %18, label %29 [
    i32 1, label %19
    i32 2, label %24
  ]

19:                                               ; preds = %0
  %20 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %21 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %22 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 0
  call void @encrypt_file(ptr noundef %20, ptr noundef %21, ptr noundef %22)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %31

24:                                               ; preds = %0
  %25 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %26 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %27 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 0
  call void @decrypt_file(ptr noundef %25, ptr noundef %26, ptr noundef %27)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %31

29:                                               ; preds = %0
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @exit(i32 noundef 1) #4
  unreachable

31:                                               ; preds = %24, %19
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
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
