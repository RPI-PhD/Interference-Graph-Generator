; ModuleID = './code_data/parser.ll'
source_filename = "./code_data/parser.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.token_list = type { ptr, ptr, i32 }
%struct.pipeline = type { ptr, i8 }
%struct.pipeline_command = type { [257 x ptr], ptr, ptr, ptr }

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @token_creator(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = sext i32 %3 to i64
  %8 = mul i64 %7, 8
  %9 = call ptr @realloc(ptr noundef %6, i64 noundef %8) #4
  %10 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %3 to i64
  %14 = mul i64 %13, 4
  %15 = call ptr @realloc(ptr noundef %12, i64 noundef %14) #4
  %16 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 1
  store ptr %15, ptr %16, align 8
  %17 = add nsw i32 %2, 1
  %18 = sext i32 %17 to i64
  %19 = call noalias ptr @malloc(i64 noundef %18) #5
  %20 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = sub nsw i32 %3, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  store ptr %19, ptr %24, align 8
  br label %25

25:                                               ; preds = %39, %4
  %.01 = phi i32 [ 0, %4 ], [ %40, %39 ]
  %26 = icmp slt i32 %.01, %2
  br i1 %26, label %27, label %41

27:                                               ; preds = %25
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds i8, ptr %1, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = sub nsw i32 %3, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds ptr, ptr %32, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = sext i32 %.01 to i64
  %38 = getelementptr inbounds i8, ptr %36, i64 %37
  store i8 %30, ptr %38, align 1
  br label %39

39:                                               ; preds = %27
  %40 = add nsw i32 %.01, 1
  br label %25, !llvm.loop !6

41:                                               ; preds = %25
  %42 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = sub nsw i32 %3, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds ptr, ptr %43, i64 %45
  %47 = load ptr, ptr %46, align 8
  %48 = sext i32 %2 to i64
  %49 = getelementptr inbounds i8, ptr %47, i64 %48
  store i8 0, ptr %49, align 1
  %50 = getelementptr inbounds i8, ptr %1, i64 1
  %51 = load i8, ptr %50, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %65

54:                                               ; preds = %41
  %55 = getelementptr inbounds i8, ptr %1, i64 0
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  switch i32 %57, label %63 [
    i32 60, label %58
    i32 62, label %59
    i32 38, label %60
    i32 124, label %61
    i32 10, label %62
  ]

58:                                               ; preds = %54
  br label %64

59:                                               ; preds = %54
  br label %64

60:                                               ; preds = %54
  br label %64

61:                                               ; preds = %54
  br label %64

62:                                               ; preds = %54
  br label %64

63:                                               ; preds = %54
  br label %64

64:                                               ; preds = %63, %62, %61, %60, %59, %58
  %.0 = phi i32 [ 0, %63 ], [ 5, %62 ], [ 4, %61 ], [ 3, %60 ], [ 2, %59 ], [ 1, %58 ]
  br label %66

65:                                               ; preds = %41
  br label %66

66:                                               ; preds = %65, %64
  %.1 = phi i32 [ %.0, %64 ], [ 0, %65 ]
  %67 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 1
  %68 = load ptr, ptr %67, align 8
  %69 = sub nsw i32 %3, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, ptr %68, i64 %70
  store i32 %.1, ptr %71, align 4
  ret i1 true
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @lexer(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 24) #5
  %3 = sext i32 0 to i64
  %4 = mul i64 %3, 8
  %5 = call noalias ptr @malloc(i64 noundef %4) #5
  %6 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = sext i32 0 to i64
  %8 = mul i64 %7, 4
  %9 = call noalias ptr @malloc(i64 noundef %8) #5
  %10 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  br label %11

11:                                               ; preds = %72, %1
  %.09 = phi i32 [ 1, %1 ], [ %.615, %72 ]
  %.03 = phi i32 [ 0, %1 ], [ %.6, %72 ]
  %.02 = phi ptr [ null, %1 ], [ %.5, %72 ]
  %.01 = phi ptr [ null, %1 ], [ %.0, %72 ]
  %.0 = phi ptr [ %0, %1 ], [ %73, %72 ]
  %12 = load i8, ptr %.0, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %74

15:                                               ; preds = %11
  %16 = load i8, ptr %.0, align 1
  %17 = sext i8 %16 to i32
  switch i32 %17, label %41 [
    i32 62, label %18
    i32 60, label %18
    i32 38, label %18
    i32 124, label %18
    i32 10, label %18
    i32 32, label %35
    i32 9, label %35
  ]

18:                                               ; preds = %15, %15, %15, %15, %15
  %19 = icmp ne ptr %.01, null
  br i1 %19, label %20, label %28

20:                                               ; preds = %18
  %21 = load i8, ptr %.01, align 1
  %22 = sext i8 %21 to i32
  switch i32 %22, label %24 [
    i32 9, label %23
    i32 32, label %23
  ]

23:                                               ; preds = %20, %20
  br label %27

24:                                               ; preds = %20
  %25 = add nsw i32 %.03, 1
  %26 = call zeroext i1 @token_creator(ptr noundef %2, ptr noundef %.02, i32 noundef %.09, i32 noundef %25)
  call void @free(ptr noundef %.02) #6
  br label %27

27:                                               ; preds = %24, %23
  %.110 = phi i32 [ 1, %24 ], [ %.09, %23 ]
  %.14 = phi i32 [ %25, %24 ], [ %.03, %23 ]
  br label %28

28:                                               ; preds = %27, %18
  %.211 = phi i32 [ %.110, %27 ], [ %.09, %18 ]
  %.25 = phi i32 [ %.14, %27 ], [ %.03, %18 ]
  %29 = add nsw i32 %.211, 1
  %30 = sext i32 %29 to i64
  %31 = call noalias ptr @malloc(i64 noundef %30) #5
  %32 = load i8, ptr %.0, align 1
  %33 = getelementptr inbounds i8, ptr %31, i64 0
  store i8 %32, ptr %33, align 1
  %34 = getelementptr inbounds i8, ptr %31, i64 1
  store i8 0, ptr %34, align 1
  br label %72

35:                                               ; preds = %15, %15
  %36 = icmp ne ptr %.02, null
  br i1 %36, label %37, label %40

37:                                               ; preds = %35
  %38 = add nsw i32 %.03, 1
  %39 = call zeroext i1 @token_creator(ptr noundef %2, ptr noundef %.02, i32 noundef %.09, i32 noundef %38)
  call void @free(ptr noundef %.02) #6
  br label %40

40:                                               ; preds = %37, %35
  %.312 = phi i32 [ 1, %37 ], [ %.09, %35 ]
  %.36 = phi i32 [ %38, %37 ], [ %.03, %35 ]
  %.1 = phi ptr [ null, %37 ], [ %.02, %35 ]
  br label %72

41:                                               ; preds = %15
  %42 = icmp ne ptr %.01, null
  br i1 %42, label %43, label %51

43:                                               ; preds = %41
  %44 = load i8, ptr %.01, align 1
  %45 = sext i8 %44 to i32
  switch i32 %45, label %49 [
    i32 10, label %46
    i32 124, label %46
    i32 62, label %46
    i32 60, label %46
    i32 38, label %46
  ]

46:                                               ; preds = %43, %43, %43, %43, %43
  %47 = add nsw i32 %.03, 1
  %48 = call zeroext i1 @token_creator(ptr noundef %2, ptr noundef %.02, i32 noundef %.09, i32 noundef %47)
  call void @free(ptr noundef %.02) #6
  br label %50

49:                                               ; preds = %43
  br label %50

50:                                               ; preds = %49, %46
  %.413 = phi i32 [ %.09, %49 ], [ 1, %46 ]
  %.47 = phi i32 [ %.03, %49 ], [ %47, %46 ]
  %.2 = phi ptr [ %.02, %49 ], [ null, %46 ]
  br label %51

51:                                               ; preds = %50, %41
  %.514 = phi i32 [ %.413, %50 ], [ %.09, %41 ]
  %.58 = phi i32 [ %.47, %50 ], [ %.03, %41 ]
  %.3 = phi ptr [ %.2, %50 ], [ %.02, %41 ]
  %52 = icmp eq ptr %.3, null
  br i1 %52, label %53, label %60

53:                                               ; preds = %51
  %54 = add nsw i32 %.514, 1
  %55 = sext i32 %54 to i64
  %56 = call noalias ptr @malloc(i64 noundef %55) #5
  %57 = load i8, ptr %.0, align 1
  %58 = getelementptr inbounds i8, ptr %56, i64 0
  store i8 %57, ptr %58, align 1
  %59 = getelementptr inbounds i8, ptr %56, i64 1
  store i8 0, ptr %59, align 1
  br label %70

60:                                               ; preds = %51
  %61 = add nsw i32 %.514, 1
  %62 = sext i32 %61 to i64
  %63 = call ptr @realloc(ptr noundef %.3, i64 noundef %62) #4
  %64 = load i8, ptr %.0, align 1
  %65 = sub nsw i32 %.514, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, ptr %63, i64 %66
  store i8 %64, ptr %67, align 1
  %68 = sext i32 %.514 to i64
  %69 = getelementptr inbounds i8, ptr %63, i64 %68
  store i8 0, ptr %69, align 1
  br label %70

70:                                               ; preds = %60, %53
  %.4 = phi ptr [ %56, %53 ], [ %63, %60 ]
  %71 = add nsw i32 %.514, 1
  br label %72

72:                                               ; preds = %70, %40, %28
  %.615 = phi i32 [ %71, %70 ], [ %.312, %40 ], [ %.211, %28 ]
  %.6 = phi i32 [ %.58, %70 ], [ %.36, %40 ], [ %.25, %28 ]
  %.5 = phi ptr [ %.4, %70 ], [ %.1, %40 ], [ %31, %28 ]
  %73 = getelementptr inbounds i8, ptr %.0, i32 1
  br label %11, !llvm.loop !8

74:                                               ; preds = %11
  %75 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  store i32 %.03, ptr %75, align 8
  call void @free(ptr noundef %.02) #6
  ret ptr %2
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @token_list_free(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 1
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #6
  br label %4

4:                                                ; preds = %14, %1
  %.0 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %5 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = icmp slt i32 %.0, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds ptr, ptr %10, i64 %11
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13) #6
  br label %14

14:                                               ; preds = %8
  %15 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !9

16:                                               ; preds = %4
  %17 = getelementptr inbounds %struct.token_list, ptr %0, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %18) #6
  call void @free(ptr noundef %0) #6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pipeline_build(ptr noundef %0) #0 {
  %2 = call ptr @lexer(ptr noundef %0)
  %3 = call noalias ptr @malloc(i64 noundef 16) #5
  %4 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 1
  store i8 0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 0
  store ptr null, ptr %5, align 8
  %6 = call noalias ptr @malloc(i64 noundef 2080) #5
  %7 = getelementptr inbounds %struct.pipeline_command, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds [257 x ptr], ptr %7, i64 0, i64 0
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds %struct.pipeline_command, ptr %6, i32 0, i32 1
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %struct.pipeline_command, ptr %6, i32 0, i32 2
  store ptr null, ptr %10, align 8
  %11 = getelementptr inbounds %struct.pipeline_command, ptr %6, i32 0, i32 3
  store ptr null, ptr %11, align 8
  br label %12

