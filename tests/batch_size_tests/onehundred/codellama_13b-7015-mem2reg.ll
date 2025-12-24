; ModuleID = 'LLVM_IR/codellama_13b-7015.ll'
source_filename = "DATASETv2/codellama_13b-7015.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"Usage: %s <text_to_encrypt> <key>\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"-d\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %1) #4
  %4 = trunc i64 %3 to i32
  %5 = call i64 @strlen(ptr noundef %0) #4
  %6 = trunc i64 %5 to i32
  br label %7

7:                                                ; preds = %24, %2
  %.0 = phi i32 [ 0, %2 ], [ %25, %24 ]
  %8 = icmp slt i32 %.0, %6
  br i1 %8, label %9, label %26

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = srem i32 %.0, %4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %1, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = add nsw i32 %13, %18
  %20 = srem i32 %19, 256
  %21 = trunc i32 %20 to i8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  store i8 %21, ptr %23, align 1
  br label %24

24:                                               ; preds = %9
  %25 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

26:                                               ; preds = %7
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @decrypt(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %1) #4
  %4 = trunc i64 %3 to i32
  %5 = call i64 @strlen(ptr noundef %0) #4
  %6 = trunc i64 %5 to i32
  br label %7

7:                                                ; preds = %24, %2
  %.0 = phi i32 [ 0, %2 ], [ %25, %24 ]
  %8 = icmp slt i32 %.0, %6
  br i1 %8, label %9, label %26

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = srem i32 %.0, %4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %1, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = sub nsw i32 %13, %18
  %20 = srem i32 %19, 256
  %21 = trunc i32 %20 to i8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  store i8 %21, ptr %23, align 1
  br label %24

24:                                               ; preds = %9
  %25 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

26:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1024 x i8], align 16
  %4 = alloca [1024 x i8], align 16
  %5 = icmp ne i32 %0, 2
  br i1 %5, label %6, label %12

6:                                                ; preds = %2
  %7 = icmp ne i32 %0, 4
  br i1 %7, label %8, label %12

8:                                                ; preds = %6
  %9 = getelementptr inbounds ptr, ptr %1, i64 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %10)
  br label %36

12:                                               ; preds = %6, %2
  %13 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %14 = getelementptr inbounds ptr, ptr %1, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call ptr @strcpy(ptr noundef %13, ptr noundef %15) #5
  %17 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %18 = getelementptr inbounds ptr, ptr %1, i64 2
  %19 = load ptr, ptr %18, align 8
  %20 = call ptr @strcpy(ptr noundef %17, ptr noundef %19) #5
  %21 = icmp eq i32 %0, 4
  br i1 %21, label %22, label %30

22:                                               ; preds = %12
  %23 = getelementptr inbounds ptr, ptr %1, i64 3
  %24 = load ptr, ptr %23, align 8
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @.str.1) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %22
  %28 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %29 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  call void @decrypt(ptr noundef %28, ptr noundef %29)
  br label %33

30:                                               ; preds = %22, %12
  %31 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %32 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  call void @encrypt(ptr noundef %31, ptr noundef %32)
  br label %33

33:                                               ; preds = %30, %27
  %34 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %34)
  br label %36

36:                                               ; preds = %33, %8
  %.0 = phi i32 [ 1, %8 ], [ 0, %33 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
attributes #5 = { nounwind }

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
