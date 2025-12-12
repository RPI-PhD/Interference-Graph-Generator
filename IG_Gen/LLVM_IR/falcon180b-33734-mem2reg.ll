; ModuleID = 'LLVM_IR/falcon180b-33734.ll'
source_filename = "DATASETv2/falcon180b-33734.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Tag = type { ptr, ptr }

@num_tags = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [40 x i8] c"Error: Maximum number of tags reached.\0A\00", align 1
@tags = dso_local global [100 x %struct.Tag] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"metadata.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Error: Could not open metadata file.\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"Error: Invalid metadata format.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_tag(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @num_tags, align 4
  %4 = icmp sge i32 %3, 100
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %20

7:                                                ; preds = %2
  %8 = call noalias ptr @strdup(ptr noundef %0) #3
  %9 = load i32, ptr @num_tags, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Tag, ptr %11, i32 0, i32 0
  store ptr %8, ptr %12, align 16
  %13 = call noalias ptr @strdup(ptr noundef %1) #3
  %14 = load i32, ptr @num_tags, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Tag, ptr %16, i32 0, i32 1
  store ptr %13, ptr %17, align 8
  %18 = load i32, ptr @num_tags, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr @num_tags, align 4
  br label %20

20:                                               ; preds = %7, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_tags() #0 {
  br label %1

1:                                                ; preds = %14, %0
  %.0 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = load i32, ptr @num_tags, align 4
  %3 = icmp slt i32 %.0, %2
  br i1 %3, label %4, label %16

4:                                                ; preds = %1
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %5
  %7 = getelementptr inbounds %struct.Tag, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 16
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Tag, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %8, ptr noundef %12)
  br label %14

14:                                               ; preds = %4
  %15 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !6

16:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %24

6:                                                ; preds = %0
  br label %7

7:                                                ; preds = %21, %6
  %8 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %9 = call ptr @fgets(ptr noundef %8, i32 noundef 1024, ptr noundef %2)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %13 = call ptr @strtok(ptr noundef %12, ptr noundef @.str.5) #3
  %14 = call ptr @strtok(ptr noundef null, ptr noundef @.str.5) #3
  %15 = icmp eq ptr %13, null
  br i1 %15, label %18, label %16

16:                                               ; preds = %11
  %17 = icmp eq ptr %14, null
  br i1 %17, label %18, label %21

18:                                               ; preds = %16, %11
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %20 = call i32 @fclose(ptr noundef %2)
  br label %24

21:                                               ; preds = %16
  call void @add_tag(ptr noundef %13, ptr noundef %14)
  br label %7, !llvm.loop !8

22:                                               ; preds = %7
  %23 = call i32 @fclose(ptr noundef %2)
  call void @print_tags()
  br label %24

24:                                               ; preds = %22, %18, %4
  %.0 = phi i32 [ 1, %4 ], [ 1, %18 ], [ 0, %22 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