12:                                               ; preds = %218, %1
  %.06 = phi ptr [ %6, %1 ], [ %.17, %218 ]
  %.04 = phi i32 [ 0, %1 ], [ %.15, %218 ]
  %.02 = phi ptr [ null, %1 ], [ %.13, %218 ]
  %.01 = phi i32 [ 0, %1 ], [ %219, %218 ]
  %13 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %14 = load i32, ptr %13, align 8
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %16, label %220

16:                                               ; preds = %12
  %17 = icmp eq i32 %.01, 0
  br i1 %17, label %18, label %31

18:                                               ; preds = %16
  %19 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds i32, ptr %20, i64 0
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %31

24:                                               ; preds = %18
  %25 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds i32, ptr %26, i64 0
  %28 = load i32, ptr %27, align 4
  %29 = icmp ne i32 %28, 3
  br i1 %29, label %30, label %31

30:                                               ; preds = %24
  call void @token_list_free(ptr noundef %2)
  call void @pipeline_free(ptr noundef %3)
  br label %238

31:                                               ; preds = %24, %18, %16
  %32 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  %34 = sext i32 %.01 to i64
  %35 = getelementptr inbounds i32, ptr %33, i64 %34
  %36 = load i32, ptr %35, align 4
  switch i32 %36, label %215 [
    i32 0, label %37
    i32 3, label %50
    i32 1, label %57
    i32 2, label %98
    i32 4, label %174
  ]

