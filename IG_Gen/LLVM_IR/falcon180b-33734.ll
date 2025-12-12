; ModuleID = 'DATASETv2/falcon180b-33734.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_tag(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load i32, ptr @num_tags, align 4
  %6 = icmp sge i32 %5, 100
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %24

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = call noalias ptr @strdup(ptr noundef %10) #3
  %12 = load i32, ptr @num_tags, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Tag, ptr %14, i32 0, i32 0
  store ptr %11, ptr %15, align 16
  %16 = load ptr, ptr %4, align 8
  %17 = call noalias ptr @strdup(ptr noundef %16) #3
  %18 = load i32, ptr @num_tags, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Tag, ptr %20, i32 0, i32 1
  store ptr %17, ptr %21, align 8
  %22 = load i32, ptr @num_tags, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr @num_tags, align 4
  br label %24

24:                                               ; preds = %9, %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_tags() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @num_tags, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %21

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Tag, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 16
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.Tag], ptr @tags, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Tag, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %11, ptr noundef %16)
  br label %18

18:                                               ; preds = %6
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %2, !llvm.loop !6

21:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [1024 x i8], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %6 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  store ptr %6, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 1, ptr %1, align 4
  br label %36

11:                                               ; preds = %0
  br label %12

12:                                               ; preds = %30, %11
  %13 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %14 = load ptr, ptr %2, align 8
  %15 = call ptr @fgets(ptr noundef %13, i32 noundef 1024, ptr noundef %14)
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %33

17:                                               ; preds = %12
  %18 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %19 = call ptr @strtok(ptr noundef %18, ptr noundef @.str.5) #3
  store ptr %19, ptr %4, align 8
  %20 = call ptr @strtok(ptr noundef null, ptr noundef @.str.5) #3
  store ptr %20, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %26, label %23

23:                                               ; preds = %17
  %24 = load ptr, ptr %5, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %30

26:                                               ; preds = %23, %17
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %28 = load ptr, ptr %2, align 8
  %29 = call i32 @fclose(ptr noundef %28)
  store i32 1, ptr %1, align 4
  br label %36

30:                                               ; preds = %23
  %31 = load ptr, ptr %4, align 8
  %32 = load ptr, ptr %5, align 8
  call void @add_tag(ptr noundef %31, ptr noundef %32)
  br label %12, !llvm.loop !8

33:                                               ; preds = %12
  %34 = load ptr, ptr %2, align 8
  %35 = call i32 @fclose(ptr noundef %34)
  call void @print_tags()
  store i32 0, ptr %1, align 4
  br label %36

36:                                               ; preds = %33, %26, %9
  %37 = load i32, ptr %1, align 4
  ret i32 %37
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
