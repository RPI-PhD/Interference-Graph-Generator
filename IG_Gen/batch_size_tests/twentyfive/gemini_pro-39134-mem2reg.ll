; ModuleID = 'LLVM_IR/gemini_pro-39134.ll'
source_filename = "DATASETv2/gemini_pro-39134.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pixel = type { i8, i8, i8 }

@pixels = dso_local global [800 x [600 x %struct.pixel]] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"P6\0A%d %d\0A255\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"pixel_art.ppm\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_line(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i24 %4) #0 {
  %6 = alloca %struct.pixel, align 1
  %7 = alloca i24, align 4
  store i24 %4, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 4 %7, i64 3, i1 false)
  %8 = sub nsw i32 %2, %0
  %9 = call i32 @llvm.abs.i32(i32 %8, i1 true)
  %10 = icmp slt i32 %0, %2
  %11 = zext i1 %10 to i64
  %12 = select i1 %10, i32 1, i32 -1
  %13 = sub nsw i32 %3, %1
  %14 = call i32 @llvm.abs.i32(i32 %13, i1 true)
  %15 = icmp slt i32 %1, %3
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, i32 1, i32 -1
  %18 = icmp sgt i32 %9, %14
  br i1 %18, label %19, label %20

19:                                               ; preds = %5
  br label %22

20:                                               ; preds = %5
  %21 = sub nsw i32 0, %14
  br label %22

22:                                               ; preds = %20, %19
  %23 = phi i32 [ %9, %19 ], [ %21, %20 ]
  %24 = sdiv i32 %23, 2
  br label %25

25:                                               ; preds = %45, %22
  %.03 = phi i32 [ %24, %22 ], [ %.2, %45 ]
  %.01 = phi i32 [ %1, %22 ], [ %.12, %45 ]
  %.0 = phi i32 [ %0, %22 ], [ %.1, %45 ]
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %26
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds [600 x %struct.pixel], ptr %27, i64 0, i64 %28
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %29, ptr align 1 %6, i64 3, i1 false)
  %30 = icmp eq i32 %.0, %2
  br i1 %30, label %31, label %34

31:                                               ; preds = %25
  %32 = icmp eq i32 %.01, %3
  br i1 %32, label %33, label %34

33:                                               ; preds = %31
  br label %46

34:                                               ; preds = %31, %25
  %35 = sub nsw i32 0, %9
  %36 = icmp sgt i32 %.03, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %34
  %38 = sub nsw i32 %.03, %14
  %39 = add nsw i32 %.0, %12
  br label %40

40:                                               ; preds = %37, %34
  %.14 = phi i32 [ %38, %37 ], [ %.03, %34 ]
  %.1 = phi i32 [ %39, %37 ], [ %.0, %34 ]
  %41 = icmp slt i32 %.03, %14
  br i1 %41, label %42, label %45

42:                                               ; preds = %40
  %43 = add nsw i32 %.14, %9
  %44 = add nsw i32 %.01, %17
  br label %45

45:                                               ; preds = %42, %40
  %.2 = phi i32 [ %43, %42 ], [ %.14, %40 ]
  %.12 = phi i32 [ %44, %42 ], [ %.01, %40 ]
  br label %25

46:                                               ; preds = %33
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_circle(i32 noundef %0, i32 noundef %1, i32 noundef %2, i24 %3) #0 {
  %5 = alloca %struct.pixel, align 1
  %6 = alloca i24, align 4
  store i24 %3, ptr %6, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %5, ptr align 4 %6, i64 3, i1 false)
  %7 = mul nsw i32 2, %2
  %8 = sub nsw i32 3, %7
  br label %9

9:                                                ; preds = %65, %4
  %.03 = phi i32 [ %0, %4 ], [ %.14, %65 ]
  %.01 = phi i32 [ %1, %4 ], [ %.12, %65 ]
  %.0 = phi i32 [ %8, %4 ], [ %.1, %65 ]
  %10 = icmp sle i32 %.03, %.01
  br i1 %10, label %11, label %66

11:                                               ; preds = %9
  %12 = add nsw i32 %.03, %2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %13
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds [600 x %struct.pixel], ptr %14, i64 0, i64 %15
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %16, ptr align 1 %5, i64 3, i1 false)
  %17 = sub nsw i32 %.03, %2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %18
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds [600 x %struct.pixel], ptr %19, i64 0, i64 %20
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %21, ptr align 1 %5, i64 3, i1 false)
  %22 = sext i32 %.03 to i64
  %23 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %22
  %24 = add nsw i32 %.01, %2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [600 x %struct.pixel], ptr %23, i64 0, i64 %25
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %26, ptr align 1 %5, i64 3, i1 false)
  %27 = sext i32 %.03 to i64
  %28 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %27
  %29 = sub nsw i32 %.01, %2
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [600 x %struct.pixel], ptr %28, i64 0, i64 %30
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %31, ptr align 1 %5, i64 3, i1 false)
  %32 = add nsw i32 %.01, %2
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %33
  %35 = sext i32 %.03 to i64
  %36 = getelementptr inbounds [600 x %struct.pixel], ptr %34, i64 0, i64 %35
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %36, ptr align 1 %5, i64 3, i1 false)
  %37 = sub nsw i32 %.01, %2
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %38
  %40 = sext i32 %.03 to i64
  %41 = getelementptr inbounds [600 x %struct.pixel], ptr %39, i64 0, i64 %40
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %41, ptr align 1 %5, i64 3, i1 false)
  %42 = sext i32 %.01 to i64
  %43 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %42
  %44 = add nsw i32 %.03, %2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [600 x %struct.pixel], ptr %43, i64 0, i64 %45
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %46, ptr align 1 %5, i64 3, i1 false)
  %47 = sext i32 %.01 to i64
  %48 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %47
  %49 = sub nsw i32 %.03, %2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [600 x %struct.pixel], ptr %48, i64 0, i64 %50
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %51, ptr align 1 %5, i64 3, i1 false)
  %52 = icmp slt i32 %.0, 0
  br i1 %52, label %53, label %58