37:                                               ; preds = %31
  %38 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = sext i32 %.01 to i64
  %41 = getelementptr inbounds ptr, ptr %39, i64 %40
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.pipeline_command, ptr %.06, i32 0, i32 0
  %44 = sext i32 %.04 to i64
  %45 = getelementptr inbounds [257 x ptr], ptr %43, i64 0, i64 %44
  store ptr %42, ptr %45, align 8
  %46 = getelementptr inbounds %struct.pipeline_command, ptr %.06, i32 0, i32 0
  %47 = add nsw i32 %.04, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [257 x ptr], ptr %46, i64 0, i64 %48
  store ptr null, ptr %49, align 8
  br label %216

50:                                               ; preds = %31
  %51 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 1
  store i8 1, ptr %51, align 8
  %52 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %53 = load ptr, ptr %52, align 8
  %54 = sext i32 %.01 to i64
  %55 = getelementptr inbounds ptr, ptr %53, i64 %54
  %56 = load ptr, ptr %55, align 8
  call void @free(ptr noundef %56) #6
  br label %216

57:                                               ; preds = %31
  %58 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %96

61:                                               ; preds = %57
  %62 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = add nsw i32 %.01, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %96

69:                                               ; preds = %61
  %70 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %71 = load i32, ptr %70, align 8
  %72 = sub nsw i32 %71, 2
  %73 = icmp eq i32 %.01, %72
  br i1 %73, label %82, label %74

