; ModuleID = 'code_data/parser.c'
source_filename = "code_data/parser.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.token_list = type { ptr, ptr, i32 }
%struct.pipeline = type { ptr, i8 }
%struct.pipeline_command = type { [257 x ptr], ptr, ptr, ptr }

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @token_creator(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.token_list, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %8, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 8
  %17 = call ptr @realloc(ptr noundef %13, i64 noundef %16) #4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.token_list, ptr %18, i32 0, i32 0
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.token_list, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 4
  %26 = call ptr @realloc(ptr noundef %22, i64 noundef %25) #4
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.token_list, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = call noalias ptr @malloc(i64 noundef %31) #5
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.token_list, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = load i32, ptr %8, align 4
  %37 = sub nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds ptr, ptr %35, i64 %38
  store ptr %32, ptr %39, align 8
  store i32 0, ptr %9, align 4
  br label %40

40:                                               ; preds = %61, %4
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %7, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %64

44:                                               ; preds = %40
  %45 = load ptr, ptr %6, align 8
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, ptr %45, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds %struct.token_list, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %8, align 4
  %54 = sub nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds ptr, ptr %52, i64 %55
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, ptr %57, i64 %59
  store i8 %49, ptr %60, align 1
  br label %61

61:                                               ; preds = %44
  %62 = load i32, ptr %9, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %9, align 4
  br label %40, !llvm.loop !6

64:                                               ; preds = %40
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds %struct.token_list, ptr %65, i32 0, i32 0
  %67 = load ptr, ptr %66, align 8
  %68 = load i32, ptr %8, align 4
  %69 = sub nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds ptr, ptr %67, i64 %70
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %7, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, ptr %72, i64 %74
  store i8 0, ptr %75, align 1
  %76 = load ptr, ptr %6, align 8
  %77 = getelementptr inbounds i8, ptr %76, i64 1
  %78 = load i8, ptr %77, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %93

81:                                               ; preds = %64
  %82 = load ptr, ptr %6, align 8
  %83 = getelementptr inbounds i8, ptr %82, i64 0
  %84 = load i8, ptr %83, align 1
  %85 = sext i8 %84 to i32
  switch i32 %85, label %91 [
    i32 60, label %86
    i32 62, label %87
    i32 38, label %88
    i32 124, label %89
    i32 10, label %90
  ]

86:                                               ; preds = %81
  store i32 1, ptr %10, align 4
  br label %92

87:                                               ; preds = %81
  store i32 2, ptr %10, align 4
  br label %92

88:                                               ; preds = %81
  store i32 3, ptr %10, align 4
  br label %92

89:                                               ; preds = %81
  store i32 4, ptr %10, align 4
  br label %92

90:                                               ; preds = %81
  store i32 5, ptr %10, align 4
  br label %92

91:                                               ; preds = %81
  store i32 0, ptr %10, align 4
  br label %92

92:                                               ; preds = %91, %90, %89, %88, %87, %86
  br label %94

93:                                               ; preds = %64
  store i32 0, ptr %10, align 4
  br label %94

94:                                               ; preds = %93, %92
  %95 = load i32, ptr %10, align 4
  %96 = load ptr, ptr %5, align 8
  %97 = getelementptr inbounds %struct.token_list, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = load i32, ptr %8, align 4
  %100 = sub nsw i32 %99, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, ptr %98, i64 %101
  store i32 %95, ptr %102, align 4
  ret i1 true
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @lexer(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store ptr null, ptr %4, align 8
  %9 = load ptr, ptr %2, align 8
  store ptr %9, ptr %3, align 8
  store ptr null, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 1, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %10 = call noalias ptr @malloc(i64 noundef 24) #5
  store ptr %10, ptr %8, align 8
  %11 = load i32, ptr %6, align 4
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 8
  %14 = call noalias ptr @malloc(i64 noundef %13) #5
  %15 = load ptr, ptr %8, align 8
  %16 = getelementptr inbounds %struct.token_list, ptr %15, i32 0, i32 0
  store ptr %14, ptr %16, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 4
  %20 = call noalias ptr @malloc(i64 noundef %19) #5
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.token_list, ptr %21, i32 0, i32 1
  store ptr %20, ptr %22, align 8
  br label %23

23:                                               ; preds = %126, %1
  %24 = load ptr, ptr %3, align 8
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %130

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 8
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  switch i32 %31, label %74 [
    i32 62, label %32
    i32 60, label %32
    i32 38, label %32
    i32 124, label %32
    i32 10, label %32
    i32 32, label %61
    i32 9, label %61
  ]

32:                                               ; preds = %28, %28, %28, %28, %28
  %33 = load ptr, ptr %4, align 8
  %34 = icmp ne ptr %33, null
  br i1 %34, label %35, label %50

35:                                               ; preds = %32
  %36 = load ptr, ptr %4, align 8
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  switch i32 %38, label %40 [
    i32 9, label %39
    i32 32, label %39
  ]

39:                                               ; preds = %35, %35
  br label %49

40:                                               ; preds = %35
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  %43 = load ptr, ptr %8, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %7, align 4
  %46 = load i32, ptr %6, align 4
  %47 = call zeroext i1 @token_creator(ptr noundef %43, ptr noundef %44, i32 noundef %45, i32 noundef %46)
  %48 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %48) #6
  store ptr null, ptr %5, align 8
  store i32 1, ptr %7, align 4
  br label %49

49:                                               ; preds = %40, %39
  br label %50

50:                                               ; preds = %49, %32
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = call noalias ptr @malloc(i64 noundef %53) #5
  store ptr %54, ptr %5, align 8
  %55 = load ptr, ptr %3, align 8
  %56 = load i8, ptr %55, align 1
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds i8, ptr %57, i64 0
  store i8 %56, ptr %58, align 1
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds i8, ptr %59, i64 1
  store i8 0, ptr %60, align 1
  br label %126

61:                                               ; preds = %28, %28
  %62 = load ptr, ptr %5, align 8
  %63 = icmp ne ptr %62, null
  br i1 %63, label %64, label %73

64:                                               ; preds = %61
  %65 = load i32, ptr %6, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %6, align 4
  %67 = load ptr, ptr %8, align 8
  %68 = load ptr, ptr %5, align 8
  %69 = load i32, ptr %7, align 4
  %70 = load i32, ptr %6, align 4
  %71 = call zeroext i1 @token_creator(ptr noundef %67, ptr noundef %68, i32 noundef %69, i32 noundef %70)
  %72 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %72) #6
  store ptr null, ptr %5, align 8
  store i32 1, ptr %7, align 4
  br label %73

