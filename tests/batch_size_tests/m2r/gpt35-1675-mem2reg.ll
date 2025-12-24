; ModuleID = 'LLVM_IR/gpt35-1675.ll'
source_filename = "DATASETv2/gpt35-1675.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"Usage: %s csv_file\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"Failed to open csv file\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\09\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1024 x i8], align 16
  %4 = alloca i32, align 4
  %5 = icmp ne i32 %0, 2
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %8)
  call void @exit(i32 noundef 1) #6
  unreachable

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str.1)
  %14 = icmp ne ptr %13, null
  br i1 %14, label %17, label %15

15:                                               ; preds = %10
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #6
  unreachable

17:                                               ; preds = %10
  br label %18

18:                                               ; preds = %22, %17
  %19 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %20 = call ptr @fgets(ptr noundef %19, i32 noundef 1024, ptr noundef %13)
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %27

22:                                               ; preds = %18
  %23 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %24 = call ptr @parse_csv_line(ptr noundef %23, ptr noundef %4)
  %25 = load i32, ptr %4, align 4
  call void @print_csv_fields(ptr noundef %24, i32 noundef %25)
  %26 = load i32, ptr %4, align 4
  call void @free_csv_fields(ptr noundef %24, i32 noundef %26)
  br label %18, !llvm.loop !6

27:                                               ; preds = %18
  %28 = call i32 @fclose(ptr noundef %13)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @parse_csv_line(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call ptr @strtok(ptr noundef %0, ptr noundef @.str.3) #7
  br label %4

4:                                                ; preds = %6, %2
  %.02 = phi ptr [ null, %2 ], [ %10, %6 ]
  %.01 = phi ptr [ %3, %2 ], [ %19, %6 ]
  %.0 = phi i32 [ 0, %2 ], [ %18, %6 ]
  %5 = icmp ne ptr %.01, null
  br i1 %5, label %6, label %20

6:                                                ; preds = %4
  %7 = add nsw i32 %.0, 1
  %8 = sext i32 %7 to i64
  %9 = mul i64 8, %8
  %10 = call ptr @realloc(ptr noundef %.02, i64 noundef %9) #8
  %11 = call noalias ptr @malloc(i64 noundef 128) #9
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds ptr, ptr %10, i64 %12
  store ptr %11, ptr %13, align 8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds ptr, ptr %10, i64 %14
  %16 = load ptr, ptr %15, align 8
  %17 = call ptr @strncpy(ptr noundef %16, ptr noundef %.01, i64 noundef 128) #7
  %18 = add nsw i32 %.0, 1
  %19 = call ptr @strtok(ptr noundef null, ptr noundef @.str.3) #7
  br label %4, !llvm.loop !8

20:                                               ; preds = %4
  store i32 %.0, ptr %1, align 4
  ret ptr %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_csv_fields(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %2
  %.0 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds ptr, ptr %0, i64 %6
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %8)
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

12:                                               ; preds = %3
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_csv_fields(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %9, %2
  %.0 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %11

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds ptr, ptr %0, i64 %6
  %8 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %8) #7
  br label %9

9:                                                ; preds = %5
  %10 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

11:                                               ; preds = %3
  call void @free(ptr noundef %0) #7
  ret void
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #4

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(1) }
attributes #9 = { nounwind allocsize(0) }

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