74:                                               ; preds = %69
  %75 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = add nsw i32 %.01, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, ptr %76, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %96

82:                                               ; preds = %74, %69
  %83 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %84 = load ptr, ptr %83, align 8
  %85 = add nsw i32 %.01, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds ptr, ptr %84, i64 %86
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds %struct.pipeline_command, ptr %.06, i32 0, i32 1
  store ptr %88, ptr %89, align 8
  %90 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %91 = load ptr, ptr %90, align 8
  %92 = sext i32 %.01 to i64
  %93 = getelementptr inbounds ptr, ptr %91, i64 %92
  %94 = load ptr, ptr %93, align 8
  call void @free(ptr noundef %94) #6
  %95 = add nsw i32 %.01, 1
  br label %97

96:                                               ; preds = %74, %61, %57
  call void @token_list_free(ptr noundef %2)
  call void @pipeline_free(ptr noundef %3)
  br label %238

97:                                               ; preds = %82
  br label %216

98:                                               ; preds = %31
  %99 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %100 = load i32, ptr %99, align 8
  %101 = sub nsw i32 %100, 2
  %102 = icmp eq i32 %.01, %101
  br i1 %102, label %116, label %103

103:                                              ; preds = %98
  %104 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %105 = load i32, ptr %104, align 8
  %106 = sub nsw i32 %105, 3
  %107 = icmp eq i32 %.01, %106
  br i1 %107, label %108, label %172

108:                                              ; preds = %103
  %109 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  %111 = add nsw i32 %.01, 2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %110, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = icmp eq i32 %114, 3
  br i1 %115, label %116, label %172

116:                                              ; preds = %108, %98
  %117 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %118 = load ptr, ptr %117, align 8
  %119 = add nsw i32 %.01, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, ptr %118, i64 %120
  %122 = load i32, ptr %121, align 4
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %172

124:                                              ; preds = %116
  %125 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %126 = load ptr, ptr %125, align 8
  %127 = sext i32 %.01 to i64
  %128 = getelementptr inbounds ptr, ptr %126, i64 %127
  %129 = load ptr, ptr %128, align 8
  call void @free(ptr noundef %129) #6
  %130 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %131 = load ptr, ptr %130, align 8
  %132 = add nsw i32 %.01, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds ptr, ptr %131, i64 %133
  %135 = load ptr, ptr %134, align 8
  %136 = getelementptr inbounds %struct.pipeline_command, ptr %.06, i32 0, i32 2
  store ptr %135, ptr %136, align 8
  %137 = icmp eq ptr %.02, null
  br i1 %137, label %138, label %140

138:                                              ; preds = %124
  %139 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 0
  store ptr %.06, ptr %139, align 8
  br label %142

