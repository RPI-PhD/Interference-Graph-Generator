; ModuleID = 'DATASETv2/falcon180b-34007.c'
source_filename = "DATASETv2/falcon180b-34007.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.WordFrequency = type { [50 x i8], i32 }

@.str = private unnamed_addr constant [12 x i8] c"example.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Error opening file.\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c",.?!;:\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @compareStrings(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 @strcmp(ptr noundef %6, ptr noundef %8) #6
  ret i32 %9
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [1024 x i8], align 16
  %4 = alloca ptr, align 8
  %5 = alloca [1000 x %struct.WordFrequency], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 56000, i1 false)
  store i32 0, ptr %6, align 4
  %10 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #7
  unreachable

15:                                               ; preds = %0
  br label %16

16:                                               ; preds = %95, %15
  %17 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %18 = load ptr, ptr %2, align 8
  %19 = call ptr @fgets(ptr noundef %17, i32 noundef 1024, ptr noundef %18)
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %96

21:                                               ; preds = %16
  store i32 0, ptr %7, align 4
  br label %22

22:                                               ; preds = %40, %21
  %23 = load i32, ptr %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 %24
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %43

29:                                               ; preds = %22
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = call i32 @tolower(i32 noundef %34) #6
  %36 = trunc i32 %35 to i8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 %38
  store i8 %36, ptr %39, align 1
  br label %40

40:                                               ; preds = %29
  %41 = load i32, ptr %7, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %7, align 4
  br label %22, !llvm.loop !6

43:                                               ; preds = %22
  %44 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %45 = call ptr @strtok(ptr noundef %44, ptr noundef @.str.3) #8
  store ptr %45, ptr %4, align 8
  br label %46

46:                                               ; preds = %93, %43
  %47 = load ptr, ptr %4, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %95

49:                                               ; preds = %46
  store i32 0, ptr %8, align 4
  br label %50

50:                                               ; preds = %65, %49
  %51 = load i32, ptr %8, align 4
  %52 = load i32, ptr %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %63

54:                                               ; preds = %50
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.WordFrequency, ptr %57, i32 0, i32 0
  %59 = getelementptr inbounds [50 x i8], ptr %58, i64 0, i64 0
  %60 = load ptr, ptr %4, align 8
  %61 = call i32 @strcmp(ptr noundef %59, ptr noundef %60) #6
  %62 = icmp ne i32 %61, 0
  br label %63

63:                                               ; preds = %54, %50
  %64 = phi i1 [ false, %50 ], [ %62, %54 ]
  br i1 %64, label %65, label %68

65:                                               ; preds = %63
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %8, align 4
  br label %50, !llvm.loop !8

68:                                               ; preds = %63
  %69 = load i32, ptr %8, align 4
  %70 = load i32, ptr %6, align 4
  %71 = icmp eq i32 %69, %70
  br i1 %71, label %72, label %86

72:                                               ; preds = %68
  %73 = load i32, ptr %6, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.WordFrequency, ptr %75, i32 0, i32 0
  %77 = getelementptr inbounds [50 x i8], ptr %76, i64 0, i64 0
  %78 = load ptr, ptr %4, align 8
  %79 = call ptr @strcpy(ptr noundef %77, ptr noundef %78) #8
  %80 = load i32, ptr %6, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %81
  %83 = getelementptr inbounds %struct.WordFrequency, ptr %82, i32 0, i32 1
  store i32 1, ptr %83, align 4
  %84 = load i32, ptr %6, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %6, align 4
  br label %93

86:                                               ; preds = %68
  %87 = load i32, ptr %8, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %88
  %90 = getelementptr inbounds %struct.WordFrequency, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %90, align 4
  br label %93

93:                                               ; preds = %86, %72
  %94 = call ptr @strtok(ptr noundef null, ptr noundef @.str.3) #8
  store ptr %94, ptr %4, align 8
  br label %46, !llvm.loop !9

95:                                               ; preds = %46
  br label %16, !llvm.loop !10

96:                                               ; preds = %16
  %97 = load ptr, ptr %2, align 8
  %98 = call i32 @fclose(ptr noundef %97)
  %99 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 0
  %100 = load i32, ptr %6, align 4
  %101 = sext i32 %100 to i64
  call void @qsort(ptr noundef %99, i64 noundef %101, i64 noundef 56, ptr noundef @compareStrings)
  store i32 0, ptr %9, align 4
  br label %102

102:                                              ; preds = %118, %96
  %103 = load i32, ptr %9, align 4
  %104 = load i32, ptr %6, align 4
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %106, label %121

106:                                              ; preds = %102
  %107 = load i32, ptr %9, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.WordFrequency, ptr %109, i32 0, i32 0
  %111 = getelementptr inbounds [50 x i8], ptr %110, i64 0, i64 0
  %112 = load i32, ptr %9, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %5, i64 0, i64 %113
  %115 = getelementptr inbounds %struct.WordFrequency, ptr %114, i32 0, i32 1
  %116 = load i32, ptr %115, align 4
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %111, i32 noundef %116)
  br label %118

118:                                              ; preds = %106
  %119 = load i32, ptr %9, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %9, align 4
  br label %102, !llvm.loop !11

121:                                              ; preds = %102
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #5

declare i32 @fclose(ptr noundef) #3

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

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
!11 = distinct !{!11, !7}
