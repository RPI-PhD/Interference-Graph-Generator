; ModuleID = 'LLVM_IR/gemini_pro-138.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_node(i8 noundef signext %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 24) #6
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0
  store i8 %0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  store i32 %1, ptr %5, align 4
  %6 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 2
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 3
  store ptr null, ptr %7, align 8
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @insert_node(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  store ptr %1, ptr %0, align 8
  br label %19

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = load ptr, ptr %0, align 8
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %16

13:                                               ; preds = %6
  %14 = load ptr, ptr %0, align 8
  %15 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 2
  call void @insert_node(ptr noundef %15, ptr noundef %1)
  br label %19

16:                                               ; preds = %6
  %17 = load ptr, ptr %0, align 8
  %18 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 3
  call void @insert_node(ptr noundef %18, ptr noundef %1)
  br label %19

19:                                               ; preds = %16, %13, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @build_tree(ptr noundef %0) #0 {
  %2 = alloca [256 x i32], align 16
  %3 = alloca ptr, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 1024, i1 false)
  br label %4

4:                                                ; preds = %16, %1
  %.01 = phi i32 [ 0, %1 ], [ %17, %16 ]
  %5 = sext i32 %.01 to i64
  %6 = call i64 @strlen(ptr noundef %0) #7
  %7 = icmp ult i64 %5, %6
  br i1 %7, label %8, label %18

8:                                                ; preds = %4
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds i8, ptr %0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i64
  %13 = getelementptr inbounds [256 x i32], ptr %2, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %13, align 4
  br label %16

16:                                               ; preds = %8
  %17 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

18:                                               ; preds = %4
  store ptr null, ptr %3, align 8
  br label %19

19:                                               ; preds = %33, %18
  %.0 = phi i32 [ 0, %18 ], [ %34, %33 ]
  %20 = icmp slt i32 %.0, 256
  br i1 %20, label %21, label %35

21:                                               ; preds = %19
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [256 x i32], ptr %2, i64 0, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %32

26:                                               ; preds = %21
  %27 = trunc i32 %.0 to i8
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [256 x i32], ptr %2, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = call ptr @create_node(i8 noundef signext %27, i32 noundef %30)
  call void @insert_node(ptr noundef %3, ptr noundef %31)
  br label %32

32:                                               ; preds = %26, %21
  br label %33

33:                                               ; preds = %32
  %34 = add nsw i32 %.0, 1
  br label %19, !llvm.loop !8

35:                                               ; preds = %19
  %36 = load ptr, ptr %3, align 8
  ret ptr %36
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_code(ptr noundef %0, ptr noundef %1) #0 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  br label %22

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %7 = load i8, ptr %6, align 8
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %5
  %11 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %12 = load i8, ptr %11, align 8
  %13 = sext i8 %12 to i32
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13, ptr noundef %1)
  br label %15

15:                                               ; preds = %10, %5
  %16 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = call ptr @strcat(ptr noundef %1, ptr noundef @.str.1) #8
  call void @print_code(ptr noundef %17, ptr noundef %18)
  %19 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  %21 = call ptr @strcat(ptr noundef %1, ptr noundef @.str.2) #8
  call void @print_code(ptr noundef %20, ptr noundef %21)
  br label %22