73:                                               ; preds = %64, %61
  br label %126

74:                                               ; preds = %28
  %75 = load ptr, ptr %4, align 8
  %76 = icmp ne ptr %75, null
  br i1 %76, label %77, label %92

77:                                               ; preds = %74
  %78 = load ptr, ptr %4, align 8
  %79 = load i8, ptr %78, align 1
  %80 = sext i8 %79 to i32
  switch i32 %80, label %90 [
    i32 10, label %81
    i32 124, label %81
    i32 62, label %81
    i32 60, label %81
    i32 38, label %81
  ]

81:                                               ; preds = %77, %77, %77, %77, %77
  %82 = load i32, ptr %6, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %6, align 4
  %84 = load ptr, ptr %8, align 8
  %85 = load ptr, ptr %5, align 8
  %86 = load i32, ptr %7, align 4
  %87 = load i32, ptr %6, align 4
  %88 = call zeroext i1 @token_creator(ptr noundef %84, ptr noundef %85, i32 noundef %86, i32 noundef %87)
  %89 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %89) #6
  store ptr null, ptr %5, align 8
  store i32 1, ptr %7, align 4
  br label %91

90:                                               ; preds = %77
  br label %91

91:                                               ; preds = %90, %81
  br label %92

92:                                               ; preds = %91, %74
  %93 = load ptr, ptr %5, align 8
  %94 = icmp eq ptr %93, null
  br i1 %94, label %95, label %106

