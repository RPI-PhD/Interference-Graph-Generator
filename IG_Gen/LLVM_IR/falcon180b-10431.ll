; ModuleID = 'DATASETv2/falcon180b-10431.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.stat, align 8
  %8 = alloca i32, align 4
  %9 = alloca [1024 x i8], align 16
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %12 = load i32, ptr %4, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17)
  store i32 1, ptr %3, align 4
  br label %108

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 1
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 (ptr, i32, ...) @open(ptr noundef %22, i32 noundef 0)
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %24, -1
  br i1 %25, label %26, label %31

26:                                               ; preds = %19
  %27 = call ptr @__errno_location() #4
  %28 = load i32, ptr %27, align 4
  %29 = call ptr @strerror(i32 noundef %28) #5
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %29)
  store i32 1, ptr %3, align 4
  br label %108

31:                                               ; preds = %19
  %32 = load i32, ptr %6, align 4
  %33 = call i32 @fstat(i32 noundef %32, ptr noundef %7) #5
  %34 = icmp eq i32 %33, -1
  br i1 %34, label %35, label %42

35:                                               ; preds = %31
  %36 = call ptr @__errno_location() #4
  %37 = load i32, ptr %36, align 4
  %38 = call ptr @strerror(i32 noundef %37) #5
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %38)
  %40 = load i32, ptr %6, align 4
  %41 = call i32 @close(i32 noundef %40)
  store i32 1, ptr %3, align 4
  br label %108

42:                                               ; preds = %31
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 2
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.stat, ptr %7, i32 0, i32 3
  %47 = load i32, ptr %46, align 8
  %48 = call i32 (ptr, i32, ...) @open(ptr noundef %45, i32 noundef 577, i32 noundef %47)
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %8, align 4
  %50 = icmp eq i32 %49, -1
  br i1 %50, label %51, label %58

51:                                               ; preds = %42
  %52 = call ptr @__errno_location() #4
  %53 = load i32, ptr %52, align 4
  %54 = call ptr @strerror(i32 noundef %53) #5
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %54)
  %56 = load i32, ptr %6, align 4
  %57 = call i32 @close(i32 noundef %56)
  store i32 1, ptr %3, align 4
  br label %108

58:                                               ; preds = %42
  br label %59

59:                                               ; preds = %85, %58
  %60 = load i32, ptr %6, align 4
  %61 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %62 = call i64 @read(i32 noundef %60, ptr noundef %61, i64 noundef 1024)
  store i64 %62, ptr %10, align 8
  %63 = icmp sgt i64 %62, 0
  br i1 %63, label %64, label %86

64:                                               ; preds = %59
  %65 = load i32, ptr %8, align 4
  %66 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %67 = load i64, ptr %10, align 8
  %68 = call i64 @write(i32 noundef %65, ptr noundef %66, i64 noundef %67)
  store i64 %68, ptr %11, align 8
  %69 = load i64, ptr %11, align 8
  %70 = load i64, ptr %10, align 8
  %71 = icmp ne i64 %69, %70
  br i1 %71, label %72, label %85

72:                                               ; preds = %64
  %73 = call ptr @__errno_location() #4
  %74 = load i32, ptr %73, align 4
  %75 = call ptr @strerror(i32 noundef %74) #5
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %75)
  %77 = load i32, ptr %6, align 4
  %78 = call i32 @close(i32 noundef %77)
  %79 = load i32, ptr %8, align 4
  %80 = call i32 @close(i32 noundef %79)
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr inbounds ptr, ptr %81, i64 2
  %83 = load ptr, ptr %82, align 8
  %84 = call i32 @unlink(ptr noundef %83) #5
  store i32 1, ptr %3, align 4
  br label %108

85:                                               ; preds = %64
  br label %59, !llvm.loop !6

86:                                               ; preds = %59
  %87 = load i64, ptr %10, align 8
  %88 = icmp eq i64 %87, -1
  br i1 %88, label %89, label %102

89:                                               ; preds = %86
  %90 = call ptr @__errno_location() #4
  %91 = load i32, ptr %90, align 4
  %92 = call ptr @strerror(i32 noundef %91) #5
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %92)
  %94 = load i32, ptr %6, align 4
  %95 = call i32 @close(i32 noundef %94)
  %96 = load i32, ptr %8, align 4
  %97 = call i32 @close(i32 noundef %96)
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds ptr, ptr %98, i64 2
  %100 = load ptr, ptr %99, align 8
  %101 = call i32 @unlink(ptr noundef %100) #5
  store i32 1, ptr %3, align 4
  br label %108

102:                                              ; preds = %86
  %103 = load i32, ptr %6, align 4
  %104 = call i32 @close(i32 noundef %103)
  %105 = load i32, ptr %8, align 4
  %106 = call i32 @close(i32 noundef %105)
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %3, align 4
  br label %108

108:                                              ; preds = %102, %89, %72, %51, %35, %26, %14
  %109 = load i32, ptr %3, align 4
  ret i32 %109
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
