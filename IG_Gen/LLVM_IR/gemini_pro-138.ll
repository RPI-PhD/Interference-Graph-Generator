; ModuleID = 'DATASETv2/gemini_pro-138.c'
source_filename = "DATASETv2/gemini_pro-138.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i8, i32, ptr, ptr }

@.str = private unnamed_addr constant [8 x i8] c"%c: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"this is an example of huffman coding\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Original string: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Encoded string: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"Decoded string: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_node(i8 noundef signext %0, i32 noundef %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i8 %0, ptr %3, align 1
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 24) #6
  store ptr %6, ptr %5, align 8
  %7 = load i8, ptr %3, align 1
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 0
  store i8 %7, ptr %9, align 8
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2
  store ptr null, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 3
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  ret ptr %17
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insert_node(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  br label %30

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %14, %18
  br i1 %19, label %20, label %25

20:                                               ; preds = %11
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %4, align 8
  call void @insert_node(ptr noundef %23, ptr noundef %24)
  br label %30

25:                                               ; preds = %11
  %26 = load ptr, ptr %3, align 8
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 3
  %29 = load ptr, ptr %4, align 8
  call void @insert_node(ptr noundef %28, ptr noundef %29)
  br label %30

30:                                               ; preds = %8, %25, %20
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @build_tree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [256 x i32], align 16
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 1024, i1 false)
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %24, %1
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = load ptr, ptr %2, align 8
  %12 = call i64 @strlen(ptr noundef %11) #7
  %13 = icmp ult i64 %10, %12
  br i1 %13, label %14, label %27

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr %15, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i64
  %21 = getelementptr inbounds [256 x i32], ptr %3, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %21, align 4
  br label %24

24:                                               ; preds = %14
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  br label %8, !llvm.loop !6

27:                                               ; preds = %8
  store ptr null, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %28

28:                                               ; preds = %47, %27
  %29 = load i32, ptr %6, align 4
  %30 = icmp slt i32 %29, 256
  br i1 %30, label %31, label %50

31:                                               ; preds = %28
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [256 x i32], ptr %3, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %46

37:                                               ; preds = %31
  %38 = load i32, ptr %6, align 4
  %39 = trunc i32 %38 to i8
  %40 = load i32, ptr %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [256 x i32], ptr %3, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = call ptr @create_node(i8 noundef signext %39, i32 noundef %43)
  store ptr %44, ptr %7, align 8
  %45 = load ptr, ptr %7, align 8
  call void @insert_node(ptr noundef %5, ptr noundef %45)
  br label %46

46:                                               ; preds = %37, %31
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %6, align 4
  br label %28, !llvm.loop !8

50:                                               ; preds = %28
  %51 = load ptr, ptr %5, align 8
  ret ptr %51
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_code(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %32

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 0
  %11 = load i8, ptr %10, align 8
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %21

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0
  %17 = load i8, ptr %16, align 8
  %18 = sext i8 %17 to i32
  %19 = load ptr, ptr %4, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18, ptr noundef %19)
  br label %21

21:                                               ; preds = %14, %8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = call ptr @strcat(ptr noundef %25, ptr noundef @.str.1) #8
  call void @print_code(ptr noundef %24, ptr noundef %26)
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 3
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = call ptr @strcat(ptr noundef %30, ptr noundef @.str.2) #8
  call void @print_code(ptr noundef %29, ptr noundef %31)
  br label %32

32:                                               ; preds = %21, %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @encode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %59, %2
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = load ptr, ptr %4, align 8
  %16 = call i64 @strlen(ptr noundef %15) #7
  %17 = icmp ult i64 %14, %16
  br i1 %17, label %18, label %62

18:                                               ; preds = %12
  %19 = load ptr, ptr %3, align 8
  store ptr %19, ptr %7, align 8
  br label %20

20:                                               ; preds = %52, %18
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0
  %23 = load i8, ptr %22, align 8
  %24 = sext i8 %23 to i32
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %25, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %24, %30
  br i1 %31, label %32, label %53

32:                                               ; preds = %20
  %33 = load ptr, ptr %4, align 8
  %34 = load i32, ptr %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr %33, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 0
  %41 = load i8, ptr %40, align 8
  %42 = sext i8 %41 to i32
  %43 = icmp slt i32 %38, %42
  br i1 %43, label %44, label %48

44:                                               ; preds = %32
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 2
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %7, align 8
  br label %52

48:                                               ; preds = %32
  %49 = load ptr, ptr %7, align 8
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 3
  %51 = load ptr, ptr %50, align 8
  store ptr %51, ptr %7, align 8
  br label %52

52:                                               ; preds = %48, %44
  br label %20, !llvm.loop !9

53:                                               ; preds = %20
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 1
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %5, align 4
  br label %59

59:                                               ; preds = %53
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %6, align 4
  br label %12, !llvm.loop !10

