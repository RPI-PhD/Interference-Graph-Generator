; ModuleID = 'LLVM_IR/gemini_pro-32555.ll'
source_filename = "DATASETv2/gemini_pro-32555.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stdin = external global ptr, align 8
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"The string is a palindrome\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"The string is not a palindrome\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_palindrome(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %20, %2
  %.01 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %4 = sdiv i32 %1, 2
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %22

6:                                                ; preds = %3
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = sub nsw i32 %1, 1
  %12 = sub nsw i32 %11, %.01
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %10, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %6
  br label %23

19:                                               ; preds = %6
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !6

22:                                               ; preds = %3
  br label %23

23:                                               ; preds = %22, %18
  %.0 = phi i32 [ 0, %18 ], [ 1, %22 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @str_len(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %8, %1
  %.0 = phi i32 [ 0, %1 ], [ %9, %8 ]
  %3 = sext i32 %.0 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

10:                                               ; preds = %2
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @get_string() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  store ptr null, ptr %1, align 8
  store i64 0, ptr %2, align 8
  %3 = load ptr, ptr @stdin, align 8
  %4 = call i64 @getline(ptr noundef %1, ptr noundef %2, ptr noundef %3)
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

declare i64 @getline(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_message(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @get_string()
  %2 = call i32 @str_len(ptr noundef %1)
  %3 = call i32 @is_palindrome(ptr noundef %1, i32 noundef %2)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  call void @print_message(ptr noundef @.str.1)
  br label %7

6:                                                ; preds = %0
  call void @print_message(ptr noundef @.str.2)
  br label %7

7:                                                ; preds = %6, %5
  call void @free(ptr noundef %1) #3
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