95:                                               ; preds = %92
  %96 = load i32, ptr %7, align 4
  %97 = add nsw i32 %96, 1
  %98 = sext i32 %97 to i64
  %99 = call noalias ptr @malloc(i64 noundef %98) #5
  store ptr %99, ptr %5, align 8
  %100 = load ptr, ptr %3, align 8
  %101 = load i8, ptr %100, align 1
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds i8, ptr %102, i64 0
  store i8 %101, ptr %103, align 1
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds i8, ptr %104, i64 1
  store i8 0, ptr %105, align 1
  br label %123

106:                                              ; preds = %92
  %107 = load ptr, ptr %5, align 8
  %108 = load i32, ptr %7, align 4
  %109 = add nsw i32 %108, 1
  %110 = sext i32 %109 to i64
  %111 = call ptr @realloc(ptr noundef %107, i64 noundef %110) #4
  store ptr %111, ptr %5, align 8
  %112 = load ptr, ptr %3, align 8
  %113 = load i8, ptr %112, align 1
  %114 = load ptr, ptr %5, align 8
  %115 = load i32, ptr %7, align 4
  %116 = sub nsw i32 %115, 1
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, ptr %114, i64 %117
  store i8 %113, ptr %118, align 1
  %119 = load ptr, ptr %5, align 8
  %120 = load i32, ptr %7, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, ptr %119, i64 %121
  store i8 0, ptr %122, align 1
  br label %123

123:                                              ; preds = %106, %95
  %124 = load i32, ptr %7, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %7, align 4
  br label %126

126:                                              ; preds = %123, %73, %50
  %127 = load ptr, ptr %3, align 8
  store ptr %127, ptr %4, align 8
  %128 = load ptr, ptr %3, align 8
  %129 = getelementptr inbounds i8, ptr %128, i32 1
  store ptr %129, ptr %3, align 8
  br label %23, !llvm.loop !8

130:                                              ; preds = %23
  %131 = load i32, ptr %6, align 4
  %132 = load ptr, ptr %8, align 8
  %133 = getelementptr inbounds %struct.token_list, ptr %132, i32 0, i32 2
  store i32 %131, ptr %133, align 8
  %134 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %134) #6
  %135 = load ptr, ptr %8, align 8
  ret ptr %135
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @token_list_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.token_list, ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %6) #6
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %21, %1
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.token_list, ptr %9, i32 0, i32 2
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %24

13:                                               ; preds = %7
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.token_list, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  call void @free(ptr noundef %20) #6
  br label %21

21:                                               ; preds = %13
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  br label %7, !llvm.loop !9

24:                                               ; preds = %7
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.token_list, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %27) #6
  %28 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %28) #6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @pipeline_build(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = call ptr @lexer(ptr noundef %10)
  store ptr %11, ptr %4, align 8
  store ptr null, ptr %5, align 8
  store i32 0, ptr %6, align 4
  %12 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.pipeline, ptr %13, i32 0, i32 1
  store i8 0, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.pipeline, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  store ptr null, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %17 = call noalias ptr @malloc(i64 noundef 2080) #5
  store ptr %17, ptr %7, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct.pipeline_command, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [257 x ptr], ptr %19, i64 0, i64 0
  store ptr null, ptr %20, align 8
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds %struct.pipeline_command, ptr %21, i32 0, i32 1
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.pipeline_command, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.pipeline_command, ptr %25, i32 0, i32 3
  store ptr null, ptr %26, align 8
  store i32 0, ptr %9, align 4
  br label %27

27:                                               ; preds = %322, %1
  %28 = load i32, ptr %9, align 4
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.token_list, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %33, label %325

33:                                               ; preds = %27
  %34 = load i32, ptr %9, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %53

