; ModuleID = 'DATASETv2/falcon180b-60071.c'
source_filename = "DATASETv2/falcon180b-60071.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.token_t = type { ptr, i32 }

@.str = private unnamed_addr constant [24 x i8] c"Error: Too many tokens\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"%s (%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"input.html\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"Error: Could not open input file\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_token(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %6, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sge i32 %10, 1000
  br i1 %11, label %12, label %14

12:                                               ; preds = %4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #6
  unreachable

14:                                               ; preds = %4
  %15 = load i32, ptr %8, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = call noalias ptr @malloc(i64 noundef %17) #7
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = load i32, ptr %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.token_t, ptr %19, i64 %22
  %24 = getelementptr inbounds %struct.token_t, ptr %23, i32 0, i32 0
  store ptr %18, ptr %24, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %26, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.token_t, ptr %25, i64 %28
  %30 = getelementptr inbounds %struct.token_t, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load i32, ptr %8, align 4
  %34 = sext i32 %33 to i64
  %35 = call ptr @strncpy(ptr noundef %31, ptr noundef %32, i64 noundef %34) #8
  %36 = load i32, ptr %8, align 4
  %37 = load ptr, ptr %5, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = load i32, ptr %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.token_t, ptr %37, i64 %40
  %42 = getelementptr inbounds %struct.token_t, ptr %41, i32 0, i32 1
  store i32 %36, ptr %42, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %43, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_tokens(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %24, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.token_t, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.token_t, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.token_t, ptr %17, i64 %19
  %21 = getelementptr inbounds %struct.token_t, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %16, i32 noundef %22)
  br label %24

24:                                               ; preds = %10
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %6, !llvm.loop !6

27:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1000 x %struct.token_t], align 16
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %10 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #6
  unreachable

15:                                               ; preds = %0
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %127, %15
  %17 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  %21 = load i32, ptr %4, align 4
  %22 = sub nsw i32 100, %21
  %23 = load ptr, ptr %2, align 8
  %24 = call ptr @fgets(ptr noundef %20, i32 noundef %22, ptr noundef %23)
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %128

26:                                               ; preds = %16
  %27 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %28 = call i64 @strlen(ptr noundef %27) #9
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = add i64 %30, %28
  %32 = trunc i64 %31 to i32
  store i32 %32, ptr %4, align 4
  %33 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  store ptr %33, ptr %7, align 8
  br label %34

34:                                               ; preds = %126, %26
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %37 = load i32, ptr %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, ptr %36, i64 %38
  %40 = icmp ult ptr %35, %39
  br i1 %40, label %41, label %127

41:                                               ; preds = %34
  %42 = load ptr, ptr %7, align 8
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 60
  br i1 %45, label %46, label %84

46:                                               ; preds = %41
  %47 = load ptr, ptr %7, align 8
  store ptr %47, ptr %8, align 8
  br label %48

48:                                               ; preds = %62, %46
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %51 = load i32, ptr %4, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %50, i64 %52
  %54 = icmp ult ptr %49, %53
  br i1 %54, label %55, label %60

55:                                               ; preds = %48
  %56 = load ptr, ptr %8, align 8
  %57 = load i8, ptr %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 62
  br label %60

60:                                               ; preds = %55, %48
  %61 = phi i1 [ false, %48 ], [ %59, %55 ]
  br i1 %61, label %62, label %65

62:                                               ; preds = %60
  %63 = load ptr, ptr %8, align 8
  %64 = getelementptr inbounds i8, ptr %63, i32 1
  store ptr %64, ptr %8, align 8
  br label %48, !llvm.loop !8

65:                                               ; preds = %60
  %66 = load ptr, ptr %8, align 8
  %67 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %68 = load i32, ptr %4, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, ptr %67, i64 %69
  %71 = icmp ult ptr %66, %70
  br i1 %71, label %72, label %81

72:                                               ; preds = %65
  %73 = load ptr, ptr %8, align 8
  store i8 0, ptr %73, align 1
  %74 = getelementptr inbounds [1000 x %struct.token_t], ptr %6, i64 0, i64 0
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds i8, ptr %75, i64 1
  %77 = load ptr, ptr %8, align 8
  %78 = getelementptr inbounds i8, ptr %77, i64 1
  %79 = call i64 @strlen(ptr noundef %78) #9
  %80 = trunc i64 %79 to i32
  call void @add_token(ptr noundef %74, ptr noundef %5, ptr noundef %76, i32 noundef %80)
  br label %81

81:                                               ; preds = %72, %65
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds i8, ptr %82, i64 1
  store ptr %83, ptr %7, align 8
  br label %126

84:                                               ; preds = %41
  %85 = load ptr, ptr %7, align 8
  %86 = load i8, ptr %85, align 1
  %87 = sext i8 %86 to i32
  %88 = icmp eq i32 %87, 62
  br i1 %88, label %89, label %122

89:                                               ; preds = %84
  %90 = load ptr, ptr %7, align 8
  store ptr %90, ptr %9, align 8
  br label %91

91:                                               ; preds = %103, %89
  %92 = load ptr, ptr %9, align 8
  %93 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %94 = icmp ugt ptr %92, %93
  br i1 %94, label %95, label %101

95:                                               ; preds = %91
  %96 = load ptr, ptr %9, align 8
  %97 = getelementptr inbounds i8, ptr %96, i64 -1
  %98 = load i8, ptr %97, align 1
  %99 = sext i8 %98 to i32
  %100 = icmp ne i32 %99, 60
  br label %101

101:                                              ; preds = %95, %91
  %102 = phi i1 [ false, %91 ], [ %100, %95 ]
  br i1 %102, label %103, label %106

103:                                              ; preds = %101
  %104 = load ptr, ptr %9, align 8
  %105 = getelementptr inbounds i8, ptr %104, i32 -1
  store ptr %105, ptr %9, align 8
  br label %91, !llvm.loop !9

106:                                              ; preds = %101
  %107 = load ptr, ptr %9, align 8
  %108 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %109 = icmp ugt ptr %107, %108
  br i1 %109, label %110, label %119

110:                                              ; preds = %106
  %111 = load ptr, ptr %9, align 8
  store i8 0, ptr %111, align 1
  %112 = getelementptr inbounds [1000 x %struct.token_t], ptr %6, i64 0, i64 0
  %113 = load ptr, ptr %9, align 8
  %114 = getelementptr inbounds i8, ptr %113, i64 1
  %115 = load ptr, ptr %9, align 8
  %116 = getelementptr inbounds i8, ptr %115, i64 1
  %117 = call i64 @strlen(ptr noundef %116) #9
  %118 = trunc i64 %117 to i32
  call void @add_token(ptr noundef %112, ptr noundef %5, ptr noundef %114, i32 noundef %118)
  br label %119

119:                                              ; preds = %110, %106
  %120 = load ptr, ptr %9, align 8
  %121 = getelementptr inbounds i8, ptr %120, i64 1
  store ptr %121, ptr %7, align 8
  br label %125

122:                                              ; preds = %84
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds i8, ptr %123, i32 1
  store ptr %124, ptr %7, align 8
  br label %125

125:                                              ; preds = %122, %119
  br label %126

126:                                              ; preds = %125, %81
  br label %34, !llvm.loop !10

127:                                              ; preds = %34
  br label %16, !llvm.loop !11

128:                                              ; preds = %16
  %129 = load ptr, ptr %2, align 8
  %130 = call i32 @fclose(ptr noundef %129)
  %131 = getelementptr inbounds [1000 x %struct.token_t], ptr %6, i64 0, i64 0
  %132 = load i32, ptr %5, align 4
  call void @print_tokens(ptr noundef %131, i32 noundef %132)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare i32 @fclose(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
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
