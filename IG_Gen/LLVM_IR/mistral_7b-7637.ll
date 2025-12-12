; ModuleID = 'DATASETv2/mistral_7b-7637.c'
source_filename = "DATASETv2/mistral_7b-7637.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.HappyBuffer = type { i32, ptr }

@.str = private unnamed_addr constant [17 x i8] c"0123456789ABCDEF\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"Error: Could not read file completely.\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"input.bin\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"Read %u bytes from file '%s'\0A\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"File content before checksum calculation:\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"Checksum: %08X\0A\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"File content after modification:\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"Checksum after modification: %08X\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @happyPrint(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %44, %1
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %3, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i8, ptr %5, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %47

11:                                               ; preds = %4
  %12 = call ptr @__ctype_b_loc() #7
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %14, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, ptr %13, i64 %20
  %22 = load i16, ptr %21, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 1024
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %34

26:                                               ; preds = %11
  %27 = load ptr, ptr %2, align 8
  %28 = load i32, ptr %3, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = call i32 @toupper(i32 noundef %32) #8
  br label %41

34:                                               ; preds = %11
  %35 = load ptr, ptr %2, align 8
  %36 = load i32, ptr %3, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %35, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  br label %41

41:                                               ; preds = %34, %26
  %42 = phi i32 [ %33, %26 ], [ %40, %34 ]
  %43 = call i32 @putchar(i32 noundef %42)
  br label %44

44:                                               ; preds = %41
  %45 = load i32, ptr %3, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %3, align 4
  br label %4, !llvm.loop !6

47:                                               ; preds = %4
  %48 = call i32 @putchar(i32 noundef 10)
  ret void
}