36:                                               ; preds = %33
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.token_list, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

43:                                               ; preds = %36
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.token_list, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds i32, ptr %46, i64 0
  %48 = load i32, ptr %47, align 4
  %49 = icmp ne i32 %48, 3
  br i1 %49, label %50, label %53

50:                                               ; preds = %43
  %51 = load ptr, ptr %4, align 8
  call void @token_list_free(ptr noundef %51)
  %52 = load ptr, ptr %5, align 8
  call void @pipeline_free(ptr noundef %52)
  store ptr null, ptr %2, align 8
  br label %354

53:                                               ; preds = %43, %36, %33
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.token_list, ptr %54, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  %57 = load i32, ptr %9, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  switch i32 %60, label %317 [
    i32 0, label %61
    i32 3, label %80
    i32 1, label %90
    i32 2, label %146
    i32 4, label %256
  ]

61:                                               ; preds = %53
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.token_list, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %9, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %64, i64 %66
  %68 = load ptr, ptr %67, align 8
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr inbounds %struct.pipeline_command, ptr %69, i32 0, i32 0
  %71 = load i32, ptr %6, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [257 x ptr], ptr %70, i64 0, i64 %72
  store ptr %68, ptr %73, align 8
  %74 = load ptr, ptr %7, align 8
  %75 = getelementptr inbounds %struct.pipeline_command, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %6, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %6, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [257 x ptr], ptr %75, i64 0, i64 %78
  store ptr null, ptr %79, align 8
  br label %320

80:                                               ; preds = %53
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr inbounds %struct.pipeline, ptr %81, i32 0, i32 1
  store i8 1, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.token_list, ptr %83, i32 0, i32 0
  %85 = load ptr, ptr %84, align 8
  %86 = load i32, ptr %9, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds ptr, ptr %85, i64 %87
  %89 = load ptr, ptr %88, align 8
  call void @free(ptr noundef %89) #6
  br label %320

90:                                               ; preds = %53
  %91 = load ptr, ptr %5, align 8
  %92 = getelementptr inbounds %struct.pipeline, ptr %91, i32 0, i32 0
  %93 = load ptr, ptr %92, align 8
  %94 = icmp eq ptr %93, null
  br i1 %94, label %95, label %142

95:                                               ; preds = %90
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.token_list, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = load i32, ptr %9, align 4
  %100 = add nsw i32 %99, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, ptr %98, i64 %101
  %103 = load i32, ptr %102, align 4
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %142

105:                                              ; preds = %95
  %106 = load i32, ptr %9, align 4
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds %struct.token_list, ptr %107, i32 0, i32 2
  %109 = load i32, ptr %108, align 8
  %110 = sub nsw i32 %109, 2
  %111 = icmp eq i32 %106, %110
  br i1 %111, label %122, label %112

112:                                              ; preds = %105
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds %struct.token_list, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = load i32, ptr %9, align 4
  %117 = add nsw i32 %116, 2
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, ptr %115, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %142

122:                                              ; preds = %112, %105
  %123 = load ptr, ptr %4, align 8
  %124 = getelementptr inbounds %struct.token_list, ptr %123, i32 0, i32 0
  %125 = load ptr, ptr %124, align 8
  %126 = load i32, ptr %9, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds ptr, ptr %125, i64 %128
  %130 = load ptr, ptr %129, align 8
  %131 = load ptr, ptr %7, align 8
  %132 = getelementptr inbounds %struct.pipeline_command, ptr %131, i32 0, i32 1
  store ptr %130, ptr %132, align 8
  %133 = load ptr, ptr %4, align 8
  %134 = getelementptr inbounds %struct.token_list, ptr %133, i32 0, i32 0
  %135 = load ptr, ptr %134, align 8
  %136 = load i32, ptr %9, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds ptr, ptr %135, i64 %137
  %139 = load ptr, ptr %138, align 8
  call void @free(ptr noundef %139) #6
  %140 = load i32, ptr %9, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, ptr %9, align 4
  br label %145

