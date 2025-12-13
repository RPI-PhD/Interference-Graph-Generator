; ModuleID = 'LLVM_IR/gpt4o_mini-11745.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_element(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 1288) #8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Element, ptr %3, i32 0, i32 0
  %8 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %9 = call ptr @strncpy(ptr noundef %8, ptr noundef %0, i64 noundef 256) #11
  %10 = getelementptr inbounds %struct.Element, ptr %3, i32 0, i32 1
  %11 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @strncpy(ptr noundef %11, ptr noundef %1, i64 noundef 1024) #11
  %13 = getelementptr inbounds %struct.Element, ptr %3, i32 0, i32 2
  store ptr null, ptr %13, align 8
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_elements(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi ptr [ %0, %1 ], [ %6, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Element, ptr %.0, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %.0) #11
  br label %2, !llvm.loop !6

7:                                                ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @parse_xml(ptr noundef %0) #0 {
  %2 = alloca [1024 x i8], align 16
  %3 = alloca [256 x i8], align 16
  %4 = alloca [1024 x i8], align 16
  %5 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.1)
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %1
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

8:                                                ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 256, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %4, i8 0, i64 1024, i1 false)
  br label %9

9:                                                ; preds = %62, %8
  %.05 = phi ptr [ null, %8 ], [ %.49, %62 ]
  %.02 = phi i32 [ 0, %8 ], [ %.24, %62 ]
  %.01 = phi ptr [ null, %8 ], [ %.4, %62 ]
  %10 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %11 = call ptr @fgets(ptr noundef %10, i32 noundef 1024, ptr noundef %5)
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %63

13:                                               ; preds = %9
  %14 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %15 = call ptr @strchr(ptr noundef %14, i32 noundef 60) #12
  %16 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %17 = call ptr @strchr(ptr noundef %16, i32 noundef 62) #12
  %18 = icmp ne ptr %15, null
  br i1 %18, label %19, label %51

19:                                               ; preds = %13
  %20 = icmp ne ptr %17, null
  br i1 %20, label %21, label %51

21:                                               ; preds = %19
  %22 = icmp ult ptr %15, %17
  br i1 %22, label %23, label %51

23:                                               ; preds = %21
  store i8 0, ptr %17, align 1
  %24 = getelementptr inbounds i8, ptr %15, i64 1
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 47
  br i1 %27, label %28, label %43

28:                                               ; preds = %23
  %29 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %30 = call i64 @strlen(ptr noundef %29) #12
  %31 = icmp ugt i64 %30, 0
  br i1 %31, label %32, label %42

32:                                               ; preds = %28
  %33 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %34 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %35 = call ptr @create_element(ptr noundef %33, ptr noundef %34)
  %36 = icmp ne ptr %.05, null
  br i1 %36, label %38, label %37

37:                                               ; preds = %32
  br label %40

38:                                               ; preds = %32
  %39 = getelementptr inbounds %struct.Element, ptr %.01, i32 0, i32 2
  store ptr %35, ptr %39, align 8
  br label %40

40:                                               ; preds = %38, %37
  %.16 = phi ptr [ %.05, %38 ], [ %35, %37 ]
  %41 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  store i8 0, ptr %41, align 16
  br label %42

42:                                               ; preds = %40, %28
  %.27 = phi ptr [ %.16, %40 ], [ %.05, %28 ]
  %.2 = phi ptr [ %35, %40 ], [ %.01, %28 ]
  br label %50

43:                                               ; preds = %23
  %44 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %45 = getelementptr inbounds i8, ptr %15, i64 1
  %46 = call ptr @strcpy(ptr noundef %44, ptr noundef %45) #11
  %47 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %48 = call i64 @strcspn(ptr noundef %47, ptr noundef @.str.3) #12
  %49 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 %48
  store i8 0, ptr %49, align 1
  br label %50

50:                                               ; preds = %43, %42
  %.38 = phi ptr [ %.27, %42 ], [ %.05, %43 ]
  %.13 = phi i32 [ %.02, %42 ], [ 1, %43 ]
  %.3 = phi ptr [ %.2, %42 ], [ %.01, %43 ]
  br label %62

51:                                               ; preds = %21, %19, %13
  %52 = icmp ne i32 %.02, 0
  br i1 %52, label %53, label %61

53:                                               ; preds = %51
  %54 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %55 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %56 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %57 = call i64 @strlen(ptr noundef %56) #12
  %58 = sub i64 1024, %57
  %59 = sub i64 %58, 1
  %60 = call ptr @strncat(ptr noundef %54, ptr noundef %55, i64 noundef %59) #11
  br label %61

61:                                               ; preds = %53, %51
  br label %62

62:                                               ; preds = %61, %50
  %.49 = phi ptr [ %.38, %50 ], [ %.05, %61 ]
  %.24 = phi i32 [ %.13, %50 ], [ %.02, %61 ]
  %.4 = phi ptr [ %.3, %50 ], [ %.01, %61 ]
  br label %9, !llvm.loop !8

63:                                               ; preds = %9
  %64 = call i32 @fclose(ptr noundef %5)
  br label %65

65:                                               ; preds = %67, %63
  %.0 = phi ptr [ %.05, %63 ], [ %74, %67 ]
  %66 = icmp ne ptr %.0, null
  br i1 %66, label %67, label %75

67:                                               ; preds = %65
  %68 = getelementptr inbounds %struct.Element, ptr %.0, i32 0, i32 0
  %69 = getelementptr inbounds [256 x i8], ptr %68, i64 0, i64 0
  %70 = getelementptr inbounds %struct.Element, ptr %.0, i32 0, i32 1
  %71 = getelementptr inbounds [1024 x i8], ptr %70, i64 0, i64 0
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %69, ptr noundef %71)
  %73 = getelementptr inbounds %struct.Element, ptr %.0, i32 0, i32 2
  %74 = load ptr, ptr %73, align 8
  br label %65, !llvm.loop !9

75:                                               ; preds = %65
  call void @free_elements(ptr noundef %.05)
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne i32 %0, 2
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8
  %6 = getelementptr inbounds ptr, ptr %1, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.5, ptr noundef %7)
  br label %12

9:                                                ; preds = %2
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  call void @parse_xml(ptr noundef %11)
  br label %12

12:                                               ; preds = %9, %4
  %.0 = phi i32 [ 1, %4 ], [ 0, %9 ]
  ret i32 %.0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
