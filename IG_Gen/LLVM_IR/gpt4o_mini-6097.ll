; ModuleID = 'DATASETv2/gpt4o_mini-6097.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @sanitize_input(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [256 x i8], align 16
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %62, %2
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr %9, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %8
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 127
  br label %19

19:                                               ; preds = %16, %8
  %20 = phi i1 [ false, %8 ], [ %18, %16 ]
  br i1 %20, label %21, label %65

21:                                               ; preds = %19
  %22 = call ptr @__ctype_b_loc() #6
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, ptr %23, i64 %30
  %32 = load i16, ptr %31, align 2
  %33 = zext i16 %32 to i32
  %34 = and i32 %33, 8
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %51, label %36

36:                                               ; preds = %21
  %37 = call ptr @__ctype_b_loc() #6
  %38 = load ptr, ptr %37, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %39, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, ptr %38, i64 %45
  %47 = load i16, ptr %46, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 8192
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %61

51:                                               ; preds = %36, %21
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %5, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %52, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %6, align 4
  %59 = sext i32 %57 to i64
  %60 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %59
  store i8 %56, ptr %60, align 1
  br label %61

61:                                               ; preds = %51, %36
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %5, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %5, align 4
  br label %8, !llvm.loop !6

65:                                               ; preds = %19
  %66 = load i32, ptr %6, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %67
  store i8 0, ptr %68, align 1
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %71 = call ptr @strncpy(ptr noundef %69, ptr noundef %70, i64 noundef 127) #7
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds i8, ptr %72, i64 127
  store i8 0, ptr %73, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @creature_shape_shift(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x ptr], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.creature_shape_shift.shapes, i64 40, i1 false)
  store i32 5, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %7)
  store i32 0, ptr %5, align 4
  br label %9

9:                                                ; preds = %22, %1
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %25

13:                                               ; preds = %9
  %14 = call i32 @rand() #7
  %15 = load i32, ptr %4, align 4
  %16 = srem i32 %14, %15
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [5 x ptr], ptr %3, i64 0, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %20)
  br label %22

22:                                               ; preds = %13
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %5, align 4
  br label %9, !llvm.loop !8

25:                                               ; preds = %9
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [256 x i8], align 16
  %3 = alloca [128 x i8], align 16
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef 255)
  %7 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %8 = load ptr, ptr @stdin, align 8
  %9 = call ptr @fgets(ptr noundef %7, i32 noundef 256, ptr noundef %8)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %25

11:                                               ; preds = %0
  %12 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %13 = call i64 @strcspn(ptr noundef %12, ptr noundef @.str.9) #8
  %14 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %13
  store i8 0, ptr %14, align 1
  %15 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %16 = getelementptr inbounds [128 x i8], ptr %3, i64 0, i64 0
  call void @sanitize_input(ptr noundef %15, ptr noundef %16)
  %17 = getelementptr inbounds [128 x i8], ptr %3, i64 0, i64 0
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %17)
  %19 = getelementptr inbounds [128 x i8], ptr %3, i64 0, i64 0
  %20 = call i64 @strlen(ptr noundef %19) #8
  %21 = urem i64 %20, 5
  %22 = add i64 %21, 1
  %23 = trunc i64 %22 to i32
  store i32 %23, ptr %4, align 4
  %24 = load i32, ptr %4, align 4
  call void @creature_shape_shift(i32 noundef %24)
  br label %25

25:                                               ; preds = %11, %0
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
