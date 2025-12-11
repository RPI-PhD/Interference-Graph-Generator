; ModuleID = 'DATASETv2/falcon2-11B-3074.c'
source_filename = "DATASETv2/falcon2-11B-3074.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.IndexEntry = type { [100 x i8], i32 }

@numEntries = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [47 x i8] c"Database is full. Cannot insert more entries.\0A\00", align 1
@entries = dso_local global [100 x %struct.IndexEntry] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [18 x i8] c"Entry not found.\0A\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"1. Insert\0A2. Delete\0A3. Search\0A4. Exit\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Enter key: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"Enter value: \00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Enter key to delete: \00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"Enter key to search: \00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Value found: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"Exiting program...\0A\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insert(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.IndexEntry, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = getelementptr inbounds %struct.IndexEntry, ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %8 = load ptr, ptr %3, align 8
  %9 = call ptr @strcpy(ptr noundef %7, ptr noundef %8) #5
  %10 = load i32, ptr %4, align 4
  %11 = getelementptr inbounds %struct.IndexEntry, ptr %5, i32 0, i32 1
  store i32 %10, ptr %11, align 4
  %12 = load i32, ptr @numEntries, align 4
  %13 = icmp eq i32 %12, 100
  br i1 %13, label %14, label %16

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %22

16:                                               ; preds = %2
  %17 = load i32, ptr @numEntries, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %18
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %19, ptr align 4 %5, i64 104, i1 false)
  %20 = load i32, ptr @numEntries, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr @numEntries, align 4
  br label %22

22:                                               ; preds = %16, %14
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @delete(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr @numEntries, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %23

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.IndexEntry, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @strcmp(ptr noundef %14, ptr noundef %15) #6
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %9
  br label %23

19:                                               ; preds = %9
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %5, !llvm.loop !6

23:                                               ; preds = %18, %5
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr @numEntries, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %50

29:                                               ; preds = %23
  %30 = load i32, ptr %3, align 4
  store i32 %30, ptr %4, align 4
  br label %31

31:                                               ; preds = %44, %29
  %32 = load i32, ptr %4, align 4
  %33 = load i32, ptr @numEntries, align 4
  %34 = sub nsw i32 %33, 1
  %35 = icmp slt i32 %32, %34
  br i1 %35, label %36, label %47

36:                                               ; preds = %31
  %37 = load i32, ptr %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %38
  %40 = load i32, ptr %4, align 4
  %41 = add nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %42
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %39, ptr align 8 %43, i64 104, i1 false)
  br label %44

44:                                               ; preds = %36
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %4, align 4
  br label %31, !llvm.loop !8

47:                                               ; preds = %31
  %48 = load i32, ptr @numEntries, align 4
  %49 = add nsw i32 %48, -1
  store i32 %49, ptr @numEntries, align 4
  br label %50

50:                                               ; preds = %47, %27
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @search(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %25, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr @numEntries, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %28

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.IndexEntry, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %3, align 8
  %16 = call i32 @strcmp(ptr noundef %14, ptr noundef %15) #6
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %24

18:                                               ; preds = %9
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.IndexEntry, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  store i32 %23, ptr %2, align 4
  br label %29

24:                                               ; preds = %9
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %5, !llvm.loop !9

28:                                               ; preds = %5
  store i32 -1, ptr %2, align 4
  br label %29

29:                                               ; preds = %28, %18
  %30 = load i32, ptr %2, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %64, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %2)
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %61 [
    i32 1, label %7
    i32 2, label %31
    i32 3, label %44
    i32 4, label %59
  ]

7:                                                ; preds = %3
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %9 = load i32, ptr @numEntries, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.IndexEntry, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %16 = load i32, ptr @numEntries, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.IndexEntry, ptr %18, i32 0, i32 1
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %19)
  %21 = load i32, ptr @numEntries, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.IndexEntry, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds [100 x i8], ptr %24, i64 0, i64 0
  %26 = load i32, ptr @numEntries, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.IndexEntry, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  call void @insert(ptr noundef %25, i32 noundef %30)
  br label %63

31:                                               ; preds = %3
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %33 = load i32, ptr @numEntries, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.IndexEntry, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds [100 x i8], ptr %36, i64 0, i64 0
  %38 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %37)
  %39 = load i32, ptr @numEntries, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %40
  %42 = getelementptr inbounds %struct.IndexEntry, ptr %41, i32 0, i32 0
  %43 = getelementptr inbounds [100 x i8], ptr %42, i64 0, i64 0
  call void @delete(ptr noundef %43)
  br label %63

44:                                               ; preds = %3
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %46 = load i32, ptr @numEntries, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.IndexEntry, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds [100 x i8], ptr %49, i64 0, i64 0
  %51 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %50)
  %52 = load i32, ptr @numEntries, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [100 x %struct.IndexEntry], ptr @entries, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.IndexEntry, ptr %54, i32 0, i32 0
  %56 = getelementptr inbounds [100 x i8], ptr %55, i64 0, i64 0
  %57 = call i32 @search(ptr noundef %56)
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %57)
  br label %63

59:                                               ; preds = %3
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %63

61:                                               ; preds = %3
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %63

63:                                               ; preds = %61, %59, %44, %31, %7
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %2, align 4
  %66 = icmp ne i32 %65, 4
  br i1 %66, label %3, label %67, !llvm.loop !10

67:                                               ; preds = %64
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
