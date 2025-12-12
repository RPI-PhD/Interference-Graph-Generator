; ModuleID = 'DATASETv2/gemini_pro-39134.c'
source_filename = "DATASETv2/gemini_pro-39134.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pixel = type { i8, i8, i8 }

@pixels = dso_local global [800 x [600 x %struct.pixel]] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"P6\0A%d %d\0A255\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"pixel_art.ppm\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_line(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i24 %4) #0 {
  %6 = alloca %struct.pixel, align 1
  %7 = alloca i24, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i24 %4, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 4 %7, i64 3, i1 false)
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store i32 %2, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sub nsw i32 %18, %19
  %21 = call i32 @llvm.abs.i32(i32 %20, i1 true)
  store i32 %21, ptr %12, align 4
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %10, align 4
  %24 = icmp slt i32 %22, %23
  %25 = zext i1 %24 to i64
  %26 = select i1 %24, i32 1, i32 -1
  store i32 %26, ptr %13, align 4
  %27 = load i32, ptr %11, align 4
  %28 = load i32, ptr %9, align 4
  %29 = sub nsw i32 %27, %28
  %30 = call i32 @llvm.abs.i32(i32 %29, i1 true)
  store i32 %30, ptr %14, align 4
  %31 = load i32, ptr %9, align 4
  %32 = load i32, ptr %11, align 4
  %33 = icmp slt i32 %31, %32
  %34 = zext i1 %33 to i64
  %35 = select i1 %33, i32 1, i32 -1
  store i32 %35, ptr %15, align 4
  %36 = load i32, ptr %12, align 4
  %37 = load i32, ptr %14, align 4
  %38 = icmp sgt i32 %36, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %5
  %40 = load i32, ptr %12, align 4
  br label %44

41:                                               ; preds = %5
  %42 = load i32, ptr %14, align 4
  %43 = sub nsw i32 0, %42
  br label %44

44:                                               ; preds = %41, %39
  %45 = phi i32 [ %40, %39 ], [ %43, %41 ]
  %46 = sdiv i32 %45, 2
  store i32 %46, ptr %16, align 4
  br label %47

47:                                               ; preds = %44, %86
  %48 = load i32, ptr %8, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %49
  %51 = load i32, ptr %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [600 x %struct.pixel], ptr %50, i64 0, i64 %52
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 1 %6, i64 3, i1 false)
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %10, align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %62

57:                                               ; preds = %47
  %58 = load i32, ptr %9, align 4
  %59 = load i32, ptr %11, align 4
  %60 = icmp eq i32 %58, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %57
  br label %87

62:                                               ; preds = %57, %47
  %63 = load i32, ptr %16, align 4
  store i32 %63, ptr %17, align 4
  %64 = load i32, ptr %17, align 4
  %65 = load i32, ptr %12, align 4
  %66 = sub nsw i32 0, %65
  %67 = icmp sgt i32 %64, %66
  br i1 %67, label %68, label %75

68:                                               ; preds = %62
  %69 = load i32, ptr %14, align 4
  %70 = load i32, ptr %16, align 4
  %71 = sub nsw i32 %70, %69
  store i32 %71, ptr %16, align 4
  %72 = load i32, ptr %13, align 4
  %73 = load i32, ptr %8, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %8, align 4
  br label %75

75:                                               ; preds = %68, %62
  %76 = load i32, ptr %17, align 4
  %77 = load i32, ptr %14, align 4
  %78 = icmp slt i32 %76, %77
  br i1 %78, label %79, label %86

79:                                               ; preds = %75
  %80 = load i32, ptr %12, align 4
  %81 = load i32, ptr %16, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %16, align 4
  %83 = load i32, ptr %15, align 4
  %84 = load i32, ptr %9, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %9, align 4
  br label %86

86:                                               ; preds = %79, %75
  br label %47

87:                                               ; preds = %61
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_circle(i32 noundef %0, i32 noundef %1, i32 noundef %2, i24 %3) #0 {
  %5 = alloca %struct.pixel, align 1
  %6 = alloca i24, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i24 %3, ptr %6, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %5, ptr align 4 %6, i64 3, i1 false)
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %10, align 4
  %14 = load i32, ptr %8, align 4
  store i32 %14, ptr %11, align 4
  %15 = load i32, ptr %9, align 4
  %16 = mul nsw i32 2, %15
  %17 = sub nsw i32 3, %16
  store i32 %17, ptr %12, align 4
  br label %18

