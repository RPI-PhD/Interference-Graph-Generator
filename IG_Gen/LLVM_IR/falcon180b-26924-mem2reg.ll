; ModuleID = 'LLVM_IR/falcon180b-26924.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @time(ptr noundef null) #6
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %30, %2
  %6 = call i32 @fgetc(ptr noundef %0)
  %7 = trunc i32 %6 to i8
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, -1
  br i1 %9, label %10, label %33

10:                                               ; preds = %5
  %11 = call ptr @__ctype_b_loc() #7
  %12 = load ptr, ptr %11, align 8
  %13 = sext i8 %7 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i16, ptr %12, i64 %14
  %16 = load i16, ptr %15, align 2
  %17 = zext i16 %16 to i32
  %18 = and i32 %17, 1024
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %30

20:                                               ; preds = %10
  %21 = sext i8 %7 to i32
  %22 = call i32 @toupper(i32 noundef %21) #8
  %23 = trunc i32 %22 to i8
  %24 = sext i8 %23 to i32
  %25 = sub nsw i32 %24, 65
  %26 = add nsw i32 %25, %4
  %27 = srem i32 %26, 26
  %28 = add nsw i32 %27, 65
  %29 = trunc i32 %28 to i8
  br label %30

30:                                               ; preds = %20, %10
  %.0 = phi i8 [ %29, %20 ], [ %7, %10 ]
  %31 = sext i8 %.0 to i32
  %32 = call i32 @fputc(i32 noundef %31, ptr noundef %1)
  br label %5, !llvm.loop !6

33:                                               ; preds = %5
  %34 = call i32 @fclose(ptr noundef %0)
  %35 = call i32 @fclose(ptr noundef %1)
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @decrypt_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @time(ptr noundef null) #6
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %31, %2
  %6 = call i32 @fgetc(ptr noundef %0)
  %7 = trunc i32 %6 to i8
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, -1
  br i1 %9, label %10, label %34

10:                                               ; preds = %5
  %11 = call ptr @__ctype_b_loc() #7
  %12 = load ptr, ptr %11, align 8
  %13 = sext i8 %7 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i16, ptr %12, i64 %14
  %16 = load i16, ptr %15, align 2
  %17 = zext i16 %16 to i32
  %18 = and i32 %17, 1024
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %10
  %21 = sext i8 %7 to i32
  %22 = call i32 @toupper(i32 noundef %21) #8
  %23 = trunc i32 %22 to i8
  %24 = sext i8 %23 to i32
  %25 = sub nsw i32 %24, 65
  %26 = sub nsw i32 %25, %4
  %27 = add nsw i32 %26, 26
  %28 = srem i32 %27, 26
  %29 = add nsw i32 %28, 65
  %30 = trunc i32 %29 to i8
  br label %31

31:                                               ; preds = %20, %10
  %.0 = phi i8 [ %30, %20 ], [ %7, %10 ]
  %32 = sext i8 %.0 to i32
  %33 = call i32 @fputc(i32 noundef %32, ptr noundef %1)
  br label %5, !llvm.loop !8

34:                                               ; preds = %5
  %35 = call i32 @fclose(ptr noundef %0)
  %36 = call i32 @fclose(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i8, align 1
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %4)
  %6 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %7 = call noalias ptr @fopen(ptr noundef %6, ptr noundef @.str.2)
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #9
  unreachable

11:                                               ; preds = %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %2)
  %16 = load i8, ptr %2, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 49
  br i1 %18, label %19, label %22

19:                                               ; preds = %11
  %20 = call noalias ptr @fopen(ptr noundef @.str.8, ptr noundef @.str.9)
  call void @encrypt_file(ptr noundef %7, ptr noundef %20)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %32

22:                                               ; preds = %11
  %23 = load i8, ptr %2, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 50
  br i1 %25, label %26, label %29

26:                                               ; preds = %22
  %27 = call noalias ptr @fopen(ptr noundef @.str.11, ptr noundef @.str.9)
  call void @decrypt_file(ptr noundef %7, ptr noundef %27)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %31

29:                                               ; preds = %22
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %31

31:                                               ; preds = %29, %26
  %.0 = phi ptr [ %27, %26 ], [ undef, %29 ]
  br label %32

32:                                               ; preds = %31, %19
  %.1 = phi ptr [ %20, %19 ], [ %.0, %31 ]
  %33 = call i32 @fclose(ptr noundef %7)
  %34 = call i32 @fclose(ptr noundef %.1)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
