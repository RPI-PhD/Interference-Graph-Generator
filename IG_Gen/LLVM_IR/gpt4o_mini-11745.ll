; ModuleID = 'DATASETv2/gpt4o_mini-11745.c'
source_filename = "DATASETv2/gpt4o_mini-11745.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Element = type { [256 x i8], [1024 x i8], ptr }

@.str = private unnamed_addr constant [41 x i8] c"Failed to allocate memory for an Element\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not open XML file\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"Tag: %s, Content: %s\0A\00", align 1
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [22 x i8] c"Usage: %s <filename>\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_element(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call noalias ptr @malloc(i64 noundef 1288) #8
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %2
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.Element, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr %3, align 8
  %15 = call ptr @strncpy(ptr noundef %13, ptr noundef %14, i64 noundef 256) #11
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.Element, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [1024 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %4, align 8
  %20 = call ptr @strncpy(ptr noundef %18, ptr noundef %19, i64 noundef 1024) #11
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.Element, ptr %21, i32 0, i32 2
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  ret ptr %23
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_elements(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %7, %1
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Element, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %2, align 8
  %12 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %12) #11
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @parse_xml(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [1024 x i8], align 16
  %5 = alloca [256 x i8], align 16
  %6 = alloca [1024 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call noalias ptr @fopen(ptr noundef %15, ptr noundef @.str.1)
  store ptr %16, ptr %3, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %20, label %19

19:                                               ; preds = %1
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

20:                                               ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 256, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 1024, i1 false)
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store ptr null, ptr %9, align 8
  store ptr null, ptr %10, align 8
  br label %21

21:                                               ; preds = %89, %20
  %22 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %23 = load ptr, ptr %3, align 8
  %24 = call ptr @fgets(ptr noundef %22, i32 noundef 1024, ptr noundef %23)
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %90

26:                                               ; preds = %21
  %27 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %28 = call ptr @strchr(ptr noundef %27, i32 noundef 60) #12
  store ptr %28, ptr %11, align 8
  %29 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %30 = call ptr @strchr(ptr noundef %29, i32 noundef 62) #12
  store ptr %30, ptr %12, align 8
  %31 = load ptr, ptr %11, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %77

33:                                               ; preds = %26
  %34 = load ptr, ptr %12, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %77

36:                                               ; preds = %33
  %37 = load ptr, ptr %11, align 8
  %38 = load ptr, ptr %12, align 8
  %39 = icmp ult ptr %37, %38
  br i1 %39, label %40, label %77

40:                                               ; preds = %36
  %41 = load ptr, ptr %12, align 8
  store i8 0, ptr %41, align 1
  %42 = load ptr, ptr %11, align 8
  %43 = getelementptr inbounds i8, ptr %42, i64 1
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 47
  br i1 %46, label %47, label %68

47:                                               ; preds = %40
  store i32 0, ptr %7, align 4
  %48 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %49 = call i64 @strlen(ptr noundef %48) #12
  %50 = icmp ugt i64 %49, 0
  br i1 %50, label %51, label %67

51:                                               ; preds = %47
  %52 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %53 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %54 = call ptr @create_element(ptr noundef %52, ptr noundef %53)
  store ptr %54, ptr %13, align 8
  %55 = load ptr, ptr %9, align 8
  %56 = icmp ne ptr %55, null
  br i1 %56, label %60, label %57

57:                                               ; preds = %51
  %58 = load ptr, ptr %13, align 8
  store ptr %58, ptr %9, align 8
  %59 = load ptr, ptr %13, align 8
  store ptr %59, ptr %10, align 8
  br label %65

60:                                               ; preds = %51
  %61 = load ptr, ptr %13, align 8
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr inbounds %struct.Element, ptr %62, i32 0, i32 2
  store ptr %61, ptr %63, align 8
  %64 = load ptr, ptr %13, align 8
  store ptr %64, ptr %10, align 8
  br label %65

65:                                               ; preds = %60, %57
  %66 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  store i8 0, ptr %66, align 16
  br label %67

67:                                               ; preds = %65, %47
  br label %76

68:                                               ; preds = %40
  store i32 1, ptr %7, align 4
  %69 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %70 = load ptr, ptr %11, align 8
  %71 = getelementptr inbounds i8, ptr %70, i64 1
  %72 = call ptr @strcpy(ptr noundef %69, ptr noundef %71) #11
  %73 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %74 = call i64 @strcspn(ptr noundef %73, ptr noundef @.str.3) #12
  %75 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 %74
  store i8 0, ptr %75, align 1
  store i32 1, ptr %8, align 4
  br label %76

76:                                               ; preds = %68, %67
  br label %89

77:                                               ; preds = %36, %33, %26
  %78 = load i32, ptr %8, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %88

80:                                               ; preds = %77
  %81 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %82 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %83 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %84 = call i64 @strlen(ptr noundef %83) #12
  %85 = sub i64 1024, %84
  %86 = sub i64 %85, 1
  %87 = call ptr @strncat(ptr noundef %81, ptr noundef %82, i64 noundef %86) #11
  br label %88

88:                                               ; preds = %80, %77
  br label %89

89:                                               ; preds = %88, %76
  br label %21, !llvm.loop !8

90:                                               ; preds = %21
  %91 = load ptr, ptr %3, align 8
  %92 = call i32 @fclose(ptr noundef %91)
  %93 = load ptr, ptr %9, align 8
  store ptr %93, ptr %14, align 8
  br label %94

94:                                               ; preds = %97, %90
  %95 = load ptr, ptr %14, align 8
  %96 = icmp ne ptr %95, null
  br i1 %96, label %97, label %108

97:                                               ; preds = %94
  %98 = load ptr, ptr %14, align 8
  %99 = getelementptr inbounds %struct.Element, ptr %98, i32 0, i32 0
  %100 = getelementptr inbounds [256 x i8], ptr %99, i64 0, i64 0
  %101 = load ptr, ptr %14, align 8
  %102 = getelementptr inbounds %struct.Element, ptr %101, i32 0, i32 1
  %103 = getelementptr inbounds [1024 x i8], ptr %102, i64 0, i64 0
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %100, ptr noundef %103)
  %105 = load ptr, ptr %14, align 8
  %106 = getelementptr inbounds %struct.Element, ptr %105, i32 0, i32 2
  %107 = load ptr, ptr %106, align 8
  store ptr %107, ptr %14, align 8
  br label %94, !llvm.loop !9

108:                                              ; preds = %94
  %109 = load ptr, ptr %9, align 8
  call void @free_elements(ptr noundef %109)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #7

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #7

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #7

; Function Attrs: nounwind
declare ptr @strncat(ptr noundef, ptr noundef, i64 noundef) #4

declare i32 @fclose(ptr noundef) #5

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %8, label %14

8:                                                ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.5, ptr noundef %12)
  store i32 1, ptr %3, align 4
  br label %18

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  call void @parse_xml(ptr noundef %17)
  store i32 0, ptr %3, align 4
  br label %18

18:                                               ; preds = %14, %8
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { nounwind willreturn memory(read) }

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
