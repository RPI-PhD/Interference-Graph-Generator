; ModuleID = 'DATASETv2/gpt4o_mini-39013.c'
source_filename = "DATASETv2/gpt4o_mini-39013.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, [100 x ptr] }
%struct.Node = type { i32, i32, ptr }

@.str = private unnamed_addr constant [23 x i8] c"Graph representation:\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"Vertex %d: \00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"-> %d(%d) \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Shocking! Shortest distances from vertex %d:\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Distance to vertex %d: Unreachable!\0A\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"Distance to vertex %d: %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createGraph(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = call noalias ptr @malloc(i64 noundef 808) #4
  store ptr %5, ptr %3, align 8
  %6 = load i32, ptr %2, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.Graph, ptr %7, i32 0, i32 0
  store i32 %6, ptr %8, align 8
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %19, %1
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %22

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Graph, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x ptr], ptr %15, i64 0, i64 %17
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %9, !llvm.loop !6

22:                                               ; preds = %9
  %23 = load ptr, ptr %3, align 8
  ret ptr %23
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createNode(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %6, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 8
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.Node, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.Node, ptr %13, i32 0, i32 2
  store ptr null, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  ret ptr %15
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addEdge(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %10 = load i32, ptr %7, align 4
  %11 = load i32, ptr %8, align 4
  %12 = call ptr @createNode(i32 noundef %10, i32 noundef %11)
  store ptr %12, ptr %9, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.Graph, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %6, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x ptr], ptr %14, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %9, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 2
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.Graph, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x ptr], ptr %23, i64 0, i64 %25
  store ptr %21, ptr %26, align 8
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %8, align 4
  %29 = call ptr @createNode(i32 noundef %27, i32 noundef %28)
  store ptr %29, ptr %9, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.Graph, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x ptr], ptr %31, i64 0, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = load ptr, ptr %9, align 8
  %37 = getelementptr inbounds %struct.Node, ptr %36, i32 0, i32 2
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.Graph, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x ptr], ptr %40, i64 0, i64 %42
  store ptr %38, ptr %43, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printGraph(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %37, %1
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Graph, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %40

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Graph, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x ptr], ptr %14, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %4, align 8
  %19 = load i32, ptr %3, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %19)
  br label %21

21:                                               ; preds = %24, %12
  %22 = load ptr, ptr %4, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %35

24:                                               ; preds = %21
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.Node, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %27, i32 noundef %30)
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.Node, ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %4, align 8
  br label %21, !llvm.loop !8

35:                                               ; preds = %21
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %37

37:                                               ; preds = %35
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %6, !llvm.loop !9

40:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @dijkstra(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [100 x i32], align 16
  %6 = alloca [100 x i32], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %7, align 4
  br label %15

15:                                               ; preds = %28, %2
  %16 = load i32, ptr %7, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.Graph, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %31

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %23
  store i32 99999, ptr %24, align 4
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [100 x i32], ptr %6, i64 0, i64 %26
  store i32 0, ptr %27, align 4
  br label %28

28:                                               ; preds = %21
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  br label %15, !llvm.loop !10

31:                                               ; preds = %15
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %33
  store i32 0, ptr %34, align 4
  store i32 0, ptr %8, align 4
  br label %35

35:                                               ; preds = %114, %31
  %36 = load i32, ptr %8, align 4
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.Graph, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = sub nsw i32 %39, 1
  %41 = icmp slt i32 %36, %40
  br i1 %41, label %42, label %117

42:                                               ; preds = %35
  store i32 99999, ptr %9, align 4
  store i32 0, ptr %11, align 4
  br label %43

43:                                               ; preds = %69, %42
  %44 = load i32, ptr %11, align 4
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.Graph, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %49, label %72

49:                                               ; preds = %43
  %50 = load i32, ptr %11, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [100 x i32], ptr %6, i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %68, label %55

55:                                               ; preds = %49
  %56 = load i32, ptr %11, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %9, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %68

62:                                               ; preds = %55
  %63 = load i32, ptr %11, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  store i32 %66, ptr %9, align 4
  %67 = load i32, ptr %11, align 4
  store i32 %67, ptr %10, align 4
  br label %68

68:                                               ; preds = %62, %55, %49
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %11, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %11, align 4
  br label %43, !llvm.loop !11

72:                                               ; preds = %43
  %73 = load i32, ptr %10, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [100 x i32], ptr %6, i64 0, i64 %74
  store i32 1, ptr %75, align 4
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds %struct.Graph, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %10, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [100 x ptr], ptr %77, i64 0, i64 %79
  %81 = load ptr, ptr %80, align 8
  store ptr %81, ptr %12, align 8
  br label %82

82:                                               ; preds = %109, %72
  %83 = load ptr, ptr %12, align 8
  %84 = icmp ne ptr %83, null
  br i1 %84, label %85, label %113

85:                                               ; preds = %82
  %86 = load i32, ptr %10, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = load ptr, ptr %12, align 8
  %91 = getelementptr inbounds %struct.Node, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 4
  %93 = add nsw i32 %89, %92
  store i32 %93, ptr %13, align 4
  %94 = load i32, ptr %13, align 4
  %95 = load ptr, ptr %12, align 8
  %96 = getelementptr inbounds %struct.Node, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %98
  %100 = load i32, ptr %99, align 4
  %101 = icmp slt i32 %94, %100
  br i1 %101, label %102, label %109

102:                                              ; preds = %85
  %103 = load i32, ptr %13, align 4
  %104 = load ptr, ptr %12, align 8
  %105 = getelementptr inbounds %struct.Node, ptr %104, i32 0, i32 0
  %106 = load i32, ptr %105, align 8
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %107
  store i32 %103, ptr %108, align 4
  br label %109

109:                                              ; preds = %102, %85
  %110 = load ptr, ptr %12, align 8
  %111 = getelementptr inbounds %struct.Node, ptr %110, i32 0, i32 2
  %112 = load ptr, ptr %111, align 8
  store ptr %112, ptr %12, align 8
  br label %82, !llvm.loop !12

113:                                              ; preds = %82
  br label %114

114:                                              ; preds = %113
  %115 = load i32, ptr %8, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %8, align 4
  br label %35, !llvm.loop !13

117:                                              ; preds = %35
  %118 = load i32, ptr %4, align 4
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %118)
  store i32 0, ptr %14, align 4
  br label %120