142:                                              ; preds = %112, %95, %90
  %143 = load ptr, ptr %4, align 8
  call void @token_list_free(ptr noundef %143)
  %144 = load ptr, ptr %5, align 8
  call void @pipeline_free(ptr noundef %144)
  store ptr null, ptr %2, align 8
  br label %354

145:                                              ; preds = %122
  br label %320

146:                                              ; preds = %53
  %147 = load i32, ptr %9, align 4
  %148 = load ptr, ptr %4, align 8
  %149 = getelementptr inbounds %struct.token_list, ptr %148, i32 0, i32 2
  %150 = load i32, ptr %149, align 8
  %151 = sub nsw i32 %150, 2
  %152 = icmp eq i32 %147, %151
  br i1 %152, label %170, label %153

153:                                              ; preds = %146
  %154 = load i32, ptr %9, align 4
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds %struct.token_list, ptr %155, i32 0, i32 2
  %157 = load i32, ptr %156, align 8
  %158 = sub nsw i32 %157, 3
  %159 = icmp eq i32 %154, %158
  br i1 %159, label %160, label %252

160:                                              ; preds = %153
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.token_list, ptr %161, i32 0, i32 1
  %163 = load ptr, ptr %162, align 8
  %164 = load i32, ptr %9, align 4
  %165 = add nsw i32 %164, 2
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, ptr %163, i64 %166
  %168 = load i32, ptr %167, align 4
  %169 = icmp eq i32 %168, 3
  br i1 %169, label %170, label %252

170:                                              ; preds = %160, %146
  %171 = load ptr, ptr %4, align 8
  %172 = getelementptr inbounds %struct.token_list, ptr %171, i32 0, i32 1
  %173 = load ptr, ptr %172, align 8
  %174 = load i32, ptr %9, align 4
  %175 = add nsw i32 %174, 1
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, ptr %173, i64 %176
  %178 = load i32, ptr %177, align 4
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %180, label %252

180:                                              ; preds = %170
  %181 = load ptr, ptr %4, align 8
  %182 = getelementptr inbounds %struct.token_list, ptr %181, i32 0, i32 0
  %183 = load ptr, ptr %182, align 8
  %184 = load i32, ptr %9, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds ptr, ptr %183, i64 %185
  %187 = load ptr, ptr %186, align 8
  call void @free(ptr noundef %187) #6
  %188 = load ptr, ptr %4, align 8
  %189 = getelementptr inbounds %struct.token_list, ptr %188, i32 0, i32 0
  %190 = load ptr, ptr %189, align 8
  %191 = load i32, ptr %9, align 4
  %192 = add nsw i32 %191, 1
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds ptr, ptr %190, i64 %193
  %195 = load ptr, ptr %194, align 8
  %196 = load ptr, ptr %7, align 8
  %197 = getelementptr inbounds %struct.pipeline_command, ptr %196, i32 0, i32 2
  store ptr %195, ptr %197, align 8
  %198 = load ptr, ptr %8, align 8
  %199 = icmp eq ptr %198, null
  br i1 %199, label %200, label %204

200:                                              ; preds = %180
  %201 = load ptr, ptr %7, align 8
  %202 = load ptr, ptr %5, align 8
  %203 = getelementptr inbounds %struct.pipeline, ptr %202, i32 0, i32 0
  store ptr %201, ptr %203, align 8
  br label %208

204:                                              ; preds = %180
  %205 = load ptr, ptr %7, align 8
  %206 = load ptr, ptr %8, align 8
  %207 = getelementptr inbounds %struct.pipeline_command, ptr %206, i32 0, i32 3
  store ptr %205, ptr %207, align 8
  br label %208

