; ModuleID = 'LLVM_IR/gpt4o_mini-6097.ll'
source_filename = "DATASETv2/gpt4o_mini-6097.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"Circle\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Square\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Triangle\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"Hexagon\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Pentagon\00", align 1
@__const.creature_shape_shift.shapes = private unnamed_addr constant [5 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4], align 16
@.str.5 = private unnamed_addr constant [40 x i8] c"The creature shifts shape %d times... \0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Shape Shifting: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [48 x i8] c"Welcome to the Shape Shifting Input Sanitizer!\0A\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"Please enter a sentence (max %d characters): \00", align 1
@stdin = external global ptr, align 8
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [24 x i8] c"Sanitized output: \22%s\22\0A\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c"All done! Keep your input safe!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sanitize_input(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [256 x i8], align 16
  br label %4

4:                                                ; preds = %48, %2
  %.01 = phi i32 [ 0, %2 ], [ %49, %48 ]
  %.0 = phi i32 [ 0, %2 ], [ %.1, %48 ]
  %5 = sext i32 %.01 to i64
  %6 = getelementptr inbounds i8, ptr %0, i64 %5
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %4
  %11 = icmp slt i32 %.0, 127
  br label %12

12:                                               ; preds = %10, %4
  %13 = phi i1 [ false, %4 ], [ %11, %10 ]
  br i1 %13, label %14, label %50

14:                                               ; preds = %12
  %15 = call ptr @__ctype_b_loc() #6
  %16 = load ptr, ptr %15, align 8
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds i8, ptr %0, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i16, ptr %16, i64 %21
  %23 = load i16, ptr %22, align 2
  %24 = zext i16 %23 to i32
  %25 = and i32 %24, 8
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %40, label %27

27:                                               ; preds = %14
  %28 = call ptr @__ctype_b_loc() #6
  %29 = load ptr, ptr %28, align 8
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds i8, ptr %0, i64 %30
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i16, ptr %29, i64 %34
  %36 = load i16, ptr %35, align 2
  %37 = zext i16 %36 to i32
  %38 = and i32 %37, 8192
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %47

40:                                               ; preds = %27, %14
  %41 = sext i32 %.01 to i64
  %42 = getelementptr inbounds i8, ptr %0, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = add nsw i32 %.0, 1
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 %45
  store i8 %43, ptr %46, align 1
  br label %47

47:                                               ; preds = %40, %27
  %.1 = phi i32 [ %44, %40 ], [ %.0, %27 ]
  br label %48

48:                                               ; preds = %47
  %49 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

50:                                               ; preds = %12
  %51 = sext i32 %.0 to i64
  %52 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 %51
  store i8 0, ptr %52, align 1
  %53 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %54 = call ptr @strncpy(ptr noundef %1, ptr noundef %53, i64 noundef 127) #7
  %55 = getelementptr inbounds i8, ptr %1, i64 127
  store i8 0, ptr %55, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @creature_shape_shift(i32 noundef %0) #0 {
  %2 = alloca [5 x ptr], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.creature_shape_shift.shapes, i64 40, i1 false)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %0)
  br label %4

4:                                                ; preds = %13, %1
  %.0 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %5 = icmp slt i32 %.0, %0
  br i1 %5, label %6, label %15

6:                                                ; preds = %4
  %7 = call i32 @rand() #7
  %8 = srem i32 %7, 5
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x ptr], ptr %2, i64 0, i64 %9
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %11)
  br label %13

13:                                               ; preds = %6
  %14 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !8

15:                                               ; preds = %4
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca [128 x i8], align 16
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef 255)
  %5 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 256, ptr noundef %6)
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %22

9:                                                ; preds = %0
  %10 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %11 = call i64 @strcspn(ptr noundef %10, ptr noundef @.str.9) #8
  %12 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %11
  store i8 0, ptr %12, align 1
  %13 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %14 = getelementptr inbounds [128 x i8], ptr %2, i64 0, i64 0
  call void @sanitize_input(ptr noundef %13, ptr noundef %14)
  %15 = getelementptr inbounds [128 x i8], ptr %2, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %15)
  %17 = getelementptr inbounds [128 x i8], ptr %2, i64 0, i64 0
  %18 = call i64 @strlen(ptr noundef %17) #8
  %19 = urem i64 %18, 5
  %20 = add i64 %19, 1
  %21 = trunc i64 %20 to i32
  call void @creature_shape_shift(i32 noundef %21)
  br label %22

22:                                               ; preds = %9, %0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }

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
