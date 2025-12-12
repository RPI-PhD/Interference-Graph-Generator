; ModuleID = 'DATASETv2/gpt4o_mini-34303.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local signext i8 @translate_to_alien(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [5 x i8], align 1
  %4 = alloca [27 x i8], align 16
  %5 = alloca [256 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.translate_to_alien.mapping, i64 5, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.translate_to_alien.response, i64 27, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 256, i1 false)
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %68, %1
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %7, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %10, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %71

17:                                               ; preds = %9
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %18, i64 %20
  %22 = load i8, ptr %21, align 1
  store i8 %22, ptr %8, align 1
  %23 = load i8, ptr %8, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp sge i32 %24, 65
  br i1 %25, label %26, label %41

26:                                               ; preds = %17
  %27 = load i8, ptr %8, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp sle i32 %28, 90
  br i1 %29, label %30, label %41

30:                                               ; preds = %26
  %31 = load i8, ptr %8, align 1
  %32 = sext i8 %31 to i32
  %33 = sub nsw i32 %32, 0
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %34
  %36 = load i8, ptr %35, align 1
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %39
  store i8 %36, ptr %40, align 1
  br label %67

41:                                               ; preds = %26, %17
  %42 = load i8, ptr %8, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp sge i32 %43, 97
  br i1 %44, label %45, label %60

45:                                               ; preds = %41
  %46 = load i8, ptr %8, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp sle i32 %47, 122
  br i1 %48, label %49, label %60

49:                                               ; preds = %45
  %50 = load i8, ptr %8, align 1
  %51 = sext i8 %50 to i32
  %52 = sub nsw i32 %51, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %53
  %55 = load i8, ptr %54, align 1
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %6, align 4
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %58
  store i8 %55, ptr %59, align 1
  br label %66

60:                                               ; preds = %45, %41
  %61 = load i8, ptr %8, align 1
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %6, align 4
  %64 = sext i32 %62 to i64
  %65 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %64
  store i8 %61, ptr %65, align 1
  br label %66

66:                                               ; preds = %60, %49
  br label %67

67:                                               ; preds = %66, %30
  br label %68

68:                                               ; preds = %67
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %7, align 4
  br label %9, !llvm.loop !6

71:                                               ; preds = %9
  %72 = load i32, ptr %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %73
  store i8 0, ptr %74, align 1
  %75 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %75)
  %77 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %78 = load i8, ptr %77, align 16
  ret i8 %78
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @alien_message_interaction() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %4

4:                                                ; preds = %0, %16
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @alien_message_interaction()
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
