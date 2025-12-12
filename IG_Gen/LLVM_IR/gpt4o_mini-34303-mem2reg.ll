; ModuleID = 'LLVM_IR/gpt4o_mini-34303.ll'
source_filename = "DATASETv2/gpt4o_mini-34303.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.translate_to_alien.mapping = private unnamed_addr constant [5 x i8] c"@#&!*", align 1
@__const.translate_to_alien.response = private unnamed_addr constant [27 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ\00", align 16
@.str = private unnamed_addr constant [34 x i8] c"Translated to Alien Language: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"Welcome to the Alien Language Translator\0A\00", align 1
@.str.2 = private unnamed_addr constant [63 x i8] c"Please enter a message to translate (or type 'exit' to quit):\0A\00", align 1
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.5 = private unnamed_addr constant [49 x i8] c"Exiting the Alien Language Translator. Goodbye!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @translate_to_alien(ptr noundef %0) #0 {
  %2 = alloca [5 x i8], align 1
  %3 = alloca [27 x i8], align 16
  %4 = alloca [256 x i8], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.translate_to_alien.mapping, i64 5, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.translate_to_alien.response, i64 27, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %4, i8 0, i64 256, i1 false)
  br label %5

5:                                                ; preds = %50, %1
  %.01 = phi i32 [ 0, %1 ], [ %.2, %50 ]
  %.0 = phi i32 [ 0, %1 ], [ %51, %50 ]
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %52

11:                                               ; preds = %5
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i8, ptr %0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp sge i32 %15, 65
  br i1 %16, label %17, label %29

17:                                               ; preds = %11
  %18 = sext i8 %14 to i32
  %19 = icmp sle i32 %18, 90
  br i1 %19, label %20, label %29

20:                                               ; preds = %17
  %21 = sext i8 %14 to i32
  %22 = sub nsw i32 %21, 0
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5 x i8], ptr %2, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = add nsw i32 %.01, 1
  %27 = sext i32 %.01 to i64
  %28 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 %27
  store i8 %25, ptr %28, align 1
  br label %49

29:                                               ; preds = %17, %11
  %30 = sext i8 %14 to i32
  %31 = icmp sge i32 %30, 97
  br i1 %31, label %32, label %44

32:                                               ; preds = %29
  %33 = sext i8 %14 to i32
  %34 = icmp sle i32 %33, 122
  br i1 %34, label %35, label %44

35:                                               ; preds = %32
  %36 = sext i8 %14 to i32
  %37 = sub nsw i32 %36, 2
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [5 x i8], ptr %2, i64 0, i64 %38
  %40 = load i8, ptr %39, align 1
  %41 = add nsw i32 %.01, 1
  %42 = sext i32 %.01 to i64
  %43 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 %42
  store i8 %40, ptr %43, align 1
  br label %48

44:                                               ; preds = %32, %29
  %45 = add nsw i32 %.01, 1
  %46 = sext i32 %.01 to i64
  %47 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 %46
  store i8 %14, ptr %47, align 1
  br label %48

48:                                               ; preds = %44, %35
  %.1 = phi i32 [ %41, %35 ], [ %45, %44 ]
  br label %49

49:                                               ; preds = %48, %20
  %.2 = phi i32 [ %26, %20 ], [ %.1, %48 ]
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

52:                                               ; preds = %5
  %53 = sext i32 %.01 to i64
  %54 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 %53
  store i8 0, ptr %54, align 1
  %55 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %55)
  %57 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %58 = load i8, ptr %57, align 16
  ret i8 %58
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @alien_message_interaction() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %4

4:                                                ; preds = %16, %0
  %5 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 256, ptr noundef %6)
  %8 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %9 = call i64 @strcspn(ptr noundef %8, ptr noundef @.str.3) #5
  %10 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  %11 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.4) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %19

16:                                               ; preds = %4
  %17 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %18 = call signext i8 @translate_to_alien(ptr noundef %17)
  br label %4

19:                                               ; preds = %14
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @alien_message_interaction()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