62:                                               ; preds = %12
  %63 = load i32, ptr %5, align 4
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = call noalias ptr @malloc(i64 noundef %65) #6
  store ptr %66, ptr %8, align 8
  %67 = load ptr, ptr %8, align 8
  %68 = load i32, ptr %5, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, ptr %67, i64 %69
  store i8 0, ptr %70, align 1
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %71

71:                                               ; preds = %123, %62
  %72 = load i32, ptr %10, align 4
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %4, align 8
  %75 = call i64 @strlen(ptr noundef %74) #7
  %76 = icmp ult i64 %73, %75
  br i1 %76, label %77, label %126

77:                                               ; preds = %71
  %78 = load ptr, ptr %3, align 8
  store ptr %78, ptr %11, align 8
  br label %79

79:                                               ; preds = %121, %77
  %80 = load ptr, ptr %11, align 8
  %81 = getelementptr inbounds %struct.node, ptr %80, i32 0, i32 0
  %82 = load i8, ptr %81, align 8
  %83 = sext i8 %82 to i32
  %84 = load ptr, ptr %4, align 8
  %85 = load i32, ptr %10, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %84, i64 %86
  %88 = load i8, ptr %87, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp ne i32 %83, %89
  br i1 %90, label %91, label %122

91:                                               ; preds = %79
  %92 = load ptr, ptr %4, align 8
  %93 = load i32, ptr %10, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, ptr %92, i64 %94
  %96 = load i8, ptr %95, align 1
  %97 = sext i8 %96 to i32
  %98 = load ptr, ptr %11, align 8
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 0
  %100 = load i8, ptr %99, align 8
  %101 = sext i8 %100 to i32
  %102 = icmp slt i32 %97, %101
  br i1 %102, label %103, label %112

103:                                              ; preds = %91
  %104 = load ptr, ptr %11, align 8
  %105 = getelementptr inbounds %struct.node, ptr %104, i32 0, i32 2
  %106 = load ptr, ptr %105, align 8
  store ptr %106, ptr %11, align 8
  %107 = load ptr, ptr %8, align 8
  %108 = load i32, ptr %9, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %9, align 4
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds i8, ptr %107, i64 %110
  store i8 48, ptr %111, align 1
  br label %121

112:                                              ; preds = %91
  %113 = load ptr, ptr %11, align 8
  %114 = getelementptr inbounds %struct.node, ptr %113, i32 0, i32 3
  %115 = load ptr, ptr %114, align 8
  store ptr %115, ptr %11, align 8
  %116 = load ptr, ptr %8, align 8
  %117 = load i32, ptr %9, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %9, align 4
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds i8, ptr %116, i64 %119
  store i8 49, ptr %120, align 1
  br label %121

121:                                              ; preds = %112, %103
  br label %79, !llvm.loop !11

122:                                              ; preds = %79
  br label %123

123:                                              ; preds = %122
  %124 = load i32, ptr %10, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %10, align 4
  br label %71, !llvm.loop !12

126:                                              ; preds = %71
  %127 = load ptr, ptr %8, align 8
  ret ptr %127
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @decode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = call i64 @strlen(ptr noundef %10) #7
  %12 = trunc i64 %11 to i32
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = call noalias ptr @malloc(i64 noundef %15) #6
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  store i8 0, ptr %20, align 1
  store i32 0, ptr %7, align 4
  %21 = load ptr, ptr %3, align 8
  store ptr %21, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %22

22:                                               ; preds = %59, %2
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %62

26:                                               ; preds = %22
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 48
  br i1 %33, label %34, label %38

34:                                               ; preds = %26
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 2
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %8, align 8
  br label %42

38:                                               ; preds = %26
  %39 = load ptr, ptr %8, align 8
  %40 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 3
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %8, align 8
  br label %42

42:                                               ; preds = %38, %34
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 0
  %45 = load i8, ptr %44, align 8
  %46 = sext i8 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %58

48:                                               ; preds = %42
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 0
  %51 = load i8, ptr %50, align 8
  %52 = load ptr, ptr %6, align 8
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %7, align 4
  %55 = sext i32 %53 to i64
  %56 = getelementptr inbounds i8, ptr %52, i64 %55
  store i8 %51, ptr %56, align 1
  %57 = load ptr, ptr %3, align 8
  store ptr %57, ptr %8, align 8
  br label %58

58:                                               ; preds = %48, %42
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %9, align 4
  br label %22, !llvm.loop !13

62:                                               ; preds = %22
  %63 = load ptr, ptr %6, align 8
  ret ptr %63
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr @.str.3, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call ptr @build_tree(ptr noundef %7)
  store ptr %8, ptr %3, align 8
  store ptr @.str.4, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %4, align 8
  call void @print_code(ptr noundef %9, ptr noundef %10)
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = call ptr @encode(ptr noundef %11, ptr noundef %12)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = call ptr @decode(ptr noundef %14, ptr noundef %15)
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %17)
  %19 = load ptr, ptr %5, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %19)
  %21 = load ptr, ptr %6, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %21)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
