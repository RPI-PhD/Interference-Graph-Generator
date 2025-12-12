; ModuleID = 'LLVM_IR/falcon180b-10431.ll'
source_filename = "DATASETv2/falcon180b-10431.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [44 x i8] c"Usage: %s <source_file> <destination_file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Error opening source file: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"Error getting source file status: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"Error opening destination file: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"Error writing to destination file: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"Error reading from source file: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c"Data recovery completed successfully.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.stat, align 8
  %4 = alloca [1024 x i8], align 16
  %5 = icmp ne i32 %0, 3
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %8)
  br label %78

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, i32, ...) @open(ptr noundef %12, i32 noundef 0)
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %20

15:                                               ; preds = %10
  %16 = call ptr @__errno_location() #4
  %17 = load i32, ptr %16, align 4
  %18 = call ptr @strerror(i32 noundef %17) #5
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %18)
  br label %78

20:                                               ; preds = %10
  %21 = call i32 @fstat(i32 noundef %13, ptr noundef %3) #5
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %29

23:                                               ; preds = %20
  %24 = call ptr @__errno_location() #4
  %25 = load i32, ptr %24, align 4
  %26 = call ptr @strerror(i32 noundef %25) #5
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %26)
  %28 = call i32 @close(i32 noundef %13)
  br label %78

29:                                               ; preds = %20
  %30 = getelementptr inbounds ptr, ptr %1, i64 2
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.stat, ptr %3, i32 0, i32 3
  %33 = load i32, ptr %32, align 8
  %34 = call i32 (ptr, i32, ...) @open(ptr noundef %31, i32 noundef 577, i32 noundef %33)
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %42

36:                                               ; preds = %29
  %37 = call ptr @__errno_location() #4
  %38 = load i32, ptr %37, align 4
  %39 = call ptr @strerror(i32 noundef %38) #5
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %39)
  %41 = call i32 @close(i32 noundef %13)
  br label %78

42:                                               ; preds = %29
  br label %43

43:                                               ; preds = %61, %42
  %44 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %45 = call i64 @read(i32 noundef %13, ptr noundef %44, i64 noundef 1024)
  %46 = icmp sgt i64 %45, 0
  br i1 %46, label %47, label %62

47:                                               ; preds = %43
  %48 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %49 = call i64 @write(i32 noundef %34, ptr noundef %48, i64 noundef %45)
  %50 = icmp ne i64 %49, %45
  br i1 %50, label %51, label %61

51:                                               ; preds = %47
  %52 = call ptr @__errno_location() #4
  %53 = load i32, ptr %52, align 4
  %54 = call ptr @strerror(i32 noundef %53) #5
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %54)
  %56 = call i32 @close(i32 noundef %13)
  %57 = call i32 @close(i32 noundef %34)
  %58 = getelementptr inbounds ptr, ptr %1, i64 2
  %59 = load ptr, ptr %58, align 8
  %60 = call i32 @unlink(ptr noundef %59) #5
  br label %78

61:                                               ; preds = %47
  br label %43, !llvm.loop !6

62:                                               ; preds = %43
  %63 = icmp eq i64 %45, -1
  br i1 %63, label %64, label %74

64:                                               ; preds = %62
  %65 = call ptr @__errno_location() #4
  %66 = load i32, ptr %65, align 4
  %67 = call ptr @strerror(i32 noundef %66) #5
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %67)
  %69 = call i32 @close(i32 noundef %13)
  %70 = call i32 @close(i32 noundef %34)
  %71 = getelementptr inbounds ptr, ptr %1, i64 2
  %72 = load ptr, ptr %71, align 8
  %73 = call i32 @unlink(ptr noundef %72) #5
  br label %78

74:                                               ; preds = %62
  %75 = call i32 @close(i32 noundef %13)
  %76 = call i32 @close(i32 noundef %34)
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %78

78:                                               ; preds = %74, %64, %51, %36, %23, %15, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %15 ], [ 1, %23 ], [ 1, %36 ], [ 1, %51 ], [ 1, %64 ], [ 0, %74 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @open(ptr noundef, i32 noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #3

; Function Attrs: nounwind
declare i32 @fstat(i32 noundef, ptr noundef) #2

declare i32 @close(i32 noundef) #1

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #1

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind
declare i32 @unlink(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) }
attributes #5 = { nounwind }

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
