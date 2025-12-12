; ModuleID = 'DATASETv2/gpt35-20484.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encrypt_file(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca [1024 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %3
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #4
  unreachable

18:                                               ; preds = %3
  %19 = load ptr, ptr %5, align 8
  %20 = call noalias ptr @fopen(ptr noundef %19, ptr noundef @.str.2)
  store ptr %20, ptr %8, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %27

23:                                               ; preds = %18
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %25 = load ptr, ptr %7, align 8
  %26 = call i32 @fclose(ptr noundef %25)
  call void @exit(i32 noundef 1) #4
  unreachable

27:                                               ; preds = %18
  %28 = load ptr, ptr %6, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = call i64 @fwrite(ptr noundef %28, i64 noundef 1, i64 noundef 10, ptr noundef %29)
  br label %31

31:                                               ; preds = %63, %27
  %32 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %33 = load ptr, ptr %7, align 8
  %34 = call i64 @fread(ptr noundef %32, i64 noundef 1, i64 noundef 1024, ptr noundef %33)
  %35 = trunc i64 %34 to i32
  store i32 %35, ptr %10, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %69

37:                                               ; preds = %31
  store i32 0, ptr %11, align 4
  br label %38

38:                                               ; preds = %60, %37
  %39 = load i32, ptr %11, align 4
  %40 = load i32, ptr %10, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %63

42:                                               ; preds = %38
  %43 = load i32, ptr %11, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 %44
  %46 = load i8, ptr %45, align 1
  %47 = sext i8 %46 to i32
  %48 = load ptr, ptr %6, align 8
  %49 = load i32, ptr %11, align 4
  %50 = srem i32 %49, 10
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, ptr %48, i64 %51
  %53 = load i8, ptr %52, align 1
  %54 = sext i8 %53 to i32
  %55 = xor i32 %47, %54
  %56 = trunc i32 %55 to i8
  %57 = load i32, ptr %11, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 %58
  store i8 %56, ptr %59, align 1
  br label %60

60:                                               ; preds = %42
  %61 = load i32, ptr %11, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %11, align 4
  br label %38, !llvm.loop !6

63:                                               ; preds = %38
  %64 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %65 = load i32, ptr %10, align 4
  %66 = sext i32 %65 to i64
  %67 = load ptr, ptr %8, align 8
  %68 = call i64 @fwrite(ptr noundef %64, i64 noundef 1, i64 noundef %66, ptr noundef %67)
  br label %31, !llvm.loop !8

69:                                               ; preds = %31
  %70 = load ptr, ptr %7, align 8
  %71 = call i32 @fclose(ptr noundef %70)
  %72 = load ptr, ptr %8, align 8
  %73 = call i32 @fclose(ptr noundef %72)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @fclose(ptr noundef) #1

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @decrypt_file(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca [1024 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [10 x i8], align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call noalias ptr @fopen(ptr noundef %13, ptr noundef @.str)
  store ptr %14, ptr %7, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %3
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #4
  unreachable

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  %21 = call noalias ptr @fopen(ptr noundef %20, ptr noundef @.str.2)
  store ptr %21, ptr %8, align 8
  %22 = load ptr, ptr %8, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %28

24:                                               ; preds = %19
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %26 = load ptr, ptr %7, align 8
  %27 = call i32 @fclose(ptr noundef %26)
  call void @exit(i32 noundef 1) #4
  unreachable

28:                                               ; preds = %19
  %29 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 0
  %30 = load ptr, ptr %7, align 8
  %31 = call i64 @fread(ptr noundef %29, i64 noundef 1, i64 noundef 10, ptr noundef %30)
  %32 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 0
  %33 = load ptr, ptr %6, align 8
  %34 = call i32 @strcmp(ptr noundef %32, ptr noundef %33) #5
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %42

36:                                               ; preds = %28
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %38 = load ptr, ptr %7, align 8
  %39 = call i32 @fclose(ptr noundef %38)
  %40 = load ptr, ptr %8, align 8
  %41 = call i32 @fclose(ptr noundef %40)
  call void @exit(i32 noundef 1) #4
  unreachable

42:                                               ; preds = %28
  br label %43

43:                                               ; preds = %75, %42
  %44 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %45 = load ptr, ptr %7, align 8
  %46 = call i64 @fread(ptr noundef %44, i64 noundef 1, i64 noundef 1024, ptr noundef %45)
  %47 = trunc i64 %46 to i32
  store i32 %47, ptr %10, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %81

49:                                               ; preds = %43
  store i32 0, ptr %11, align 4
  br label %50

50:                                               ; preds = %72, %49
  %51 = load i32, ptr %11, align 4
  %52 = load i32, ptr %10, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %75

54:                                               ; preds = %50
  %55 = load i32, ptr %11, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 %56
  %58 = load i8, ptr %57, align 1
  %59 = sext i8 %58 to i32
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %11, align 4
  %62 = srem i32 %61, 10
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, ptr %60, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = sext i8 %65 to i32
  %67 = xor i32 %59, %66
  %68 = trunc i32 %67 to i8
  %69 = load i32, ptr %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 %70
  store i8 %68, ptr %71, align 1
  br label %72

72:                                               ; preds = %54
  %73 = load i32, ptr %11, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %11, align 4
  br label %50, !llvm.loop !9

75:                                               ; preds = %50
  %76 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %77 = load i32, ptr %10, align 4
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %8, align 8
  %80 = call i64 @fwrite(ptr noundef %76, i64 noundef 1, i64 noundef %78, ptr noundef %79)
  br label %43, !llvm.loop !10

81:                                               ; preds = %43
  %82 = load ptr, ptr %7, align 8
  %83 = call i32 @fclose(ptr noundef %82)
  %84 = load ptr, ptr %8, align 8
  %85 = call i32 @fclose(ptr noundef %84)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca [10 x i8], align 1
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %5)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %11 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %14 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %14)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %17 = getelementptr inbounds [10 x i8], ptr %4, i64 0, i64 0
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %17)
  %19 = load i32, ptr %5, align 4
  switch i32 %19, label %30 [
    i32 1, label %20
    i32 2, label %25
  ]

20:                                               ; preds = %0
  %21 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %22 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %23 = getelementptr inbounds [10 x i8], ptr %4, i64 0, i64 0
  call void @encrypt_file(ptr noundef %21, ptr noundef %22, ptr noundef %23)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %32

25:                                               ; preds = %0
  %26 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %27 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %28 = getelementptr inbounds [10 x i8], ptr %4, i64 0, i64 0
  call void @decrypt_file(ptr noundef %26, ptr noundef %27, ptr noundef %28)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %32

30:                                               ; preds = %0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @exit(i32 noundef 1) #4
  unreachable

32:                                               ; preds = %25, %20
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