208:                                              ; preds = %204, %200
  %209 = load ptr, ptr %7, align 8
  store ptr %209, ptr %8, align 8
  store i32 0, ptr %6, align 4
  %210 = call noalias ptr @malloc(i64 noundef 2080) #5
  store ptr %210, ptr %7, align 8
  %211 = load ptr, ptr %7, align 8
  %212 = getelementptr inbounds %struct.pipeline_command, ptr %211, i32 0, i32 0
  %213 = getelementptr inbounds [257 x ptr], ptr %212, i64 0, i64 0
  store ptr null, ptr %213, align 8
  %214 = load ptr, ptr %7, align 8
  %215 = getelementptr inbounds %struct.pipeline_command, ptr %214, i32 0, i32 1
  store ptr null, ptr %215, align 8
  %216 = load ptr, ptr %7, align 8
  %217 = getelementptr inbounds %struct.pipeline_command, ptr %216, i32 0, i32 2
  store ptr null, ptr %217, align 8
  %218 = load ptr, ptr %7, align 8
  %219 = getelementptr inbounds %struct.pipeline_command, ptr %218, i32 0, i32 3
  store ptr null, ptr %219, align 8
  %220 = load i32, ptr %9, align 4
  %221 = add nsw i32 %220, 2
  %222 = load ptr, ptr %4, align 8
  %223 = getelementptr inbounds %struct.token_list, ptr %222, i32 0, i32 2
  %224 = load i32, ptr %223, align 8
  %225 = icmp slt i32 %221, %224
  br i1 %225, label %226, label %249

226:                                              ; preds = %208
  %227 = load ptr, ptr %4, align 8
  %228 = getelementptr inbounds %struct.token_list, ptr %227, i32 0, i32 1
  %229 = load ptr, ptr %228, align 8
  %230 = load i32, ptr %9, align 4
  %231 = add nsw i32 %230, 2
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, ptr %229, i64 %232
  %234 = load i32, ptr %233, align 4
  %235 = icmp eq i32 %234, 3
  br i1 %235, label %236, label %249

236:                                              ; preds = %226
  %237 = load ptr, ptr %5, align 8
  %238 = getelementptr inbounds %struct.pipeline, ptr %237, i32 0, i32 1
  store i8 1, ptr %238, align 8
  %239 = load ptr, ptr %4, align 8
  %240 = getelementptr inbounds %struct.token_list, ptr %239, i32 0, i32 0
  %241 = load ptr, ptr %240, align 8
  %242 = load i32, ptr %9, align 4
  %243 = add nsw i32 %242, 2
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds ptr, ptr %241, i64 %244
  %246 = load ptr, ptr %245, align 8
  call void @free(ptr noundef %246) #6
  %247 = load i32, ptr %9, align 4
  %248 = add nsw i32 %247, 2
  store i32 %248, ptr %9, align 4
  br label %249

249:                                              ; preds = %236, %226, %208
  %250 = load i32, ptr %9, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, ptr %9, align 4
  br label %255

252:                                              ; preds = %170, %160, %153
  %253 = load ptr, ptr %4, align 8
  call void @token_list_free(ptr noundef %253)
  %254 = load ptr, ptr %5, align 8
  call void @pipeline_free(ptr noundef %254)
  store ptr null, ptr %2, align 8
  br label %354

255:                                              ; preds = %249
  br label %320

256:                                              ; preds = %53
  %257 = load i32, ptr %9, align 4
  %258 = load ptr, ptr %4, align 8
  %259 = getelementptr inbounds %struct.token_list, ptr %258, i32 0, i32 2
  %260 = load i32, ptr %259, align 8
  %261 = sub nsw i32 %260, 1
  %262 = icmp ne i32 %257, %261
  br i1 %262, label %263, label %313

263:                                              ; preds = %256
  %264 = load ptr, ptr %4, align 8
  %265 = getelementptr inbounds %struct.token_list, ptr %264, i32 0, i32 1
  %266 = load ptr, ptr %265, align 8
  %267 = load i32, ptr %9, align 4
  %268 = sub nsw i32 %267, 1
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i32, ptr %266, i64 %269
  %271 = load i32, ptr %270, align 4
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %313