53:                                               ; preds = %11
  %54 = add nsw i32 %.03, 1
  %55 = mul nsw i32 4, %.03
  %56 = add nsw i32 %55, 6
  %57 = add nsw i32 %.0, %56
  br label %65

58:                                               ; preds = %11
  %59 = add nsw i32 %.03, 1
  %60 = add nsw i32 %.01, -1
  %61 = sub nsw i32 %.03, %.01
  %62 = mul nsw i32 4, %61
  %63 = add nsw i32 %62, 10
  %64 = add nsw i32 %.0, %63
  br label %65

65:                                               ; preds = %58, %53
  %.14 = phi i32 [ %54, %53 ], [ %59, %58 ]
  %.12 = phi i32 [ %.01, %53 ], [ %60, %58 ]
  %.1 = phi i32 [ %57, %53 ], [ %64, %58 ]
  br label %9, !llvm.loop !6

66:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_rectangle(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i24 %4) #0 {
  %6 = alloca %struct.pixel, align 1
  %7 = alloca i24, align 4
  store i24 %4, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 4 %7, i64 3, i1 false)
  br label %8

8:                                                ; preds = %23, %5
  %.01 = phi i32 [ 0, %5 ], [ %24, %23 ]
  %9 = icmp slt i32 %.01, %2
  br i1 %9, label %10, label %25

10:                                               ; preds = %8
  %11 = add nsw i32 %0, %.01
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %12
  %14 = sext i32 %1 to i64
  %15 = getelementptr inbounds [600 x %struct.pixel], ptr %13, i64 0, i64 %14
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %15, ptr align 1 %6, i64 3, i1 false)
  %16 = add nsw i32 %0, %.01
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %17
  %19 = add nsw i32 %1, %3
  %20 = sub nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [600 x %struct.pixel], ptr %18, i64 0, i64 %21
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %22, ptr align 1 %6, i64 3, i1 false)
  br label %23

23:                                               ; preds = %10
  %24 = add nsw i32 %.01, 1
  br label %8, !llvm.loop !8

25:                                               ; preds = %8
  br label %26

26:                                               ; preds = %41, %25
  %.0 = phi i32 [ 0, %25 ], [ %42, %41 ]
  %27 = icmp slt i32 %.0, %3
  br i1 %27, label %28, label %43

28:                                               ; preds = %26
  %29 = sext i32 %0 to i64
  %30 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %29
  %31 = add nsw i32 %1, %.0
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [600 x %struct.pixel], ptr %30, i64 0, i64 %32
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %33, ptr align 1 %6, i64 3, i1 false)
  %34 = add nsw i32 %0, %2
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %36
  %38 = add nsw i32 %1, %.0
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [600 x %struct.pixel], ptr %37, i64 0, i64 %39
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %40, ptr align 1 %6, i64 3, i1 false)
  br label %41

41:                                               ; preds = %28
  %42 = add nsw i32 %.0, 1
  br label %26, !llvm.loop !9

43:                                               ; preds = %26
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @save_ppm(ptr noundef %0) #0 {
  %2 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.1, i32 noundef 800, i32 noundef 600)
  %4 = call i64 @fwrite(ptr noundef @pixels, i64 noundef 3, i64 noundef 480000, ptr noundef %2)
  %5 = call i32 @fclose(ptr noundef %2)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.pixel, align 1
  %2 = alloca i24, align 4
  %3 = alloca %struct.pixel, align 1
  %4 = alloca i24, align 4
  %5 = alloca %struct.pixel, align 1
  %6 = alloca i24, align 4
  call void @llvm.memset.p0.i64(ptr align 16 @pixels, i8 0, i64 1440000, i1 false)
  %7 = getelementptr inbounds %struct.pixel, ptr %1, i32 0, i32 0
  store i8 -1, ptr %7, align 1
  %8 = getelementptr inbounds %struct.pixel, ptr %1, i32 0, i32 1
  store i8 0, ptr %8, align 1
  %9 = getelementptr inbounds %struct.pixel, ptr %1, i32 0, i32 2
  store i8 0, ptr %9, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 1 %1, i64 3, i1 false)
  %10 = load i24, ptr %2, align 4
  call void @draw_line(i32 noundef 0, i32 noundef 0, i32 noundef 799, i32 noundef 599, i24 %10)
  %11 = getelementptr inbounds %struct.pixel, ptr %3, i32 0, i32 0
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds %struct.pixel, ptr %3, i32 0, i32 1
  store i8 -1, ptr %12, align 1
  %13 = getelementptr inbounds %struct.pixel, ptr %3, i32 0, i32 2
  store i8 0, ptr %13, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 1 %3, i64 3, i1 false)
  %14 = load i24, ptr %4, align 4
  call void @draw_circle(i32 noundef 400, i32 noundef 300, i32 noundef 100, i24 %14)
  %15 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 0
  store i8 0, ptr %15, align 1
  %16 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 1
  store i8 0, ptr %16, align 1
  %17 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 2
  store i8 -1, ptr %17, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %6, ptr align 1 %5, i64 3, i1 false)
  %18 = load i24, ptr %6, align 4
  call void @draw_rectangle(i32 noundef 100, i32 noundef 100, i32 noundef 200, i32 noundef 100, i24 %18)
  call void @save_ppm(ptr noundef @.str.2)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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