18:                                               ; preds = %106, %4
  %19 = load i32, ptr %10, align 4
  %20 = load i32, ptr %11, align 4
  %21 = icmp sle i32 %19, %20
  br i1 %21, label %22, label %107

22:                                               ; preds = %18
  %23 = load i32, ptr %10, align 4
  %24 = load i32, ptr %9, align 4
  %25 = add nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %26
  %28 = load i32, ptr %11, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [600 x %struct.pixel], ptr %27, i64 0, i64 %29
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 1 %5, i64 3, i1 false)
  %31 = load i32, ptr %10, align 4
  %32 = load i32, ptr %9, align 4
  %33 = sub nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %34
  %36 = load i32, ptr %11, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [600 x %struct.pixel], ptr %35, i64 0, i64 %37
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %38, ptr align 1 %5, i64 3, i1 false)
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %40
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr %9, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [600 x %struct.pixel], ptr %41, i64 0, i64 %45
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %46, ptr align 1 %5, i64 3, i1 false)
  %47 = load i32, ptr %10, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %48
  %50 = load i32, ptr %11, align 4
  %51 = load i32, ptr %9, align 4
  %52 = sub nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [600 x %struct.pixel], ptr %49, i64 0, i64 %53
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %54, ptr align 1 %5, i64 3, i1 false)
  %55 = load i32, ptr %11, align 4
  %56 = load i32, ptr %9, align 4
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %58
  %60 = load i32, ptr %10, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [600 x %struct.pixel], ptr %59, i64 0, i64 %61
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %62, ptr align 1 %5, i64 3, i1 false)
  %63 = load i32, ptr %11, align 4
  %64 = load i32, ptr %9, align 4
  %65 = sub nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %66
  %68 = load i32, ptr %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [600 x %struct.pixel], ptr %67, i64 0, i64 %69
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %70, ptr align 1 %5, i64 3, i1 false)
  %71 = load i32, ptr %11, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %72
  %74 = load i32, ptr %10, align 4
  %75 = load i32, ptr %9, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [600 x %struct.pixel], ptr %73, i64 0, i64 %77
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %78, ptr align 1 %5, i64 3, i1 false)
  %79 = load i32, ptr %11, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %80
  %82 = load i32, ptr %10, align 4
  %83 = load i32, ptr %9, align 4
  %84 = sub nsw i32 %82, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [600 x %struct.pixel], ptr %81, i64 0, i64 %85
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %86, ptr align 1 %5, i64 3, i1 false)
  %87 = load i32, ptr %12, align 4
  %88 = icmp slt i32 %87, 0
  br i1 %88, label %89, label %96

89:                                               ; preds = %22
  %90 = load i32, ptr %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %10, align 4
  %92 = mul nsw i32 4, %90
  %93 = add nsw i32 %92, 6
  %94 = load i32, ptr %12, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %12, align 4
  br label %106

96:                                               ; preds = %22
  %97 = load i32, ptr %10, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %10, align 4
  %99 = load i32, ptr %11, align 4
  %100 = add nsw i32 %99, -1
  store i32 %100, ptr %11, align 4
  %101 = sub nsw i32 %97, %99
  %102 = mul nsw i32 4, %101
  %103 = add nsw i32 %102, 10
  %104 = load i32, ptr %12, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %12, align 4
  br label %106

106:                                              ; preds = %96, %89
  br label %18, !llvm.loop !6

107:                                              ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_rectangle(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i24 %4) #0 {
  %6 = alloca %struct.pixel, align 1
  %7 = alloca i24, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i24 %4, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 4 %7, i64 3, i1 false)
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store i32 %2, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %14

14:                                               ; preds = %38, %5
  %15 = load i32, ptr %12, align 4
  %16 = load i32, ptr %10, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %41

18:                                               ; preds = %14
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %12, align 4
  %21 = add nsw i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %22
  %24 = load i32, ptr %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [600 x %struct.pixel], ptr %23, i64 0, i64 %25
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %26, ptr align 1 %6, i64 3, i1 false)
  %27 = load i32, ptr %8, align 4
  %28 = load i32, ptr %12, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %30
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %11, align 4
  %34 = add nsw i32 %32, %33
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [600 x %struct.pixel], ptr %31, i64 0, i64 %36
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %37, ptr align 1 %6, i64 3, i1 false)
  br label %38

