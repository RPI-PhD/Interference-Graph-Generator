; ModuleID = 'DATASETv2/falcon180b-63675.c'
source_filename = "DATASETv2/falcon180b-63675.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sentence = type { [1000 x i8], i32 }

@sentence_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [39 x i8] c"Error: maximum sentence limit reached\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Error: sentence too short\0A\00", align 1
@sentences = dso_local global [1000 x %struct.sentence] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [28 x i8] c"No sentences found in text\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Summary:\0A%s\0A\00", align 1
@stdin = external global ptr, align 8
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_sentence(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load i32, ptr @sentence_count, align 4
  %5 = icmp sge i32 %4, 1000
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %31

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = call i64 @strlen(ptr noundef %9) #6
  %11 = trunc i64 %10 to i32
  store i32 %11, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %16

14:                                               ; preds = %8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %31

16:                                               ; preds = %8
  %17 = load i32, ptr @sentence_count, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.sentence, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [1000 x i8], ptr %20, i64 0, i64 0
  %22 = load ptr, ptr %2, align 8
  %23 = call ptr @strcpy(ptr noundef %21, ptr noundef %22) #7
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr @sentence_count, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.sentence, ptr %27, i32 0, i32 1
  store i32 %24, ptr %28, align 4
  %29 = load i32, ptr @sentence_count, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr @sentence_count, align 4
  br label %31

31:                                               ; preds = %16, %14, %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @summarize_text() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = load i32, ptr @sentence_count, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %110

13:                                               ; preds = %0
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %14

14:                                               ; preds = %26, %13
  %15 = load i32, ptr %2, align 4
  %16 = load i32, ptr @sentence_count, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %29

18:                                               ; preds = %14
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.sentence, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %1, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %1, align 4
  br label %26

26:                                               ; preds = %18
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %2, align 4
  br label %14, !llvm.loop !6

29:                                               ; preds = %14
  %30 = load i32, ptr %1, align 4
  %31 = sdiv i32 %30, 3
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %3, align 4
  %33 = icmp slt i32 %32, 5
  br i1 %33, label %34, label %35

34:                                               ; preds = %29
  store i32 5, ptr %3, align 4
  br label %35

35:                                               ; preds = %34, %29
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  %38 = zext i32 %37 to i64
  %39 = call ptr @llvm.stacksave.p0()
  store ptr %39, ptr %4, align 8
  %40 = alloca i8, i64 %38, align 16
  store i64 %38, ptr %5, align 8
  %41 = getelementptr inbounds i8, ptr %40, i64 0
  store i8 0, ptr %41, align 16
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %42

42:                                               ; preds = %104, %35
  %43 = load i32, ptr %7, align 4
  %44 = load i32, ptr @sentence_count, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %107

46:                                               ; preds = %42
  %47 = load i32, ptr %6, align 4
  %48 = load i32, ptr %3, align 4
  %49 = icmp sge i32 %47, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %46
  br label %107

51:                                               ; preds = %46
  store i32 0, ptr %8, align 4
  br label %52

52:                                               ; preds = %100, %51
  %53 = load i32, ptr %8, align 4
  %54 = load i32, ptr %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.sentence, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = icmp slt i32 %53, %58
  br i1 %59, label %60, label %64

60:                                               ; preds = %52
  %61 = load i32, ptr %6, align 4
  %62 = load i32, ptr %3, align 4
  %63 = icmp slt i32 %61, %62
  br label %64

64:                                               ; preds = %60, %52
  %65 = phi i1 [ false, %52 ], [ %63, %60 ]
  br i1 %65, label %66, label %103

66:                                               ; preds = %64
  %67 = call ptr @__ctype_b_loc() #8
  %68 = load ptr, ptr %67, align 8
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %70
  %72 = getelementptr inbounds %struct.sentence, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %8, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [1000 x i8], ptr %72, i64 0, i64 %74
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i16, ptr %68, i64 %78
  %80 = load i16, ptr %79, align 2
  %81 = zext i16 %80 to i32
  %82 = and i32 %81, 1024
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %100

84:                                               ; preds = %66
  %85 = load i32, ptr %7, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %86
  %88 = getelementptr inbounds %struct.sentence, ptr %87, i32 0, i32 0
  %89 = load i32, ptr %8, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [1000 x i8], ptr %88, i64 0, i64 %90
  %92 = load i8, ptr %91, align 1
  %93 = sext i8 %92 to i32
  %94 = call i32 @tolower(i32 noundef %93) #6
  %95 = trunc i32 %94 to i8
  %96 = load i32, ptr %6, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %6, align 4
  %98 = sext i32 %96 to i64
  %99 = getelementptr inbounds i8, ptr %40, i64 %98
  store i8 %95, ptr %99, align 1
  br label %100

100:                                              ; preds = %84, %66
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %8, align 4
  br label %52, !llvm.loop !8

103:                                              ; preds = %64
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %7, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %7, align 4
  br label %42, !llvm.loop !9

107:                                              ; preds = %50, %42
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %40)
  %109 = load ptr, ptr %4, align 8
  call void @llvm.stackrestore.p0(ptr %109)
  br label %110

110:                                              ; preds = %107, %11
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #4

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #5

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %17, %0
  %4 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 1000, ptr noundef %5)
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %18

8:                                                ; preds = %3
  %9 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %10 = call i64 @strcspn(ptr noundef %9, ptr noundef @.str.4) #6
  %11 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %10
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %13 = call i64 @strlen(ptr noundef %12) #6
  %14 = icmp ugt i64 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %8
  %16 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  call void @add_sentence(ptr noundef %16)
  br label %17

17:                                               ; preds = %15, %8
  br label %3, !llvm.loop !10

18:                                               ; preds = %3
  call void @summarize_text()
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(none) }

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
