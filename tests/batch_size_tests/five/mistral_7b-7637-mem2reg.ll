; ModuleID = 'LLVM_IR/mistral_7b-7637.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @happyPrint(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %34, %1
  %.0 = phi i32 [ 0, %1 ], [ %35, %34 ]
  %3 = sext i32 %.0 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %36

7:                                                ; preds = %2
  %8 = call ptr @__ctype_b_loc() #7
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i16, ptr %9, i64 %14
  %16 = load i16, ptr %15, align 2
  %17 = zext i16 %16 to i32
  %18 = and i32 %17, 1024
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %7
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds i8, ptr %0, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = call i32 @toupper(i32 noundef %24) #8
  br label %31

26:                                               ; preds = %7
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds i8, ptr %0, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  br label %31

31:                                               ; preds = %26, %20
  %32 = phi i32 [ %25, %20 ], [ %30, %26 ]
  %33 = call i32 @putchar(i32 noundef %32)
  br label %34

34:                                               ; preds = %31
  %35 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

36:                                               ; preds = %2
  %37 = call i32 @putchar(i32 noundef 10)
  ret void
}

declare i32 @putchar(i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @happyHexPrint(ptr noundef %0, i64 noundef %1) #0 {
  br label %3

3:                                                ; preds = %33, %2
  %.0 = phi i64 [ 0, %2 ], [ %34, %33 ]
  %4 = icmp ult i64 %.0, %1
  br i1 %4, label %5, label %35

5:                                                ; preds = %3
  %6 = call i32 @putchar(i32 noundef 37)
  %7 = getelementptr inbounds i8, ptr %0, i64 %.0
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = ashr i32 %9, 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [17 x i8], ptr @.str, i64 0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 @putchar(i32 noundef %14)
  %16 = getelementptr inbounds i8, ptr %0, i64 %.0
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = and i32 %18, 15
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [17 x i8], ptr @.str, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = call i32 @putchar(i32 noundef %23)
  %25 = add i64 %.0, 1
  %26 = urem i64 %25, 32
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %5
  %29 = call i32 @putchar(i32 noundef 10)
  br label %32

30:                                               ; preds = %5
  %31 = call i32 @putchar(i32 noundef 32)
  br label %32

32:                                               ; preds = %30, %28
  br label %33

33:                                               ; preds = %32
  %34 = add i64 %.0, 1
  br label %3, !llvm.loop !8

35:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @happyCalcChecksum(ptr noundef %0, i64 noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %2
  %.01 = phi i32 [ 0, %2 ], [ %9, %10 ]
  %.0 = phi i64 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp ult i64 %.0, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = getelementptr inbounds i8, ptr %0, i64 %.0
  %7 = load i8, ptr %6, align 1
  %8 = zext i8 %7 to i32
  %9 = add i32 %.01, %8
  br label %10

10:                                               ; preds = %5
  %11 = add i64 %.0, 1
  br label %3, !llvm.loop !9

12:                                               ; preds = %3
  %13 = lshr i32 %.01, 16
  %14 = and i32 %.01, 65535
  %15 = add i32 %13, %14
  %16 = lshr i32 %15, 16
  %17 = and i32 %15, 65535
  %18 = add i32 %16, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i32, ptr } @happyReadFile(ptr noundef %0) #0 {
  %2 = alloca %struct.HappyBuffer, align 8
  %3 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.1)
  %4 = call i32 @fseek(ptr noundef %3, i64 noundef 0, i32 noundef 2)
  %5 = call i64 @ftell(ptr noundef %3)
  %6 = call i32 @fseek(ptr noundef %3, i64 noundef 0, i32 noundef 0)
  %7 = trunc i64 %5 to i32
  %8 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 0
  store i32 %7, ptr %8, align 8
  %9 = call noalias ptr @malloc(i64 noundef %5) #9
  %10 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = call i64 @fread(ptr noundef %12, i64 noundef 1, i64 noundef %5, ptr noundef %3)
  %14 = call i32 @fclose(ptr noundef %3)
  %15 = icmp ne i64 %13, %5
  br i1 %15, label %16, label %20

16:                                               ; preds = %1
  %17 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %18) #10
  %19 = getelementptr inbounds %struct.HappyBuffer, ptr %2, i32 0, i32 0
  store i32 0, ptr %19, align 8
  call void @happyPrint(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #11
  unreachable

20:                                               ; preds = %1
  %21 = load { i32, ptr }, ptr %2, align 8
  ret { i32, ptr } %21
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.HappyBuffer, align 8
  %2 = call i64 @time(ptr noundef null) #10
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #10
  %4 = call { i32, ptr } @happyReadFile(ptr noundef @.str.3)
  %5 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %6 = extractvalue { i32, ptr } %4, 0
  store i32 %6, ptr %5, align 8
  %7 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 1
  %8 = extractvalue { i32, ptr } %4, 1
  store ptr %8, ptr %7, align 8
  %9 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %10, ptr noundef @.str.3)
  call void @happyPrint(ptr noundef @.str.5)
  %12 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = zext i32 %15 to i64
  call void @happyHexPrint(ptr noundef %13, i64 noundef %16)
  %17 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = zext i32 %20 to i64
  %22 = call i32 @happyCalcChecksum(ptr noundef %18, i64 noundef %21)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %22)
  %24 = call i32 @rand() #10
  %25 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = urem i32 %24, %26
  %28 = zext i32 %27 to i64
  br label %29

29:                                               ; preds = %44, %0
  %.0 = phi i64 [ %28, %0 ], [ %49, %44 ]
  %30 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = zext i32 %31 to i64
  %33 = icmp ult i64 %.0, %32
  br i1 %33, label %34, label %50

34:                                               ; preds = %29
  %35 = call i32 @rand() #10
  %36 = srem i32 %35, 255
  %37 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds i8, ptr %38, i64 %.0
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i32
  %42 = xor i32 %41, %36
  %43 = trunc i32 %42 to i8
  store i8 %43, ptr %39, align 1
  br label %44

44:                                               ; preds = %34
  %45 = call i32 @rand() #10
  %46 = srem i32 %45, 10
  %47 = add nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = add i64 %.0, %48
  br label %29, !llvm.loop !10

50:                                               ; preds = %29
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %52 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %55 = load i32, ptr %54, align 8
  %56 = zext i32 %55 to i64
  call void @happyHexPrint(ptr noundef %53, i64 noundef %56)
  %57 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = zext i32 %60 to i64
  %62 = call i32 @happyCalcChecksum(ptr noundef %58, i64 noundef %61)
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %62)
  %64 = getelementptr inbounds %struct.HappyBuffer, ptr %1, i32 0, i32 1
  %65 = load ptr, ptr %64, align 8
  call void @free(ptr noundef %65) #10
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #5

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #5

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
