; ModuleID = 'DATASETv2/falcon180b-26924.c'
source_filename = "DATASETv2/falcon180b-26924.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [55 x i8] c"Enter the name of the file to be encrypted/decrypted: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"\0AEnter your choice:\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"1. Encrypt file\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"2. Decrypt file\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"encrypted_file.txt\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.10 = private unnamed_addr constant [62 x i8] c"\0AFile encrypted successfully and saved as encrypted_file.txt\0A\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"decrypted_file.txt\00", align 1
@.str.12 = private unnamed_addr constant [62 x i8] c"\0AFile decrypted successfully and saved as decrypted_file.txt\0A\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"Invalid choice\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encrypt_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = call i64 @time(ptr noundef null) #6
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %6, align 4
  br label %9

9:                                                ; preds = %39, %2
  %10 = load ptr, ptr %3, align 8
  %11 = call i32 @fgetc(ptr noundef %10)
  %12 = trunc i32 %11 to i8
  store i8 %12, ptr %5, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %15, label %44

15:                                               ; preds = %9
  %16 = call ptr @__ctype_b_loc() #7
  %17 = load ptr, ptr %16, align 8
  %18 = load i8, ptr %5, align 1
  %19 = sext i8 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, ptr %17, i64 %20
  %22 = load i16, ptr %21, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 1024
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %39

26:                                               ; preds = %15
  %27 = load i8, ptr %5, align 1
  %28 = sext i8 %27 to i32
  %29 = call i32 @toupper(i32 noundef %28) #8
  %30 = trunc i32 %29 to i8
  store i8 %30, ptr %5, align 1
  %31 = load i8, ptr %5, align 1
  %32 = sext i8 %31 to i32
  %33 = sub nsw i32 %32, 65
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  %36 = srem i32 %35, 26
  %37 = add nsw i32 %36, 65
  %38 = trunc i32 %37 to i8
  store i8 %38, ptr %5, align 1
  br label %39

39:                                               ; preds = %26, %15
  %40 = load i8, ptr %5, align 1
  %41 = sext i8 %40 to i32
  %42 = load ptr, ptr %4, align 8
  %43 = call i32 @fputc(i32 noundef %41, ptr noundef %42)
  br label %9, !llvm.loop !6

44:                                               ; preds = %9
  %45 = load ptr, ptr %3, align 8
  %46 = call i32 @fclose(ptr noundef %45)
  %47 = load ptr, ptr %4, align 8
  %48 = call i32 @fclose(ptr noundef %47)
  ret void
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @fgetc(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #4

declare i32 @fputc(i32 noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @decrypt_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = call i64 @time(ptr noundef null) #6
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %6, align 4
  br label %9

9:                                                ; preds = %40, %2
  %10 = load ptr, ptr %3, align 8
  %11 = call i32 @fgetc(ptr noundef %10)
  %12 = trunc i32 %11 to i8
  store i8 %12, ptr %5, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %15, label %45

15:                                               ; preds = %9
  %16 = call ptr @__ctype_b_loc() #7
  %17 = load ptr, ptr %16, align 8
  %18 = load i8, ptr %5, align 1
  %19 = sext i8 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, ptr %17, i64 %20
  %22 = load i16, ptr %21, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 1024
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %40

26:                                               ; preds = %15
  %27 = load i8, ptr %5, align 1
  %28 = sext i8 %27 to i32
  %29 = call i32 @toupper(i32 noundef %28) #8
  %30 = trunc i32 %29 to i8
  store i8 %30, ptr %5, align 1
  %31 = load i8, ptr %5, align 1
  %32 = sext i8 %31 to i32
  %33 = sub nsw i32 %32, 65
  %34 = load i32, ptr %6, align 4
  %35 = sub nsw i32 %33, %34
  %36 = add nsw i32 %35, 26
  %37 = srem i32 %36, 26
  %38 = add nsw i32 %37, 65
  %39 = trunc i32 %38 to i8
  store i8 %39, ptr %5, align 1
  br label %40

40:                                               ; preds = %26, %15
  %41 = load i8, ptr %5, align 1
  %42 = sext i8 %41 to i32
  %43 = load ptr, ptr %4, align 8
  %44 = call i32 @fputc(i32 noundef %42, ptr noundef %43)
  br label %9, !llvm.loop !8

45:                                               ; preds = %9
  %46 = load ptr, ptr %3, align 8
  %47 = call i32 @fclose(ptr noundef %46)
  %48 = load ptr, ptr %4, align 8
  %49 = call i32 @fclose(ptr noundef %48)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [100 x i8], align 16
  %5 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7)
  %9 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %10 = call noalias ptr @fopen(ptr noundef %9, ptr noundef @.str.2)
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #9
  unreachable

15:                                               ; preds = %0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %5)
  %20 = load i8, ptr %5, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 49
  br i1 %22, label %23, label %28

23:                                               ; preds = %15
  %24 = call noalias ptr @fopen(ptr noundef @.str.8, ptr noundef @.str.9)
  store ptr %24, ptr %3, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = load ptr, ptr %3, align 8
  call void @encrypt_file(ptr noundef %25, ptr noundef %26)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %40

28:                                               ; preds = %15
  %29 = load i8, ptr %5, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 50
  br i1 %31, label %32, label %37

32:                                               ; preds = %28
  %33 = call noalias ptr @fopen(ptr noundef @.str.11, ptr noundef @.str.9)
  store ptr %33, ptr %3, align 8
  %34 = load ptr, ptr %2, align 8
  %35 = load ptr, ptr %3, align 8
  call void @decrypt_file(ptr noundef %34, ptr noundef %35)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %39

37:                                               ; preds = %28
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %39

39:                                               ; preds = %37, %32
  br label %40

40:                                               ; preds = %39, %23
  %41 = load ptr, ptr %2, align 8
  %42 = call i32 @fclose(ptr noundef %41)
  %43 = load ptr, ptr %3, align 8
  %44 = call i32 @fclose(ptr noundef %43)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { noreturn nounwind }

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