120:                                              ; preds = %143, %117
  %121 = load i32, ptr %14, align 4
  %122 = load ptr, ptr %3, align 8
  %123 = getelementptr inbounds %struct.Graph, ptr %122, i32 0, i32 0
  %124 = load i32, ptr %123, align 8
  %125 = icmp slt i32 %121, %124
  br i1 %125, label %126, label %146

126:                                              ; preds = %120
  %127 = load i32, ptr %14, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %128
  %130 = load i32, ptr %129, align 4
  %131 = icmp eq i32 %130, 99999
  br i1 %131, label %132, label %135

132:                                              ; preds = %126
  %133 = load i32, ptr %14, align 4
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %133)
  br label %142

135:                                              ; preds = %126
  %136 = load i32, ptr %14, align 4
  %137 = load i32, ptr %14, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %138
  %140 = load i32, ptr %139, align 4
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %136, i32 noundef %140)
  br label %142

142:                                              ; preds = %135, %132
  br label %143

143:                                              ; preds = %142
  %144 = load i32, ptr %14, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %14, align 4
  br label %120, !llvm.loop !14

146:                                              ; preds = %120
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store i32 5, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = call ptr @createGraph(i32 noundef %7)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %9, i32 noundef 0, i32 noundef 1, i32 noundef 10)
  %10 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %10, i32 noundef 0, i32 noundef 2, i32 noundef 3)
  %11 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %11, i32 noundef 1, i32 noundef 2, i32 noundef 1)
  %12 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %12, i32 noundef 1, i32 noundef 3, i32 noundef 2)
  %13 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %13, i32 noundef 2, i32 noundef 1, i32 noundef 4)
  %14 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %14, i32 noundef 2, i32 noundef 3, i32 noundef 8)
  %15 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %15, i32 noundef 2, i32 noundef 4, i32 noundef 2)
  %16 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %16, i32 noundef 3, i32 noundef 4, i32 noundef 7)
  %17 = load ptr, ptr %3, align 8
  call void @addEdge(ptr noundef %17, i32 noundef 4, i32 noundef 3, i32 noundef 9)
  %18 = load ptr, ptr %3, align 8
  call void @printGraph(ptr noundef %18)
  %19 = load ptr, ptr %3, align 8
  call void @dijkstra(ptr noundef %19, i32 noundef 0)
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %41, %0
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %44

24:                                               ; preds = %20
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.Graph, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %4, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x ptr], ptr %26, i64 0, i64 %28
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %5, align 8
  br label %31

31:                                               ; preds = %34, %24
  %32 = load ptr, ptr %5, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %34, label %40

34:                                               ; preds = %31
  %35 = load ptr, ptr %5, align 8
  store ptr %35, ptr %6, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.Node, ptr %36, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %5, align 8
  %39 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %39) #5
  br label %31, !llvm.loop !15

40:                                               ; preds = %31
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %4, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %4, align 4
  br label %20, !llvm.loop !16

44:                                               ; preds = %20
  %45 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %45) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
