; ModuleID = 'DATASETv2/mistral_7b-258.ll'
source_filename = "DATASETv2/mistral_7b-258.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Dictionary = type { [20 x i8], [20 x i8] }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [40 x i8] c"Error: Unable to open dictionary file.\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"dictionary.txt\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Enter English sentence: \00", align 1
@stdin = external global ptr, align 8
@.str.5 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @loadDictionary(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [20 x i8], align 16
  %4 = alloca [20 x i8], align 16
  %5 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %2
  %8 = load ptr, ptr @stderr, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #5
  unreachable

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %47, %10
  %.01 = phi i32 [ 0, %10 ], [ %48, %47 ]
  %12 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %13 = call ptr @fgets(ptr noundef %12, i32 noundef 20, ptr noundef %5)
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = icmp slt i32 %.01, 100
  br label %17

17:                                               ; preds = %15, %11
  %18 = phi i1 [ false, %11 ], [ %16, %15 ]
  br i1 %18, label %19, label %49

19:                                               ; preds = %17
  %20 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds %struct.Dictionary, ptr %0, i64 %21
  %23 = getelementptr inbounds %struct.Dictionary, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [20 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %26 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %20, ptr noundef @.str.2, ptr noundef %24, ptr noundef %25) #6
  br label %27

27:                                               ; preds = %45, %19
  %.0 = phi i32 [ 0, %19 ], [ %46, %45 ]
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %30 = call i64 @strlen(ptr noundef %29) #7
  %31 = icmp ult i64 %28, %30
  br i1 %31, label %32, label %47

32:                                               ; preds = %27
  %33 = sext i32 %.0 to i64
  %34 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %33
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = add nsw i32 %36, 65
  %38 = sub nsw i32 %37, 65
  %39 = trunc i32 %38 to i8
  %40 = sext i32 %.01 to i64
  %41 = getelementptr inbounds %struct.Dictionary, ptr %0, i64 %40
  %42 = getelementptr inbounds %struct.Dictionary, ptr %41, i32 0, i32 1
  %43 = sext i32 %.0 to i64
  %44 = getelementptr inbounds [20 x i8], ptr %42, i64 0, i64 %43
  store i8 %39, ptr %44, align 1
  br label %45

45:                                               ; preds = %32
  %46 = add nsw i32 %.0, 1
  br label %27, !llvm.loop !6

47:                                               ; preds = %27
  %48 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !8

49:                                               ; preds = %17
  %50 = call i32 @fclose(ptr noundef %5)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x %struct.Dictionary], align 16
  %2 = alloca [20 x i8], align 16
  %3 = getelementptr inbounds [100 x %struct.Dictionary], ptr %1, i64 0, i64 0
  call void @loadDictionary(ptr noundef %3, ptr noundef @.str.3)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %5 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 20, ptr noundef %6)
  %8 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %9 = call ptr @strtok(ptr noundef %8, ptr noundef @.str.5) #6
  br label %10

10:                                               ; preds = %45, %0
  %.01 = phi ptr [ %9, %0 ], [ %46, %45 ]
  %11 = icmp ne ptr %.01, null
  br i1 %11, label %12, label %47

12:                                               ; preds = %10
  br label %13

13:                                               ; preds = %43, %12
  %.02 = phi i32 [ 0, %12 ], [ %44, %43 ]
  %14 = icmp slt i32 %.02, 100
  br i1 %14, label %15, label %45

15:                                               ; preds = %13
  %16 = sext i32 %.02 to i64
  %17 = getelementptr inbounds [100 x %struct.Dictionary], ptr %1, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Dictionary, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 @strcmp(ptr noundef %.01, ptr noundef %19) #7
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %42

22:                                               ; preds = %15
  br label %23

23:                                               ; preds = %38, %22
  %.0 = phi i32 [ 0, %22 ], [ %39, %38 ]
  %24 = sext i32 %.0 to i64
  %25 = call i64 @strlen(ptr noundef %.01) #7
  %26 = icmp ult i64 %24, %25
  br i1 %26, label %27, label %40

27:                                               ; preds = %23
  %28 = sext i32 %.02 to i64
  %29 = getelementptr inbounds [100 x %struct.Dictionary], ptr %1, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Dictionary, ptr %29, i32 0, i32 1
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds [20 x i8], ptr %30, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = add nsw i32 %34, 65
  %36 = sub nsw i32 %35, 65
  %37 = call i32 @putchar(i32 noundef %36)
  br label %38

38:                                               ; preds = %27
  %39 = add nsw i32 %.0, 1
  br label %23, !llvm.loop !9

40:                                               ; preds = %23
  %41 = call i32 @putchar(i32 noundef 32)
  br label %45

42:                                               ; preds = %15
  br label %43

43:                                               ; preds = %42
  %44 = add nsw i32 %.02, 1
  br label %13, !llvm.loop !10

45:                                               ; preds = %40, %13
  %46 = call ptr @strtok(ptr noundef null, ptr noundef @.str.5) #6
  br label %10, !llvm.loop !11

47:                                               ; preds = %10
  %48 = call i32 @putchar(i32 noundef 10)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

declare i32 @putchar(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }

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
