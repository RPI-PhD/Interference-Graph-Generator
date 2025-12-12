; ModuleID = 'LLVM_IR/falcon180b-63675.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_sentence(ptr noundef %0) #0 {
  %2 = load i32, ptr @sentence_count, align 4
  %3 = icmp sge i32 %2, 1000
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %25

6:                                                ; preds = %1
  %7 = call i64 @strlen(ptr noundef %0) #6
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %10, label %12

10:                                               ; preds = %6
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %25

12:                                               ; preds = %6
  %13 = load i32, ptr @sentence_count, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.sentence, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [1000 x i8], ptr %16, i64 0, i64 0
  %18 = call ptr @strcpy(ptr noundef %17, ptr noundef %0) #7
  %19 = load i32, ptr @sentence_count, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.sentence, ptr %21, i32 0, i32 1
  store i32 %8, ptr %22, align 4
  %23 = load i32, ptr @sentence_count, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr @sentence_count, align 4
  br label %25

25:                                               ; preds = %12, %10, %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @summarize_text() #0 {
  %1 = load i32, ptr @sentence_count, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %80

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %15, %5
  %.01 = phi i32 [ 0, %5 ], [ %16, %15 ]
  %.0 = phi i32 [ 0, %5 ], [ %14, %15 ]
  %7 = load i32, ptr @sentence_count, align 4
  %8 = icmp slt i32 %.01, %7
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.sentence, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %.0, %13
  br label %15

15:                                               ; preds = %9
  %16 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !6

17:                                               ; preds = %6
  %18 = sdiv i32 %.0, 3
  %19 = icmp slt i32 %18, 5
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  br label %21

21:                                               ; preds = %20, %17
  %.02 = phi i32 [ 5, %20 ], [ %18, %17 ]
  %22 = add nsw i32 %.02, 1
  %23 = zext i32 %22 to i64
  %24 = call ptr @llvm.stacksave.p0()
  %25 = alloca i8, i64 %23, align 16
  %26 = getelementptr inbounds i8, ptr %25, i64 0
  store i8 0, ptr %26, align 16
  br label %27

27:                                               ; preds = %76, %21
  %.05 = phi i32 [ 0, %21 ], [ %.1, %76 ]
  %.04 = phi i32 [ 0, %21 ], [ %77, %76 ]
  %28 = load i32, ptr @sentence_count, align 4
  %29 = icmp slt i32 %.04, %28
  br i1 %29, label %30, label %78

30:                                               ; preds = %27
  %31 = icmp sge i32 %.05, %.02
  br i1 %31, label %32, label %33

32:                                               ; preds = %30
  br label %78

33:                                               ; preds = %30
  br label %34

34:                                               ; preds = %73, %33
  %.1 = phi i32 [ %.05, %33 ], [ %.2, %73 ]
  %.03 = phi i32 [ 0, %33 ], [ %74, %73 ]
  %35 = sext i32 %.04 to i64
  %36 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.sentence, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = icmp slt i32 %.03, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %34
  %41 = icmp slt i32 %.1, %.02
  br label %42

42:                                               ; preds = %40, %34
  %43 = phi i1 [ false, %34 ], [ %41, %40 ]
  br i1 %43, label %44, label %75

44:                                               ; preds = %42
  %45 = call ptr @__ctype_b_loc() #8
  %46 = load ptr, ptr %45, align 8
  %47 = sext i32 %.04 to i64
  %48 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.sentence, ptr %48, i32 0, i32 0
  %50 = sext i32 %.03 to i64
  %51 = getelementptr inbounds [1000 x i8], ptr %49, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, ptr %46, i64 %54
  %56 = load i16, ptr %55, align 2
  %57 = zext i16 %56 to i32
  %58 = and i32 %57, 1024
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %73

60:                                               ; preds = %44
  %61 = sext i32 %.04 to i64
  %62 = getelementptr inbounds [1000 x %struct.sentence], ptr @sentences, i64 0, i64 %61
  %63 = getelementptr inbounds %struct.sentence, ptr %62, i32 0, i32 0
  %64 = sext i32 %.03 to i64
  %65 = getelementptr inbounds [1000 x i8], ptr %63, i64 0, i64 %64
  %66 = load i8, ptr %65, align 1
  %67 = sext i8 %66 to i32
  %68 = call i32 @tolower(i32 noundef %67) #6
  %69 = trunc i32 %68 to i8
  %70 = add nsw i32 %.1, 1
  %71 = sext i32 %.1 to i64
  %72 = getelementptr inbounds i8, ptr %25, i64 %71
  store i8 %69, ptr %72, align 1
  br label %73

73:                                               ; preds = %60, %44
  %.2 = phi i32 [ %70, %60 ], [ %.1, %44 ]
  %74 = add nsw i32 %.03, 1
  br label %34, !llvm.loop !8

75:                                               ; preds = %42
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.04, 1
  br label %27, !llvm.loop !9

78:                                               ; preds = %32, %27
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %25)
  call void @llvm.stackrestore.p0(ptr %24)
  br label %80

80:                                               ; preds = %78, %3
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i8], align 16
  br label %2

2:                                                ; preds = %16, %0
  %3 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %3, i32 noundef 1000, ptr noundef %4)
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %17

7:                                                ; preds = %2
  %8 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %9 = call i64 @strcspn(ptr noundef %8, ptr noundef @.str.4) #6
  %10 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  %11 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %12 = call i64 @strlen(ptr noundef %11) #6
  %13 = icmp ugt i64 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %7
  %15 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  call void @add_sentence(ptr noundef %15)
  br label %16

16:                                               ; preds = %14, %7
  br label %2, !llvm.loop !10

17:                                               ; preds = %2
  call void @summarize_text()
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
