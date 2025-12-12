; ModuleID = 'DATASETv2/gemini_pro-2495.c'
source_filename = "DATASETv2/gemini_pro-2495.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Document = type { ptr, i32, i32 }
%struct.Line = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c">\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @document_create() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %2, ptr %1, align 8
  %3 = call noalias ptr @malloc(i64 noundef 256) #6
  %4 = load ptr, ptr %1, align 8
  %5 = getelementptr inbounds %struct.Document, ptr %4, i32 0, i32 0
  store ptr %3, ptr %5, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds %struct.Document, ptr %6, i32 0, i32 1
  store i32 0, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds %struct.Document, ptr %8, i32 0, i32 2
  store i32 16, ptr %9, align 4
  %10 = load ptr, ptr %1, align 8
  ret ptr %10
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @document_destroy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %19, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Document, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %22

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Document, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Line, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.Line, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %18) #7
  br label %19

19:                                               ; preds = %10
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  br label %4, !llvm.loop !6

22:                                               ; preds = %4
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.Document, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %25) #7
  %26 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %26) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @document_add_line(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.Document, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Document, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = icmp eq i32 %7, %10
  br i1 %11, label %12, label %29

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.Document, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.Document, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = sext i32 %18 to i64
  %20 = mul i64 16, %19
  %21 = mul i64 %20, 2
  %22 = call ptr @realloc(ptr noundef %15, i64 noundef %21) #8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.Document, ptr %23, i32 0, i32 0
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.Document, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 4
  %28 = mul nsw i32 %27, 2
  store i32 %28, ptr %26, align 4
  br label %29

29:                                               ; preds = %12, %2
  %30 = load ptr, ptr %4, align 8
  %31 = call noalias ptr @strdup(ptr noundef %30) #7
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.Document, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.Document, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 8
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.Line, ptr %34, i64 %38
  %40 = getelementptr inbounds %struct.Line, ptr %39, i32 0, i32 0
  store ptr %31, ptr %40, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = call i64 @strlen(ptr noundef %41) #9
  %43 = trunc i64 %42 to i32
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.Document, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.Document, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %48, align 8
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.Line, ptr %46, i64 %50
  %52 = getelementptr inbounds %struct.Line, ptr %51, i32 0, i32 1
  store i32 %43, ptr %52, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = call i64 @strlen(ptr noundef %53) #9
  %55 = add i64 %54, 1
  %56 = trunc i64 %55 to i32
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds %struct.Document, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.Document, ptr %60, i32 0, i32 1
  %62 = load i32, ptr %61, align 8
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds %struct.Line, ptr %59, i64 %63
  %65 = getelementptr inbounds %struct.Line, ptr %64, i32 0, i32 2
  store i32 %56, ptr %65, align 4
  %66 = load ptr, ptr %3, align 8
  %67 = getelementptr inbounds %struct.Document, ptr %66, i32 0, i32 1
  %68 = load i32, ptr %67, align 8
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %67, align 8
  ret void
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @document_beautify(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %95, %1
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.Document, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %98

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Document, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.Line, ptr %17, i64 %19
  store ptr %20, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %21

21:                                               ; preds = %91, %14
  %22 = load i32, ptr %6, align 4
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.Line, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %94

27:                                               ; preds = %21
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.Line, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr %30, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 32
  br i1 %36, label %37, label %40

37:                                               ; preds = %27
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %90

40:                                               ; preds = %27
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.Line, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, ptr %43, i64 %45
  %47 = load i8, ptr %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 60
  br i1 %49, label %50, label %66

50:                                               ; preds = %40
  %51 = load i32, ptr %5, align 4
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %53, label %64

53:                                               ; preds = %50
  store i32 0, ptr %7, align 4
  br label %54

54:                                               ; preds = %60, %53
  %55 = load i32, ptr %7, align 4
  %56 = load i32, ptr %5, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %63

58:                                               ; preds = %54
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %60

60:                                               ; preds = %58
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %7, align 4
  br label %54, !llvm.loop !8

63:                                               ; preds = %54
  store i32 0, ptr %5, align 4
  br label %64

64:                                               ; preds = %63, %50
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %89

66:                                               ; preds = %40
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.Line, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %6, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %69, i64 %71
  %73 = load i8, ptr %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 62
  br i1 %75, label %76, label %78

76:                                               ; preds = %66
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %88

78:                                               ; preds = %66
  %79 = load ptr, ptr %4, align 8
  %80 = getelementptr inbounds %struct.Line, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = load i32, ptr %6, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, ptr %81, i64 %83
  %85 = load i8, ptr %84, align 1
  %86 = sext i8 %85 to i32
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %86)
  br label %88

88:                                               ; preds = %78, %76
  br label %89

89:                                               ; preds = %88, %64
  br label %90

90:                                               ; preds = %89, %37
  br label %91

91:                                               ; preds = %90
  %92 = load i32, ptr %6, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %6, align 4
  br label %21, !llvm.loop !9

94:                                               ; preds = %21
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %3, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %3, align 4
  br label %8, !llvm.loop !10

98:                                               ; preds = %8
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %6 = call ptr @document_create()
  store ptr %6, ptr %2, align 8
  store ptr null, ptr %3, align 8
  store i64 0, ptr %4, align 8
  br label %7

7:                                                ; preds = %11, %0
  %8 = load ptr, ptr @stdin, align 8
  %9 = call i64 @getline(ptr noundef %3, ptr noundef %4, ptr noundef %8)
  store i64 %9, ptr %5, align 8
  %10 = icmp ne i64 %9, -1
  br i1 %10, label %11, label %14

11:                                               ; preds = %7
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %3, align 8
  call void @document_add_line(ptr noundef %12, ptr noundef %13)
  br label %7, !llvm.loop !11

14:                                               ; preds = %7
  %15 = load ptr, ptr %2, align 8
  call void @document_beautify(ptr noundef %15)
  %16 = load ptr, ptr %2, align 8
  call void @document_destroy(ptr noundef %16)
  ret i32 0
}

declare i64 @getline(ptr noundef, ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(1) }
attributes #9 = { nounwind willreturn memory(read) }

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
