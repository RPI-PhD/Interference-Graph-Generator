; ModuleID = 'LLVM_IR/llama2-13B-3810.ll'
source_filename = "DATASETv2/llama2-13B-3810.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.record = type { [20 x i8], [3 x i8], [5 x i8] }

@.str = private unnamed_addr constant [8 x i8] c"Person \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Male\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Female\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Alice\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Found record: %s %d %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"Record not found\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"25\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @insert_records(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %31, %2
  %.0 = phi i32 [ 0, %2 ], [ %32, %31 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %33

5:                                                ; preds = %3
  %6 = call i64 @time(ptr noundef null) #5
  %7 = trunc i64 %6 to i32
  call void @srand(i32 noundef %7) #5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.record, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.record, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @strcpy(ptr noundef %11, ptr noundef @.str) #5
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds %struct.record, ptr %0, i64 %13
  %15 = getelementptr inbounds %struct.record, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [3 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 @rand() #5
  %18 = srem i32 %17, 100
  %19 = add nsw i32 %18, 1
  %20 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %16, ptr noundef @.str.1, i32 noundef %19) #5
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds %struct.record, ptr %0, i64 %21
  %23 = getelementptr inbounds %struct.record, ptr %22, i32 0, i32 2
  %24 = getelementptr inbounds [5 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 @rand() #5
  %26 = srem i32 %25, 2
  %27 = icmp ne i32 %26, 0
  %28 = zext i1 %27 to i64
  %29 = select i1 %27, ptr @.str.2, ptr @.str.3
  %30 = call ptr @strcpy(ptr noundef %24, ptr noundef %29) #5
  br label %31

31:                                               ; preds = %5
  %32 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

33:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @search_records(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %17, %3
  %.01 = phi i32 [ 0, %3 ], [ %18, %17 ]
  %5 = icmp slt i32 %.01, %1
  br i1 %5, label %6, label %19

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds %struct.record, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.record, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %2) #6
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %6
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds %struct.record, ptr %0, i64 %14
  br label %20

16:                                               ; preds = %6
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

19:                                               ; preds = %4
  br label %20

20:                                               ; preds = %19, %13
  %.0 = phi ptr [ %15, %13 ], [ null, %19 ]
  ret ptr %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_records(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  br label %5

5:                                                ; preds = %21, %4
  %.0 = phi i32 [ 0, %4 ], [ %22, %21 ]
  %6 = icmp slt i32 %.0, %1
  br i1 %6, label %7, label %23

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.record, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.record, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef %2) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %20

14:                                               ; preds = %7
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.record, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.record, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 0
  %19 = call ptr @strcpy(ptr noundef %18, ptr noundef %3) #5
  br label %23

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !9

23:                                               ; preds = %14, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @delete_records(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %42, %3
  %.0 = phi i32 [ 0, %3 ], [ %43, %42 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %44

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.record, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.record, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %2) #6
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %41

13:                                               ; preds = %6
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds %struct.record, ptr %0, i64 %14
  %16 = getelementptr inbounds %struct.record, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [20 x i8], ptr %16, i64 0, i64 0
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds %struct.record, ptr %0, i64 %18
  %20 = getelementptr inbounds %struct.record, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [20 x i8], ptr %20, i64 0, i64 0
  %22 = call i64 @strlen(ptr noundef %21) #6
  call void @llvm.memset.p0.i64(ptr align 1 %17, i8 0, i64 %22, i1 false)
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds %struct.record, ptr %0, i64 %23
  %25 = getelementptr inbounds %struct.record, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds [3 x i8], ptr %25, i64 0, i64 0
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds %struct.record, ptr %0, i64 %27
  %29 = getelementptr inbounds %struct.record, ptr %28, i32 0, i32 1
  %30 = getelementptr inbounds [3 x i8], ptr %29, i64 0, i64 0
  %31 = call i64 @strlen(ptr noundef %30) #6
  call void @llvm.memset.p0.i64(ptr align 1 %26, i8 0, i64 %31, i1 false)
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds %struct.record, ptr %0, i64 %32
  %34 = getelementptr inbounds %struct.record, ptr %33, i32 0, i32 2
  %35 = getelementptr inbounds [5 x i8], ptr %34, i64 0, i64 0
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds %struct.record, ptr %0, i64 %36
  %38 = getelementptr inbounds %struct.record, ptr %37, i32 0, i32 2
  %39 = getelementptr inbounds [5 x i8], ptr %38, i64 0, i64 0
  %40 = call i64 @strlen(ptr noundef %39) #6
  call void @llvm.memset.p0.i64(ptr align 1 %35, i8 0, i64 %40, i1 false)
  br label %44

41:                                               ; preds = %6
  br label %42

42:                                               ; preds = %41
  %43 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !10

44:                                               ; preds = %13, %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x %struct.record], align 16
  %2 = getelementptr inbounds [1000 x %struct.record], ptr %1, i64 0, i64 0
  call void @insert_records(ptr noundef %2, i32 noundef 1000)
  %3 = getelementptr inbounds [1000 x %struct.record], ptr %1, i64 0, i64 0
  %4 = call ptr @search_records(ptr noundef %3, i32 noundef 1000, ptr noundef @.str.4)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %14

6:                                                ; preds = %0
  %7 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 0
  %8 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %9 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 1
  %10 = getelementptr inbounds [3 x i8], ptr %9, i64 0, i64 0
  %11 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 2
  %12 = getelementptr inbounds [5 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %8, ptr noundef %10, ptr noundef %12)
  br label %16

14:                                               ; preds = %0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %16

16:                                               ; preds = %14, %6
  %17 = getelementptr inbounds [1000 x %struct.record], ptr %1, i64 0, i64 0
  call void @update_records(ptr noundef %17, i32 noundef 1000, ptr noundef @.str.4, ptr noundef @.str.7)
  %18 = getelementptr inbounds [1000 x %struct.record], ptr %1, i64 0, i64 0
  %19 = call ptr @search_records(ptr noundef %18, i32 noundef 1000, ptr noundef @.str.4)
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %29

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.record, ptr %19, i32 0, i32 0
  %23 = getelementptr inbounds [20 x i8], ptr %22, i64 0, i64 0
  %24 = getelementptr inbounds %struct.record, ptr %19, i32 0, i32 1
  %25 = getelementptr inbounds [3 x i8], ptr %24, i64 0, i64 0
  %26 = getelementptr inbounds %struct.record, ptr %19, i32 0, i32 2
  %27 = getelementptr inbounds [5 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %23, ptr noundef %25, ptr noundef %27)
  br label %31

29:                                               ; preds = %16
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %31

31:                                               ; preds = %29, %21
  %32 = getelementptr inbounds [1000 x %struct.record], ptr %1, i64 0, i64 0
  call void @delete_records(ptr noundef %32, i32 noundef 1000, ptr noundef @.str.4)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