273:                                              ; preds = %263
  %274 = load ptr, ptr %4, align 8
  %275 = getelementptr inbounds %struct.token_list, ptr %274, i32 0, i32 1
  %276 = load ptr, ptr %275, align 8
  %277 = load i32, ptr %9, align 4
  %278 = add nsw i32 %277, 1
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds i32, ptr %276, i64 %279
  %281 = load i32, ptr %280, align 4
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %283, label %313

283:                                              ; preds = %273
  %284 = load ptr, ptr %4, align 8
  %285 = getelementptr inbounds %struct.token_list, ptr %284, i32 0, i32 0
  %286 = load ptr, ptr %285, align 8
  %287 = load i32, ptr %9, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds ptr, ptr %286, i64 %288
  %290 = load ptr, ptr %289, align 8
  call void @free(ptr noundef %290) #6
  %291 = load ptr, ptr %8, align 8
  %292 = icmp eq ptr %291, null
  br i1 %292, label %293, label %297

293:                                              ; preds = %283
  %294 = load ptr, ptr %7, align 8
  %295 = load ptr, ptr %5, align 8
  %296 = getelementptr inbounds %struct.pipeline, ptr %295, i32 0, i32 0
  store ptr %294, ptr %296, align 8
  br label %301

297:                                              ; preds = %283
  %298 = load ptr, ptr %7, align 8
  %299 = load ptr, ptr %8, align 8
  %300 = getelementptr inbounds %struct.pipeline_command, ptr %299, i32 0, i32 3
  store ptr %298, ptr %300, align 8
  br label %301

301:                                              ; preds = %297, %293
  %302 = load ptr, ptr %7, align 8
  store ptr %302, ptr %8, align 8
  store i32 0, ptr %6, align 4
  %303 = call noalias ptr @malloc(i64 noundef 2080) #5
  store ptr %303, ptr %7, align 8
  %304 = load ptr, ptr %7, align 8
  %305 = getelementptr inbounds %struct.pipeline_command, ptr %304, i32 0, i32 0
  %306 = getelementptr inbounds [257 x ptr], ptr %305, i64 0, i64 0
  store ptr null, ptr %306, align 8
  %307 = load ptr, ptr %7, align 8
  %308 = getelementptr inbounds %struct.pipeline_command, ptr %307, i32 0, i32 1
  store ptr null, ptr %308, align 8
  %309 = load ptr, ptr %7, align 8
  %310 = getelementptr inbounds %struct.pipeline_command, ptr %309, i32 0, i32 2
  store ptr null, ptr %310, align 8
  %311 = load ptr, ptr %7, align 8
  %312 = getelementptr inbounds %struct.pipeline_command, ptr %311, i32 0, i32 3
  store ptr null, ptr %312, align 8
  br label %316

313:                                              ; preds = %273, %263, %256
  %314 = load ptr, ptr %4, align 8
  call void @token_list_free(ptr noundef %314)
  %315 = load ptr, ptr %5, align 8
  call void @pipeline_free(ptr noundef %315)
  store ptr null, ptr %2, align 8
  br label %354

316:                                              ; preds = %301
  br label %320

317:                                              ; preds = %53
  %318 = load ptr, ptr %4, align 8
  call void @token_list_free(ptr noundef %318)
  %319 = load ptr, ptr %5, align 8
  call void @pipeline_free(ptr noundef %319)
  store ptr null, ptr %2, align 8
  br label %354

320:                                              ; preds = %316, %255, %145, %80, %61
  br label %321

321:                                              ; preds = %320
  br label %322

322:                                              ; preds = %321
  %323 = load i32, ptr %9, align 4
  %324 = add nsw i32 %323, 1
  store i32 %324, ptr %9, align 4
  br label %27, !llvm.loop !10