38:                                               ; preds = %18
  %39 = load i32, ptr %12, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %12, align 4
  br label %14, !llvm.loop !8

41:                                               ; preds = %14
  store i32 0, ptr %13, align 4
  br label %42

42:                                               ; preds = %66, %41
  %43 = load i32, ptr %13, align 4
  %44 = load i32, ptr %11, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %69

46:                                               ; preds = %42
  %47 = load i32, ptr %8, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %48
  %50 = load i32, ptr %9, align 4
  %51 = load i32, ptr %13, align 4
  %52 = add nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [600 x %struct.pixel], ptr %49, i64 0, i64 %53
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %54, ptr align 1 %6, i64 3, i1 false)
  %55 = load i32, ptr %8, align 4
  %56 = load i32, ptr %10, align 4
  %57 = add nsw i32 %55, %56
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [800 x [600 x %struct.pixel]], ptr @pixels, i64 0, i64 %59
  %61 = load i32, ptr %9, align 4
  %62 = load i32, ptr %13, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [600 x %struct.pixel], ptr %60, i64 0, i64 %64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %65, ptr align 1 %6, i64 3, i1 false)
  br label %66

66:                                               ; preds = %46
  %67 = load i32, ptr %13, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %13, align 4
  br label %42, !llvm.loop !9

69:                                               ; preds = %42
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @save_ppm(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noalias ptr @fopen(ptr noundef %4, ptr noundef @.str)
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.1, i32 noundef 800, i32 noundef 600)
  %8 = load ptr, ptr %3, align 8
  %9 = call i64 @fwrite(ptr noundef @pixels, i64 noundef 3, i64 noundef 480000, ptr noundef %8)
  %10 = load ptr, ptr %3, align 8
  %11 = call i32 @fclose(ptr noundef %10)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.pixel, align 1
  %3 = alloca i24, align 4
  %4 = alloca %struct.pixel, align 1
  %5 = alloca i24, align 4
  %6 = alloca %struct.pixel, align 1
  %7 = alloca i24, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 16 @pixels, i8 0, i64 1440000, i1 false)
  %8 = getelementptr inbounds %struct.pixel, ptr %2, i32 0, i32 0
  store i8 -1, ptr %8, align 1
  %9 = getelementptr inbounds %struct.pixel, ptr %2, i32 0, i32 1
  store i8 0, ptr %9, align 1
  %10 = getelementptr inbounds %struct.pixel, ptr %2, i32 0, i32 2
  store i8 0, ptr %10, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 1 %2, i64 3, i1 false)
  %11 = load i24, ptr %3, align 4
  call void @draw_line(i32 noundef 0, i32 noundef 0, i32 noundef 799, i32 noundef 599, i24 %11)
  %12 = getelementptr inbounds %struct.pixel, ptr %4, i32 0, i32 0
  store i8 0, ptr %12, align 1
  %13 = getelementptr inbounds %struct.pixel, ptr %4, i32 0, i32 1
  store i8 -1, ptr %13, align 1
  %14 = getelementptr inbounds %struct.pixel, ptr %4, i32 0, i32 2
  store i8 0, ptr %14, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 1 %4, i64 3, i1 false)
  %15 = load i24, ptr %5, align 4
  call void @draw_circle(i32 noundef 400, i32 noundef 300, i32 noundef 100, i24 %15)
  %16 = getelementptr inbounds %struct.pixel, ptr %6, i32 0, i32 0
  store i8 0, ptr %16, align 1
  %17 = getelementptr inbounds %struct.pixel, ptr %6, i32 0, i32 1
  store i8 0, ptr %17, align 1
  %18 = getelementptr inbounds %struct.pixel, ptr %6, i32 0, i32 2
  store i8 -1, ptr %18, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %7, ptr align 1 %6, i64 3, i1 false)
  %19 = load i24, ptr %7, align 4
  call void @draw_rectangle(i32 noundef 100, i32 noundef 100, i32 noundef 200, i32 noundef 100, i24 %19)
  call void @save_ppm(ptr noundef @.str.2)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