140:                                              ; preds = %124
  %141 = getelementptr inbounds %struct.pipeline_command, ptr %.02, i32 0, i32 3
  store ptr %.06, ptr %141, align 8
  br label %142

142:                                              ; preds = %140, %138
  %143 = call noalias ptr @malloc(i64 noundef 2080) #5
  %144 = getelementptr inbounds %struct.pipeline_command, ptr %143, i32 0, i32 0
  %145 = getelementptr inbounds [257 x ptr], ptr %144, i64 0, i64 0
  store ptr null, ptr %145, align 8
  %146 = getelementptr inbounds %struct.pipeline_command, ptr %143, i32 0, i32 1
  store ptr null, ptr %146, align 8
  %147 = getelementptr inbounds %struct.pipeline_command, ptr %143, i32 0, i32 2
  store ptr null, ptr %147, align 8
  %148 = getelementptr inbounds %struct.pipeline_command, ptr %143, i32 0, i32 3
  store ptr null, ptr %148, align 8
  %149 = add nsw i32 %.01, 2
  %150 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %151 = load i32, ptr %150, align 8
  %152 = icmp slt i32 %149, %151
  br i1 %152, label %153, label %170

153:                                              ; preds = %142
  %154 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %155 = load ptr, ptr %154, align 8
  %156 = add nsw i32 %.01, 2
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, ptr %155, i64 %157
  %159 = load i32, ptr %158, align 4
  %160 = icmp eq i32 %159, 3
  br i1 %160, label %161, label %170

161:                                              ; preds = %153
  %162 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 1
  store i8 1, ptr %162, align 8
  %163 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %164 = load ptr, ptr %163, align 8
  %165 = add nsw i32 %.01, 2
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds ptr, ptr %164, i64 %166
  %168 = load ptr, ptr %167, align 8
  call void @free(ptr noundef %168) #6
  %169 = add nsw i32 %.01, 2
  br label %170

170:                                              ; preds = %161, %153, %142
  %.1 = phi i32 [ %169, %161 ], [ %.01, %153 ], [ %.01, %142 ]
  %171 = add nsw i32 %.1, 1
  br label %173

172:                                              ; preds = %116, %108, %103
  call void @token_list_free(ptr noundef %2)
  call void @pipeline_free(ptr noundef %3)
  br label %238

173:                                              ; preds = %170
  br label %216

174:                                              ; preds = %31
  %175 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 2
  %176 = load i32, ptr %175, align 8
  %177 = sub nsw i32 %176, 1
  %178 = icmp ne i32 %.01, %177
  br i1 %178, label %179, label %213

179:                                              ; preds = %174
  %180 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = sub nsw i32 %.01, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i32, ptr %181, i64 %183
  %185 = load i32, ptr %184, align 4
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %213

187:                                              ; preds = %179
  %188 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = add nsw i32 %.01, 1
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i32, ptr %189, i64 %191
  %193 = load i32, ptr %192, align 4
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %213

195:                                              ; preds = %187
  %196 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %197 = load ptr, ptr %196, align 8
  %198 = sext i32 %.01 to i64
  %199 = getelementptr inbounds ptr, ptr %197, i64 %198
  %200 = load ptr, ptr %199, align 8
  call void @free(ptr noundef %200) #6
  %201 = icmp eq ptr %.02, null
  br i1 %201, label %202, label %204

202:                                              ; preds = %195
  %203 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 0
  store ptr %.06, ptr %203, align 8
  br label %206

204:                                              ; preds = %195
  %205 = getelementptr inbounds %struct.pipeline_command, ptr %.02, i32 0, i32 3
  store ptr %.06, ptr %205, align 8
  br label %206

206:                                              ; preds = %204, %202
  %207 = call noalias ptr @malloc(i64 noundef 2080) #5
  %208 = getelementptr inbounds %struct.pipeline_command, ptr %207, i32 0, i32 0
  %209 = getelementptr inbounds [257 x ptr], ptr %208, i64 0, i64 0
  store ptr null, ptr %209, align 8
  %210 = getelementptr inbounds %struct.pipeline_command, ptr %207, i32 0, i32 1
  store ptr null, ptr %210, align 8
  %211 = getelementptr inbounds %struct.pipeline_command, ptr %207, i32 0, i32 2
  store ptr null, ptr %211, align 8
  %212 = getelementptr inbounds %struct.pipeline_command, ptr %207, i32 0, i32 3
  store ptr null, ptr %212, align 8
  br label %214