325:                                              ; preds = %27
  %326 = load ptr, ptr %7, align 8
  %327 = getelementptr inbounds %struct.pipeline_command, ptr %326, i32 0, i32 0
  %328 = getelementptr inbounds [257 x ptr], ptr %327, i64 0, i64 0
  %329 = load ptr, ptr %328, align 8
  %330 = icmp ne ptr %329, null
  br i1 %330, label %331, label %343

331:                                              ; preds = %325
  %332 = load ptr, ptr %8, align 8
  %333 = icmp eq ptr %332, null
  br i1 %333, label %334, label %338

334:                                              ; preds = %331
  %335 = load ptr, ptr %7, align 8
  %336 = load ptr, ptr %5, align 8
  %337 = getelementptr inbounds %struct.pipeline, ptr %336, i32 0, i32 0
  store ptr %335, ptr %337, align 8
  br label %342

338:                                              ; preds = %331
  %339 = load ptr, ptr %7, align 8
  %340 = load ptr, ptr %8, align 8
  %341 = getelementptr inbounds %struct.pipeline_command, ptr %340, i32 0, i32 3
  store ptr %339, ptr %341, align 8
  br label %342

342:                                              ; preds = %338, %334
  br label %345

343:                                              ; preds = %325
  %344 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %344) #6
  br label %345

345:                                              ; preds = %343, %342
  %346 = load ptr, ptr %4, align 8
  %347 = getelementptr inbounds %struct.token_list, ptr %346, i32 0, i32 1
  %348 = load ptr, ptr %347, align 8
  call void @free(ptr noundef %348) #6
  %349 = load ptr, ptr %4, align 8
  %350 = getelementptr inbounds %struct.token_list, ptr %349, i32 0, i32 0
  %351 = load ptr, ptr %350, align 8
  call void @free(ptr noundef %351) #6
  %352 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %352) #6
  %353 = load ptr, ptr %5, align 8
  store ptr %353, ptr %2, align 8
  br label %354

354:                                              ; preds = %345, %317, %313, %252, %142, %50
  %355 = load ptr, ptr %2, align 8
  ret ptr %355
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @pipeline_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %5

5:                                                ; preds = %58, %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.pipeline, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %70

10:                                               ; preds = %5
  store i32 0, ptr %3, align 4
  br label %11

11:                                               ; preds = %21, %10
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.pipeline, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.pipeline_command, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [257 x ptr], ptr %15, i64 0, i64 %17
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %32

21:                                               ; preds = %11
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.pipeline, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.pipeline_command, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [257 x ptr], ptr %25, i64 0, i64 %27
  %29 = load ptr, ptr %28, align 8
  call void @free(ptr noundef %29) #6
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %11, !llvm.loop !11

32:                                               ; preds = %11
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.pipeline, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.pipeline_command, ptr %35, i32 0, i32 2
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %45

39:                                               ; preds = %32
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.pipeline, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.pipeline_command, ptr %42, i32 0, i32 2
  %44 = load ptr, ptr %43, align 8
  call void @free(ptr noundef %44) #6
  br label %45

45:                                               ; preds = %39, %32
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.pipeline, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.pipeline_command, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = icmp ne ptr %50, null
  br i1 %51, label %52, label %58

52:                                               ; preds = %45
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.pipeline, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds %struct.pipeline_command, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  call void @free(ptr noundef %57) #6
  br label %58

58:                                               ; preds = %52, %45
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds %struct.pipeline, ptr %59, i32 0, i32 0
  %61 = load ptr, ptr %60, align 8
  store ptr %61, ptr %4, align 8
  %62 = load ptr, ptr %2, align 8
  %63 = getelementptr inbounds %struct.pipeline, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = getelementptr inbounds %struct.pipeline_command, ptr %64, i32 0, i32 3
  %66 = load ptr, ptr %65, align 8
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds %struct.pipeline, ptr %67, i32 0, i32 0
  store ptr %66, ptr %68, align 8
  %69 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %69) #6
  br label %5, !llvm.loop !12

70:                                               ; preds = %5
  %71 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %71) #6
  ret void
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(1) }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
