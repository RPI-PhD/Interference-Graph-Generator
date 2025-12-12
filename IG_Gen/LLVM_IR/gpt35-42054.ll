; ModuleID = 'DATASETv2/gpt35-42054.c'
source_filename = "DATASETv2/gpt35-42054.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MemoryManager = type { ptr, ptr, i32, i32, [5 x i32] }

@.str = private unnamed_addr constant [34 x i8] c"No more memory blocks available!\0A\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"Allocated memory block at index %d with size %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Freed memory block at index %d with size %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @allocate_memory(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.MemoryManager, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 @pthread_mutex_lock(ptr noundef %12) #4
  store i32 -1, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %33, %1
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %36

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.MemoryManager, ptr %18, i32 0, i32 4
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5 x i32], ptr %19, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %32

25:                                               ; preds = %17
  %26 = load i32, ptr %5, align 4
  store i32 %26, ptr %6, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.MemoryManager, ptr %27, i32 0, i32 4
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5 x i32], ptr %28, i64 0, i64 %30
  store i32 1, ptr %31, align 4
  br label %36

32:                                               ; preds = %17
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %14, !llvm.loop !6

36:                                               ; preds = %25, %14
  %37 = load i32, ptr %6, align 4
  %38 = icmp eq i32 %37, -1
  br i1 %38, label %39, label %45

39:                                               ; preds = %36
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.MemoryManager, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = call i32 @pthread_mutex_unlock(ptr noundef %43) #4
  store ptr null, ptr %2, align 8
  br label %117

45:                                               ; preds = %36
  %46 = call i32 @rand() #4
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.MemoryManager, ptr %47, i32 0, i32 3
  %49 = load i32, ptr %48, align 4
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.MemoryManager, ptr %50, i32 0, i32 2
  %52 = load i32, ptr %51, align 8
  %53 = sub nsw i32 %49, %52
  %54 = add nsw i32 %53, 1
  %55 = srem i32 %46, %54
  store i32 %55, ptr %7, align 4
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.MemoryManager, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %struct.MemoryManager, ptr %59, i32 0, i32 2
  %61 = load i32, ptr %60, align 8
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, ptr %58, i64 %62
  store ptr %63, ptr %8, align 8
  %64 = load i32, ptr %7, align 4
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.MemoryManager, ptr %65, i32 0, i32 2
  %67 = load i32, ptr %66, align 8
  %68 = add nsw i32 %67, %64
  store i32 %68, ptr %66, align 8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.MemoryManager, ptr %69, i32 0, i32 0
  %71 = load ptr, ptr %70, align 8
  %72 = call i32 @pthread_mutex_unlock(ptr noundef %71) #4
  %73 = load ptr, ptr %8, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.MemoryManager, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = ptrtoint ptr %73 to i64
  %78 = ptrtoint ptr %76 to i64
  %79 = sub i64 %77, %78
  %80 = load i32, ptr %7, align 4
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i64 noundef %79, i32 noundef %80)
  %82 = call i32 @rand() #4
  %83 = srem i32 %82, 3
  %84 = add nsw i32 %83, 1
  %85 = call i32 @sleep(i32 noundef %84)
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds %struct.MemoryManager, ptr %86, i32 0, i32 0
  %88 = load ptr, ptr %87, align 8
  %89 = call i32 @pthread_mutex_lock(ptr noundef %88) #4
  %90 = load ptr, ptr %4, align 8
  %91 = getelementptr inbounds %struct.MemoryManager, ptr %90, i32 0, i32 4
  %92 = load i32, ptr %6, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [5 x i32], ptr %91, i64 0, i64 %93
  store i32 0, ptr %94, align 4
  %95 = load i32, ptr %7, align 4
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.MemoryManager, ptr %96, i32 0, i32 2
  %98 = load i32, ptr %97, align 8
  %99 = sub nsw i32 %98, %95
  store i32 %99, ptr %97, align 8
  %100 = load ptr, ptr %4, align 8
  %101 = getelementptr inbounds %struct.MemoryManager, ptr %100, i32 0, i32 0
  %102 = load ptr, ptr %101, align 8
  %103 = call i32 @pthread_mutex_unlock(ptr noundef %102) #4
  %104 = load ptr, ptr %8, align 8
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.MemoryManager, ptr %105, i32 0, i32 1
  %107 = load ptr, ptr %106, align 8
  %108 = ptrtoint ptr %104 to i64
  %109 = ptrtoint ptr %107 to i64
  %110 = sub i64 %108, %109
  %111 = load i32, ptr %7, align 4
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i64 noundef %110, i32 noundef %111)
  %113 = call i32 @rand() #4
  %114 = srem i32 %113, 3
  %115 = add nsw i32 %114, 1
  %116 = call i32 @sleep(i32 noundef %115)
  store ptr null, ptr %2, align 8
  br label %117

117:                                              ; preds = %45, %39
  %118 = load ptr, ptr %2, align 8
  ret ptr %118
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @sleep(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.MemoryManager, align 8
  %3 = alloca i32, align 4
  %4 = alloca [5 x i64], align 16
  store i32 0, ptr %1, align 4
  %5 = call noalias ptr @malloc(i64 noundef 40) #5
  %6 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 @pthread_mutex_init(ptr noundef %8, ptr noundef null) #4
  %10 = call noalias ptr @malloc(i64 noundef 1024) #5
  %11 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 1
  store ptr %10, ptr %11, align 8
  %12 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 2
  store i32 0, ptr %12, align 8
  %13 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 3
  store i32 1024, ptr %13, align 4
  store i32 0, ptr %3, align 4
  br label %14

14:                                               ; preds = %22, %0
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %25

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 4
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x i32], ptr %18, i64 0, i64 %20
  store i32 0, ptr %21, align 4
  br label %22

22:                                               ; preds = %17
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %14, !llvm.loop !8

25:                                               ; preds = %14
  store i32 0, ptr %3, align 4
  br label %26

26:                                               ; preds = %34, %25
  %27 = load i32, ptr %3, align 4
  %28 = icmp slt i32 %27, 5
  br i1 %28, label %29, label %37

29:                                               ; preds = %26
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5 x i64], ptr %4, i64 0, i64 %31
  %33 = call i32 @pthread_create(ptr noundef %32, ptr noundef null, ptr noundef @allocate_memory, ptr noundef %2) #4
  br label %34

34:                                               ; preds = %29
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %26, !llvm.loop !9

37:                                               ; preds = %26
  store i32 0, ptr %3, align 4
  br label %38

38:                                               ; preds = %47, %37
  %39 = load i32, ptr %3, align 4
  %40 = icmp slt i32 %39, 5
  br i1 %40, label %41, label %50

41:                                               ; preds = %38
  %42 = load i32, ptr %3, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [5 x i64], ptr %4, i64 0, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = call i32 @pthread_join(i64 noundef %45, ptr noundef null)
  br label %47

47:                                               ; preds = %41
  %48 = load i32, ptr %3, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %3, align 4
  br label %38, !llvm.loop !10

50:                                               ; preds = %38
  %51 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = call i32 @pthread_mutex_destroy(ptr noundef %52) #4
  %54 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %55) #4
  %56 = getelementptr inbounds %struct.MemoryManager, ptr %2, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  call void @free(ptr noundef %57) #4
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