213:                                              ; preds = %187, %179, %174
  call void @token_list_free(ptr noundef %2)
  call void @pipeline_free(ptr noundef %3)
  br label %238

214:                                              ; preds = %206
  br label %216

215:                                              ; preds = %31
  call void @token_list_free(ptr noundef %2)
  call void @pipeline_free(ptr noundef %3)
  br label %238

216:                                              ; preds = %214, %173, %97, %50, %37
  %.17 = phi ptr [ %207, %214 ], [ %143, %173 ], [ %.06, %97 ], [ %.06, %50 ], [ %.06, %37 ]
  %.15 = phi i32 [ 0, %214 ], [ 0, %173 ], [ %.04, %97 ], [ %.04, %50 ], [ %47, %37 ]
  %.13 = phi ptr [ %.06, %214 ], [ %.06, %173 ], [ %.02, %97 ], [ %.02, %50 ], [ %.02, %37 ]
  %.2 = phi i32 [ %.01, %214 ], [ %171, %173 ], [ %95, %97 ], [ %.01, %50 ], [ %.01, %37 ]
  br label %217

217:                                              ; preds = %216
  br label %218

218:                                              ; preds = %217
  %219 = add nsw i32 %.2, 1
  br label %12, !llvm.loop !10

220:                                              ; preds = %12
  %221 = getelementptr inbounds %struct.pipeline_command, ptr %.06, i32 0, i32 0
  %222 = getelementptr inbounds [257 x ptr], ptr %221, i64 0, i64 0
  %223 = load ptr, ptr %222, align 8
  %224 = icmp ne ptr %223, null
  br i1 %224, label %225, label %232

225:                                              ; preds = %220
  %226 = icmp eq ptr %.02, null
  br i1 %226, label %227, label %229

227:                                              ; preds = %225
  %228 = getelementptr inbounds %struct.pipeline, ptr %3, i32 0, i32 0
  store ptr %.06, ptr %228, align 8
  br label %231

229:                                              ; preds = %225
  %230 = getelementptr inbounds %struct.pipeline_command, ptr %.02, i32 0, i32 3
  store ptr %.06, ptr %230, align 8
  br label %231

231:                                              ; preds = %229, %227
  br label %233

232:                                              ; preds = %220
  call void @free(ptr noundef %.06) #6
  br label %233

233:                                              ; preds = %232, %231
  %234 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 1
  %235 = load ptr, ptr %234, align 8
  call void @free(ptr noundef %235) #6
  %236 = getelementptr inbounds %struct.token_list, ptr %2, i32 0, i32 0
  %237 = load ptr, ptr %236, align 8
  call void @free(ptr noundef %237) #6
  call void @free(ptr noundef %2) #6
  br label %238

238:                                              ; preds = %233, %215, %213, %172, %96, %30
  %.0 = phi ptr [ null, %30 ], [ null, %215 ], [ null, %213 ], [ null, %172 ], [ null, %96 ], [ %3, %233 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @pipeline_free(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %45, %1
  %3 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %53

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %15, %6
  %.0 = phi i32 [ 0, %6 ], [ %22, %15 ]
  %8 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.pipeline_command, ptr %9, i32 0, i32 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [257 x ptr], ptr %10, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %23

15:                                               ; preds = %7
  %16 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.pipeline_command, ptr %17, i32 0, i32 0
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [257 x ptr], ptr %18, i64 0, i64 %19
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21) #6
  %22 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !11

23:                                               ; preds = %7
  %24 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.pipeline_command, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.pipeline_command, ptr %31, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  call void @free(ptr noundef %33) #6
  br label %34

34:                                               ; preds = %29, %23
  %35 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.pipeline_command, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %45

40:                                               ; preds = %34
  %41 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.pipeline_command, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  call void @free(ptr noundef %44) #6
  br label %45

45:                                               ; preds = %40, %34
  %46 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.pipeline_command, ptr %49, i32 0, i32 3
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds %struct.pipeline, ptr %0, i32 0, i32 0
  store ptr %51, ptr %52, align 8
  call void @free(ptr noundef %47) #6
  br label %2, !llvm.loop !12

53:                                               ; preds = %2
  call void @free(ptr noundef %0) #6
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
