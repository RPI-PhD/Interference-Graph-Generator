; ModuleID = 'DATASETv2/gpt35-29296.c'
source_filename = "DATASETv2/gpt35-29296.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Error: Cannot open the dictionary\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Error: Cannot open the text file\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"Line %d, word %s: Possible spelling mistake\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Enter the path to dictionary: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [45 x i8] c"Enter the path to text file to spell check: \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @load_dict(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca [100 x i8], align 16
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = call noalias ptr @fopen(ptr noundef %8, ptr noundef @.str)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef -1) #5
  unreachable

14:                                               ; preds = %2
  br label %15

15:                                               ; preds = %20, %14
  %16 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %17 = load ptr, ptr %5, align 8
  %18 = call ptr @fgets(ptr noundef %16, i32 noundef 100, ptr noundef %17)
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %32

20:                                               ; preds = %15
  %21 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %22 = call i64 @strcspn(ptr noundef %21, ptr noundef @.str.2) #6
  %23 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %22
  store i8 0, ptr %23, align 1
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  %27 = sext i32 %25 to i64
  %28 = getelementptr inbounds [100 x i8], ptr %24, i64 %27
  %29 = getelementptr inbounds [100 x i8], ptr %28, i64 0, i64 0
  %30 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %31 = call ptr @strcpy(ptr noundef %29, ptr noundef %30) #7
  br label %15, !llvm.loop !6

32:                                               ; preds = %15
  %33 = load ptr, ptr %5, align 8
  %34 = call i32 @fclose(ptr noundef %33)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @spell_check(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca [100 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %9, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = call noalias ptr @fopen(ptr noundef %11, ptr noundef @.str)
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef -1) #5
  unreachable

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %99, %17
  %19 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %20 = load ptr, ptr %5, align 8
  %21 = call ptr @fgets(ptr noundef %19, i32 noundef 100, ptr noundef %20)
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %100

23:                                               ; preds = %18
  %24 = load i32, ptr %9, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %9, align 4
  %26 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %27 = call i64 @strlen(ptr noundef %26) #6
  %28 = trunc i64 %27 to i32
  store i32 %28, ptr %10, align 4
  %29 = load i32, ptr %10, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %44

31:                                               ; preds = %23
  %32 = load i32, ptr %10, align 4
  %33 = sub nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %34
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 10
  br i1 %38, label %39, label %44

39:                                               ; preds = %31
  %40 = load i32, ptr %10, align 4
  %41 = sub nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %42
  store i8 0, ptr %43, align 1
  br label %44

44:                                               ; preds = %39, %31, %23
  store i32 0, ptr %7, align 4
  br label %45

45:                                               ; preds = %62, %44
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %65

51:                                               ; preds = %45
  %52 = load i32, ptr %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %53
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  %57 = call i32 @tolower(i32 noundef %56) #6
  %58 = trunc i32 %57 to i8
  %59 = load i32, ptr %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %60
  store i8 %58, ptr %61, align 1
  br label %62

62:                                               ; preds = %51
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %7, align 4
  br label %45, !llvm.loop !8

65:                                               ; preds = %45
  store i32 0, ptr %8, align 4
  store i32 0, ptr %7, align 4
  br label %66

66:                                               ; preds = %89, %65
  %67 = load i32, ptr %7, align 4
  %68 = icmp slt i32 %67, 50000
  br i1 %68, label %69, label %92

69:                                               ; preds = %66
  %70 = load ptr, ptr %4, align 8
  %71 = load i32, ptr %7, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [100 x i8], ptr %70, i64 %72
  %74 = getelementptr inbounds [100 x i8], ptr %73, i64 0, i64 0
  %75 = call i64 @strlen(ptr noundef %74) #6
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %69
  br label %92

78:                                               ; preds = %69
  %79 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %80 = load ptr, ptr %4, align 8
  %81 = load i32, ptr %7, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [100 x i8], ptr %80, i64 %82
  %84 = getelementptr inbounds [100 x i8], ptr %83, i64 0, i64 0
  %85 = call i32 @strcmp(ptr noundef %79, ptr noundef %84) #6
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %88

87:                                               ; preds = %78
  store i32 1, ptr %8, align 4
  br label %92

88:                                               ; preds = %78
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %7, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %7, align 4
  br label %66, !llvm.loop !9

92:                                               ; preds = %87, %77, %66
  %93 = load i32, ptr %8, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %99, label %95

95:                                               ; preds = %92
  %96 = load i32, ptr %9, align 4
  %97 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %98 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %96, ptr noundef %97)
  br label %99

99:                                               ; preds = %95, %92
  br label %18, !llvm.loop !10

100:                                              ; preds = %18
  %101 = load ptr, ptr %5, align 8
  %102 = call i32 @fclose(ptr noundef %101)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca [50000 x [100 x i8]], align 16
  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %6 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %9 = getelementptr inbounds [50000 x [100 x i8]], ptr %4, i64 0, i64 0
  call void @load_dict(ptr noundef %8, ptr noundef %9)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %11 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %11)
  %13 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %14 = getelementptr inbounds [50000 x [100 x i8]], ptr %4, i64 0, i64 0
  call void @spell_check(ptr noundef %13, ptr noundef %14)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
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
!10 = distinct !{!10, !7}