22:                                               ; preds = %15, %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @encode(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %37, %2
  %.03 = phi i32 [ 0, %2 ], [ %38, %37 ]
  %.02 = phi i32 [ 0, %2 ], [ %36, %37 ]
  %4 = sext i32 %.03 to i64
  %5 = call i64 @strlen(ptr noundef %1) #7
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %39

7:                                                ; preds = %3
  br label %8

8:                                                ; preds = %32, %7
  %.04 = phi ptr [ %0, %7 ], [ %.15, %32 ]
  %9 = getelementptr inbounds %struct.node, ptr %.04, i32 0, i32 0
  %10 = load i8, ptr %9, align 8
  %11 = sext i8 %10 to i32
  %12 = sext i32 %.03 to i64
  %13 = getelementptr inbounds i8, ptr %1, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %11, %15
  br i1 %16, label %17, label %33

17:                                               ; preds = %8
  %18 = sext i32 %.03 to i64
  %19 = getelementptr inbounds i8, ptr %1, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = getelementptr inbounds %struct.node, ptr %.04, i32 0, i32 0
  %23 = load i8, ptr %22, align 8
  %24 = sext i8 %23 to i32
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %29

26:                                               ; preds = %17
  %27 = getelementptr inbounds %struct.node, ptr %.04, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  br label %32

29:                                               ; preds = %17
  %30 = getelementptr inbounds %struct.node, ptr %.04, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  br label %32

32:                                               ; preds = %29, %26
  %.15 = phi ptr [ %28, %26 ], [ %31, %29 ]
  br label %8, !llvm.loop !9

33:                                               ; preds = %8
  %34 = getelementptr inbounds %struct.node, ptr %.04, i32 0, i32 1
  %35 = load i32, ptr %34, align 4
  %36 = add nsw i32 %.02, %35
  br label %37

37:                                               ; preds = %33
  %38 = add nsw i32 %.03, 1
  br label %3, !llvm.loop !10

39:                                               ; preds = %3
  %40 = add nsw i32 %.02, 1
  %41 = sext i32 %40 to i64
  %42 = call noalias ptr @malloc(i64 noundef %41) #6
  %43 = sext i32 %.02 to i64
  %44 = getelementptr inbounds i8, ptr %42, i64 %43
  store i8 0, ptr %44, align 1
  br label %45

45:                                               ; preds = %82, %39
  %.06 = phi i32 [ 0, %39 ], [ %.17, %82 ]
  %.01 = phi i32 [ 0, %39 ], [ %83, %82 ]
  %46 = sext i32 %.01 to i64
  %47 = call i64 @strlen(ptr noundef %1) #7
  %48 = icmp ult i64 %46, %47
  br i1 %48, label %49, label %84

49:                                               ; preds = %45
  br label %50

50:                                               ; preds = %80, %49
  %.17 = phi i32 [ %.06, %49 ], [ %.2, %80 ]
  %.0 = phi ptr [ %0, %49 ], [ %.1, %80 ]
  %51 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %52 = load i8, ptr %51, align 8
  %53 = sext i8 %52 to i32
  %54 = sext i32 %.01 to i64
  %55 = getelementptr inbounds i8, ptr %1, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp ne i32 %53, %57
  br i1 %58, label %59, label %81

59:                                               ; preds = %50
  %60 = sext i32 %.01 to i64
  %61 = getelementptr inbounds i8, ptr %1, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %65 = load i8, ptr %64, align 8
  %66 = sext i8 %65 to i32
  %67 = icmp slt i32 %63, %66
  br i1 %67, label %68, label %74

68:                                               ; preds = %59
  %69 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  %70 = load ptr, ptr %69, align 8
  %71 = add nsw i32 %.17, 1
  %72 = sext i32 %.17 to i64
  %73 = getelementptr inbounds i8, ptr %42, i64 %72
  store i8 48, ptr %73, align 1
  br label %80

74:                                               ; preds = %59
  %75 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 3
  %76 = load ptr, ptr %75, align 8
  %77 = add nsw i32 %.17, 1
  %78 = sext i32 %.17 to i64
  %79 = getelementptr inbounds i8, ptr %42, i64 %78
  store i8 49, ptr %79, align 1
  br label %80

80:                                               ; preds = %74, %68
  %.2 = phi i32 [ %71, %68 ], [ %77, %74 ]
  %.1 = phi ptr [ %70, %68 ], [ %76, %74 ]
  br label %50, !llvm.loop !11

81:                                               ; preds = %50
  br label %82

82:                                               ; preds = %81
  %83 = add nsw i32 %.01, 1
  br label %45, !llvm.loop !12

84:                                               ; preds = %45
  ret ptr %42
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @decode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %1) #7
  %4 = trunc i64 %3 to i32
  %5 = add nsw i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = call noalias ptr @malloc(i64 noundef %6) #6
  %8 = sext i32 %4 to i64
  %9 = getelementptr inbounds i8, ptr %7, i64 %8
  store i8 0, ptr %9, align 1
  br label %10

10:                                               ; preds = %36, %2
  %.02 = phi i32 [ 0, %2 ], [ %.13, %36 ]
  %.01 = phi ptr [ %0, %2 ], [ %.2, %36 ]
  %.0 = phi i32 [ 0, %2 ], [ %37, %36 ]
  %11 = icmp slt i32 %.0, %4
  br i1 %11, label %12, label %38

12:                                               ; preds = %10
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i8, ptr %1, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 48
  br i1 %17, label %18, label %21

18:                                               ; preds = %12
  %19 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  br label %24

21:                                               ; preds = %12
  %22 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  br label %24

24:                                               ; preds = %21, %18
  %.1 = phi ptr [ %20, %18 ], [ %23, %21 ]
  %25 = getelementptr inbounds %struct.node, ptr %.1, i32 0, i32 0
  %26 = load i8, ptr %25, align 8
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %24
  %30 = getelementptr inbounds %struct.node, ptr %.1, i32 0, i32 0
  %31 = load i8, ptr %30, align 8
  %32 = add nsw i32 %.02, 1
  %33 = sext i32 %.02 to i64
  %34 = getelementptr inbounds i8, ptr %7, i64 %33
  store i8 %31, ptr %34, align 1
  br label %35

35:                                               ; preds = %29, %24
  %.13 = phi i32 [ %32, %29 ], [ %.02, %24 ]
  %.2 = phi ptr [ %0, %29 ], [ %.1, %24 ]
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !13

38:                                               ; preds = %10
  ret ptr %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @build_tree(ptr noundef @.str.3)
  call void @print_code(ptr noundef %1, ptr noundef @.str.4)
  %2 = call ptr @encode(ptr noundef %1, ptr noundef @.str.3)
  %3 = call ptr @decode(ptr noundef %1, ptr noundef %2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef @.str.3)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %2)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %3)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