declare i32 @putchar(i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @happyHexPrint(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  br label %6

6:                                                ; preds = %43, %2
  %7 = load i64, ptr %5, align 8
  %8 = load i64, ptr %4, align 8
  %9 = icmp ult i64 %7, %8
  br i1 %9, label %10, label %46

10:                                               ; preds = %6
  %11 = call i32 @putchar(i32 noundef 37)
  %12 = load ptr, ptr %3, align 8
  %13 = load i64, ptr %5, align 8
  %14 = getelementptr inbounds i8, ptr %12, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = ashr i32 %16, 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [17 x i8], ptr @.str, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 @putchar(i32 noundef %21)
  %23 = load ptr, ptr %3, align 8
  %24 = load i64, ptr %5, align 8
  %25 = getelementptr inbounds i8, ptr %23, i64 %24
  %26 = load i8, ptr %25, align 1
  %27 = zext i8 %26 to i32
  %28 = and i32 %27, 15
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [17 x i8], ptr @.str, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = call i32 @putchar(i32 noundef %32)
  %34 = load i64, ptr %5, align 8
  %35 = add i64 %34, 1
  %36 = urem i64 %35, 32
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %40

38:                                               ; preds = %10
  %39 = call i32 @putchar(i32 noundef 10)
  br label %42

40:                                               ; preds = %10
  %41 = call i32 @putchar(i32 noundef 32)
  br label %42

42:                                               ; preds = %40, %38
  br label %43

43:                                               ; preds = %42
  %44 = load i64, ptr %5, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %5, align 8
  br label %6, !llvm.loop !8

46:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @happyCalcChecksum(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i64 0, ptr %6, align 8
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i64, ptr %6, align 8
  %9 = load i64, ptr %4, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i64, ptr %6, align 8
  %14 = getelementptr inbounds i8, ptr %12, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32, ptr %5, align 4
  %18 = add i32 %17, %16
  store i32 %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i64, ptr %6, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr %6, align 8
  br label %7, !llvm.loop !9

22:                                               ; preds = %7
  %23 = load i32, ptr %5, align 4
  %24 = lshr i32 %23, 16
  %25 = load i32, ptr %5, align 4
  %26 = and i32 %25, 65535
  %27 = add i32 %24, %26
  store i32 %27, ptr %5, align 4
  %28 = load i32, ptr %5, align 4
  %29 = lshr i32 %28, 16
  %30 = load i32, ptr %5, align 4
  %31 = and i32 %30, 65535
  %32 = add i32 %29, %31
  store i32 %32, ptr %5, align 4
  %33 = load i32, ptr %5, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind  uwtable
define dso_local { i32, ptr } @happyReadFile(ptr noundef %0) #0 {
  %2 = alloca %struct.HappyBuffer, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noalias ptr @fopen(ptr noundef %7, ptr noundef @.str.1)
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @fseek(ptr noundef %9, i64 noundef 0, i32 noundef 2)
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @ftell(ptr noundef %11)
  store i64 %12, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call i32 @fseek(ptr noundef %13, i64 noundef 0, i32 noundef 0)
  %15 = load i64, ptr %5, align 8
  %16 = trunc i64 %15 to i32
  %17 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 0
  store i32 %16, ptr %17, align 8
  %18 = load i64, ptr %5, align 8
  %19 = call noalias ptr @malloc(i64 noundef %18) #9
  %20 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  store ptr %19, ptr %20, align 8
  %21 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %5, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = call i64 @fread(ptr noundef %22, i64 noundef 1, i64 noundef %23, ptr noundef %24)
  store i64 %25, ptr %6, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = call i32 @fclose(ptr noundef %26)
  %28 = load i64, ptr %6, align 8
  %29 = load i64, ptr %5, align 8
  %30 = icmp ne i64 %28, %29
  br i1 %30, label %31, label %35

31:                                               ; preds = %1
  %32 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  call void @free(ptr noundef %33) #10
  %34 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 0
  store i32 0, ptr %34, align 8
  call void @happyPrint(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #11
  unreachable

35:                                               ; preds = %1
  %36 = load { i32, ptr }, ptr %2, align 8
  ret { i32, ptr } %36
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #1

declare i64 @ftell(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca %struct.HappyBuffer, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %6 = call i64 @time(ptr noundef null) #10
  %7 = trunc i64 %6 to i32
  call void @srand(i32 noundef %7) #10
  store ptr @.str.3, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = call { i32, ptr } @happyReadFile(ptr noundef %8)
  %10 = getelementptr inbounds { i32, ptr }, ptr %3, i32 0, i32 0
  %11 = extractvalue { i32, ptr } %9, 0
  store i32 %11, ptr %10, align 8
  %12 = getelementptr inbounds { i32, ptr }, ptr %3, i32 0, i32 1
  %13 = extractvalue { i32, ptr } %9, 1
  store ptr %13, ptr %12, align 8
  %14 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %15, ptr noundef %16)
  call void @happyPrint(ptr noundef @.str.5)
  %18 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = zext i32 %21 to i64
  call void @happyHexPrint(ptr noundef %19, i64 noundef %22)
  %23 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = zext i32 %26 to i64
  %28 = call i32 @happyCalcChecksum(ptr noundef %24, i64 noundef %27)
  store i32 %28, ptr %4, align 4
  %29 = load i32, ptr %4, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %29)
  %31 = call i32 @rand() #10
  %32 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = urem i32 %31, %33
  %35 = zext i32 %34 to i64
  store i64 %35, ptr %5, align 8
  br label %36

36:                                               ; preds = %53, %0
  %37 = load i64, ptr %5, align 8
  %38 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = zext i32 %39 to i64
  %41 = icmp ult i64 %37, %40
  br i1 %41, label %42, label %60

42:                                               ; preds = %36
  %43 = call i32 @rand() #10
  %44 = srem i32 %43, 255
  %45 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = load i64, ptr %5, align 8
  %48 = getelementptr inbounds i8, ptr %46, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = xor i32 %50, %44
  %52 = trunc i32 %51 to i8
  store i8 %52, ptr %48, align 1
  br label %53

53:                                               ; preds = %42
  %54 = call i32 @rand() #10
  %55 = srem i32 %54, 10
  %56 = add nsw i32 %55, 1
  %57 = sext i32 %56 to i64
  %58 = load i64, ptr %5, align 8
  %59 = add i64 %58, %57
  store i64 %59, ptr %5, align 8
  br label %36, !llvm.loop !10

60:                                               ; preds = %36
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %62 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = zext i32 %65 to i64
  call void @happyHexPrint(ptr noundef %63, i64 noundef %66)
  %67 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = zext i32 %70 to i64
  %72 = call i32 @happyCalcChecksum(ptr noundef %68, i64 noundef %71)
  store i32 %72, ptr %4, align 4
  %73 = load i32, ptr %4, align 4
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %73)
  %75 = getelementptr inbounds %struct.HappyBuffer, ptr %3, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  call void @free(ptr noundef %76) #10
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #5

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #5

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }

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
