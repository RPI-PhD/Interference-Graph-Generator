; ModuleID = 'LLVM_IR/gpt35-42054.ll'
source_filename = "DATASETv2/gpt35-42054.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MemoryManager = type { ptr, ptr, i32, i32, [5 x i32] }

@.str = private unnamed_addr constant [34 x i8] c"No more memory blocks available!\0A\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"Allocated memory block at index %d with size %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Freed memory block at index %d with size %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @allocate_memory(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @pthread_mutex_lock(ptr noundef %3) #4
  br label %5

5:                                                ; preds = %18, %1
  %.02 = phi i32 [ 0, %1 ], [ %19, %18 ]
  %6 = icmp slt i32 %.02, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 4
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [5 x i32], ptr %8, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %7
  %14 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 4
  %15 = sext i32 %.02 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %14, i64 0, i64 %15
  store i32 1, ptr %16, align 4
  br label %20

17:                                               ; preds = %7
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !6

20:                                               ; preds = %13, %5
  %.01 = phi i32 [ %.02, %13 ], [ -1, %5 ]
  %21 = icmp eq i32 %.01, -1
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %24 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 @pthread_mutex_unlock(ptr noundef %25) #4
  br label %80

27:                                               ; preds = %20
  %28 = call i32 @rand() #4
  %29 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 3
  %30 = load i32, ptr %29, align 4
  %31 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 2
  %32 = load i32, ptr %31, align 8
  %33 = sub nsw i32 %30, %32
  %34 = add nsw i32 %33, 1
  %35 = srem i32 %28, %34
  %36 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 2
  %39 = load i32, ptr %38, align 8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, ptr %37, i64 %40
  %42 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 2
  %43 = load i32, ptr %42, align 8
  %44 = add nsw i32 %43, %35
  store i32 %44, ptr %42, align 8
  %45 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = call i32 @pthread_mutex_unlock(ptr noundef %46) #4
  %48 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = ptrtoint ptr %41 to i64
  %51 = ptrtoint ptr %49 to i64
  %52 = sub i64 %50, %51
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i64 noundef %52, i32 noundef %35)
  %54 = call i32 @rand() #4
  %55 = srem i32 %54, 3
  %56 = add nsw i32 %55, 1
  %57 = call i32 @sleep(i32 noundef %56)
  %58 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = call i32 @pthread_mutex_lock(ptr noundef %59) #4
  %61 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 4
  %62 = sext i32 %.01 to i64
  %63 = getelementptr inbounds [5 x i32], ptr %61, i64 0, i64 %62
  store i32 0, ptr %63, align 4
  %64 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 2
  %65 = load i32, ptr %64, align 8
  %66 = sub nsw i32 %65, %35
  store i32 %66, ptr %64, align 8
  %67 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = call i32 @pthread_mutex_unlock(ptr noundef %68) #4
  %70 = getelementptr inbounds %struct.MemoryManager, ptr %0, i32 0, i32 1
  %71 = load ptr, ptr %70, align 8
  %72 = ptrtoint ptr %41 to i64
  %73 = ptrtoint ptr %71 to i64
  %74 = sub i64 %72, %73
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i64 noundef %74, i32 noundef %35)
  %76 = call i32 @rand() #4
  %77 = srem i32 %76, 3
  %78 = add nsw i32 %77, 1
  %79 = call i32 @sleep(i32 noundef %78)
  br label %80

80:                                               ; preds = %27, %22
  ret ptr null
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @sleep(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.MemoryManager, align 8
  %2 = alloca [5 x i64], align 16
  %3 = call noalias ptr @malloc(i64 noundef 40) #5
  %4 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 0
  store ptr %3, ptr %4, align 8
  %5 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 @pthread_mutex_init(ptr noundef %6, ptr noundef null) #4
  %8 = call noalias ptr @malloc(i64 noundef 1024) #5
  %9 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 1
  store ptr %8, ptr %9, align 8
  %10 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 2
  store i32 0, ptr %10, align 8
  %11 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 3
  store i32 1024, ptr %11, align 4
  br label %12

12:                                               ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %13 = icmp slt i32 %.0, 5
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 4
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [5 x i32], ptr %15, i64 0, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %14
  %19 = add nsw i32 %.0, 1
  br label %12, !llvm.loop !8

20:                                               ; preds = %12
  br label %21

21:                                               ; preds = %27, %20
  %.1 = phi i32 [ 0, %20 ], [ %28, %27 ]
  %22 = icmp slt i32 %.1, 5
  br i1 %22, label %23, label %29

23:                                               ; preds = %21
  %24 = sext i32 %.1 to i64
  %25 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %24
  %26 = call i32 @pthread_create(ptr noundef %25, ptr noundef null, ptr noundef @allocate_memory, ptr noundef %1) #4
  br label %27

27:                                               ; preds = %23
  %28 = add nsw i32 %.1, 1
  br label %21, !llvm.loop !9

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %37, %29
  %.2 = phi i32 [ 0, %29 ], [ %38, %37 ]
  %31 = icmp slt i32 %.2, 5
  br i1 %31, label %32, label %39

32:                                               ; preds = %30
  %33 = sext i32 %.2 to i64
  %34 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %33
  %35 = load i64, ptr %34, align 8
  %36 = call i32 @pthread_join(i64 noundef %35, ptr noundef null)
  br label %37

37:                                               ; preds = %32
  %38 = add nsw i32 %.2, 1
  br label %30, !llvm.loop !10

39:                                               ; preds = %30
  %40 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = call i32 @pthread_mutex_destroy(ptr noundef %41) #4
  %43 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  call void @free(ptr noundef %44) #4
  %45 = getelementptr inbounds %struct.MemoryManager, ptr %1, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  call void @free(ptr noundef %46) #4
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare i32 @pthread_mutex_init(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @pthread_join(i64 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_destroy(ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
