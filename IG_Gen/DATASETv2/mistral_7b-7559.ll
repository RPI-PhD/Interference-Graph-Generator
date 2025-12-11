; ModuleID = 'DATASETv2/mistral_7b-7559.c'
source_filename = "DATASETv2/mistral_7b-7559.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Person = type { [256 x i8], [256 x i8], i32 }

@.str = private unnamed_addr constant [20 x i8] c"Usage: %s <string>\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"Name: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Occupation: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Age: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"'s scandal\00", align 1
@.str.5 = private unnamed_addr constant [44 x i8] c"\0ASherlock: %s is in a scandal? Impossible!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @extractName(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %25, %2
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %5, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr %8, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 44
  br i1 %14, label %15, label %23

15:                                               ; preds = %7
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 0
  br label %23

23:                                               ; preds = %15, %7
  %24 = phi i1 [ false, %7 ], [ %22, %15 ]
  br i1 %24, label %25, label %41

25:                                               ; preds = %23
  %26 = load ptr, ptr %3, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %26, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = call i32 @tolower(i32 noundef %31) #5
  %33 = trunc i32 %32 to i8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.Person, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i8], ptr %35, i64 0, i64 %37
  store i8 %33, ptr %38, align 1
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %7, !llvm.loop !6

41:                                               ; preds = %23
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.Person, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [256 x i8], ptr %43, i64 0, i64 %45
  store i8 0, ptr %46, align 1
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  br label %49

49:                                               ; preds = %67, %41
  %50 = load ptr, ptr %3, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %50, i64 %52
  %54 = load i8, ptr %53, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %55, 32
  br i1 %56, label %57, label %65

57:                                               ; preds = %49
  %58 = load ptr, ptr %3, align 8
  %59 = load i32, ptr %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, ptr %58, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp ne i32 %63, 0
  br label %65

65:                                               ; preds = %57, %49
  %66 = phi i1 [ false, %49 ], [ %64, %57 ]
  br i1 %66, label %67, label %89

67:                                               ; preds = %65
  %68 = load ptr, ptr %3, align 8
  %69 = load i32, ptr %5, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, ptr %68, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = sext i8 %72 to i32
  %74 = call i32 @tolower(i32 noundef %73) #5
  %75 = trunc i32 %74 to i8
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.Person, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %6, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %6, align 4
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds [256 x i8], ptr %77, i64 0, i64 %80
  store i8 %75, ptr %81, align 1
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.Person, ptr %82, i32 0, i32 1
  %84 = load i32, ptr %6, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [256 x i8], ptr %83, i64 0, i64 %85
  store i8 0, ptr %86, align 1
  %87 = load i32, ptr %5, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %5, align 4
  br label %49, !llvm.loop !8

89:                                               ; preds = %65
  %90 = load ptr, ptr %3, align 8
  %91 = load i32, ptr %5, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, ptr %90, i64 %92
  %94 = getelementptr inbounds i8, ptr %93, i64 1
  %95 = call i32 @atoi(ptr noundef %94) #5
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.Person, ptr %96, i32 0, i32 2
  store i32 %95, ptr %97, align 4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [256 x i8], align 16
  %7 = alloca %struct.Person, align 4
  %8 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %9 = load i32, ptr %4, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 0
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %14)
  store i32 1, ptr %3, align 4
  br label %47

16:                                               ; preds = %2
  %17 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call ptr @strcpy(ptr noundef %17, ptr noundef %20) #6
  %22 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  call void @extractName(ptr noundef %22, ptr noundef %7)
  %23 = getelementptr inbounds %struct.Person, ptr %7, i32 0, i32 0
  %24 = getelementptr inbounds [256 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %24)
  %26 = getelementptr inbounds %struct.Person, ptr %7, i32 0, i32 1
  %27 = getelementptr inbounds [256 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %27)
  %29 = getelementptr inbounds %struct.Person, ptr %7, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %30)
  %32 = getelementptr inbounds %struct.Person, ptr %7, i32 0, i32 0
  %33 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 0
  %34 = call i64 @strlen(ptr noundef %33) #5
  %35 = add i64 %34, 10
  %36 = add i64 %35, 2
  %37 = call noalias ptr @malloc(i64 noundef %36) #7
  store ptr %37, ptr %8, align 8
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct.Person, ptr %7, i32 0, i32 0
  %40 = getelementptr inbounds [256 x i8], ptr %39, i64 0, i64 0
  %41 = call ptr @strcpy(ptr noundef %38, ptr noundef %40) #6
  %42 = load ptr, ptr %8, align 8
  %43 = call ptr @strcat(ptr noundef %42, ptr noundef @.str.4) #6
  %44 = load ptr, ptr %8, align 8
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %44)
  %46 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %46) #6
  store i32 0, ptr %3, align 4
  br label %47

47:                                               ; preds = %16, %11
  %48 = load i32, ptr %3, align 4
  ret i32 %48
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind }
attributes #7 = { nounwind allocsize(0) }

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
