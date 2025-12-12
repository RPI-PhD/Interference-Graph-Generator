; ModuleID = 'LLVM_IR/falcon180b-70673.ll'
source_filename = "DATASETv2/falcon180b-70673.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.File = type { ptr, i32, ptr }

@.str = private unnamed_addr constant [16 x i8] c"Enter command: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"scan\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Enter path to scan: \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"File already scanned\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"File scanned successfully\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"%s (%d bytes)\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"Invalid command\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = call noalias ptr @malloc(i64 noundef 2400) #5
  br label %4

4:                                                ; preds = %95, %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %.01, %18 ], [ %.1, %95 ]
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str.2) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %66

11:                                               ; preds = %4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %13 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %13)
  %15 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %16 = call noalias ptr @fopen(ptr noundef %15, ptr noundef @.str.4)
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %20

18:                                               ; preds = %11
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %4

20:                                               ; preds = %11
  %21 = call i32 @fseek(ptr noundef %16, i64 noundef 0, i32 noundef 2)
  %22 = call i64 @ftell(ptr noundef %16)
  %23 = trunc i64 %22 to i32
  %24 = call i32 @fseek(ptr noundef %16, i64 noundef 0, i32 noundef 0)
  %25 = sext i32 %23 to i64
  %26 = call noalias ptr @malloc(i64 noundef %25) #5
  %27 = sext i32 %23 to i64
  %28 = call i64 @fread(ptr noundef %26, i64 noundef 1, i64 noundef %27, ptr noundef %16)
  %29 = call i32 @fclose(ptr noundef %16)
  br label %30

30:                                               ; preds = %42, %20
  %.03 = phi i32 [ 0, %20 ], [ %43, %42 ]
  %31 = icmp slt i32 %.03, %.01
  br i1 %31, label %32, label %44

32:                                               ; preds = %30
  %33 = sext i32 %.03 to i64
  %34 = getelementptr inbounds %struct.File, ptr %3, i64 %33
  %35 = getelementptr inbounds %struct.File, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %35, align 8
  %37 = call i32 @strcmp(ptr noundef %36, ptr noundef %26) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %32
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  call void @free(ptr noundef %26) #7
  br label %42

41:                                               ; preds = %32
  br label %42

42:                                               ; preds = %41, %39
  %43 = add nsw i32 %.03, 1
  br label %30, !llvm.loop !6

44:                                               ; preds = %30
  %45 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %46 = call i64 @strlen(ptr noundef %45) #6
  %47 = add i64 %46, 1
  %48 = call noalias ptr @malloc(i64 noundef %47) #5
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds %struct.File, ptr %3, i64 %49
  %51 = getelementptr inbounds %struct.File, ptr %50, i32 0, i32 0
  store ptr %48, ptr %51, align 8
  %52 = sext i32 %.01 to i64
  %53 = getelementptr inbounds %struct.File, ptr %3, i64 %52
  %54 = getelementptr inbounds %struct.File, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %57 = call ptr @strcpy(ptr noundef %55, ptr noundef %56) #7
  %58 = sext i32 %.01 to i64
  %59 = getelementptr inbounds %struct.File, ptr %3, i64 %58
  %60 = getelementptr inbounds %struct.File, ptr %59, i32 0, i32 1
  store i32 %23, ptr %60, align 8
  %61 = sext i32 %.01 to i64
  %62 = getelementptr inbounds %struct.File, ptr %3, i64 %61
  %63 = getelementptr inbounds %struct.File, ptr %62, i32 0, i32 2
  store ptr %26, ptr %63, align 8
  %64 = add nsw i32 %.01, 1
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  call void @free(ptr noundef %26) #7
  br label %95

66:                                               ; preds = %4
  %67 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %68 = call i32 @strcmp(ptr noundef %67, ptr noundef @.str.8) #6
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %86

70:                                               ; preds = %66
  br label %71

71:                                               ; preds = %83, %70
  %.02 = phi i32 [ 0, %70 ], [ %84, %83 ]
  %72 = icmp slt i32 %.02, %.01
  br i1 %72, label %73, label %85

73:                                               ; preds = %71
  %74 = sext i32 %.02 to i64
  %75 = getelementptr inbounds %struct.File, ptr %3, i64 %74
  %76 = getelementptr inbounds %struct.File, ptr %75, i32 0, i32 0
  %77 = load ptr, ptr %76, align 8
  %78 = sext i32 %.02 to i64
  %79 = getelementptr inbounds %struct.File, ptr %3, i64 %78
  %80 = getelementptr inbounds %struct.File, ptr %79, i32 0, i32 1
  %81 = load i32, ptr %80, align 8
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %77, i32 noundef %81)
  br label %83

83:                                               ; preds = %73
  %84 = add nsw i32 %.02, 1
  br label %71, !llvm.loop !8

85:                                               ; preds = %71
  br label %94

86:                                               ; preds = %66
  %87 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %88 = call i32 @strcmp(ptr noundef %87, ptr noundef @.str.10) #6
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %91

90:                                               ; preds = %86
  br label %96

91:                                               ; preds = %86
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %93

93:                                               ; preds = %91
  br label %94

94:                                               ; preds = %93, %85
  br label %95

95:                                               ; preds = %94, %44
  %.1 = phi i32 [ %64, %44 ], [ %.01, %94 ]
  br label %4

96:                                               ; preds = %90
  br label %97

97:                                               ; preds = %108, %96
  %.0 = phi i32 [ 0, %96 ], [ %109, %108 ]
  %98 = icmp slt i32 %.0, %.01
  br i1 %98, label %99, label %110

99:                                               ; preds = %97
  %100 = sext i32 %.0 to i64
  %101 = getelementptr inbounds %struct.File, ptr %3, i64 %100
  %102 = getelementptr inbounds %struct.File, ptr %101, i32 0, i32 0
  %103 = load ptr, ptr %102, align 8
  call void @free(ptr noundef %103) #7
  %104 = sext i32 %.0 to i64
  %105 = getelementptr inbounds %struct.File, ptr %3, i64 %104
  %106 = getelementptr inbounds %struct.File, ptr %105, i32 0, i32 2
  %107 = load ptr, ptr %106, align 8
  call void @free(ptr noundef %107) #7
  br label %108

108:                                              ; preds = %99
  %109 = add nsw i32 %.0, 1
  br label %97, !llvm.loop !9

110:                                              ; preds = %97
  call void @free(ptr noundef %3) #7
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(ptr noundef) #2

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }

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
