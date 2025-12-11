; ModuleID = 'DATASETv2/gemini_pro-31352.ll'
source_filename = "DATASETv2/gemini_pro-31352.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list = type { ptr, ptr }
%struct.node = type { ptr, ptr, ptr }

@.str = private unnamed_addr constant [9 x i8] c"%s <%s>\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"Ken\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"thompson@bell-labs.com\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Dennis\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"ritchie@bell-labs.com\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"Brian\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"kernighan@bell-labs.com\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_list() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 16) #4
  %2 = getelementptr inbounds %struct.list, ptr %1, i32 0, i32 0
  store ptr null, ptr %2, align 8
  %3 = getelementptr inbounds %struct.list, ptr %1, i32 0, i32 1
  store ptr null, ptr %3, align 8
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_node(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 24) #4
  %5 = call noalias ptr @strdup(ptr noundef %1) #5
  %6 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = call noalias ptr @strdup(ptr noundef %2) #5
  %8 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1
  store ptr %7, ptr %8, align 8
  %9 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 2
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %16

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 0
  store ptr %4, ptr %14, align 8
  %15 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 1
  store ptr %4, ptr %15, align 8
  br label %21

16:                                               ; preds = %3
  %17 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 2
  store ptr %4, ptr %19, align 8
  %20 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 1
  store ptr %4, ptr %20, align 8
  br label %21

21:                                               ; preds = %16, %13
  ret void
}

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_list(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  br label %4

4:                                                ; preds = %6, %1
  %.0 = phi ptr [ %3, %1 ], [ %13, %6 ]
  %5 = icmp ne ptr %.0, null
  br i1 %5, label %6, label %14

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %8, ptr noundef %10)
  %12 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  br label %4, !llvm.loop !6

14:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_list(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.list, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  br label %4

4:                                                ; preds = %6, %1
  %.0 = phi ptr [ %3, %1 ], [ %8, %6 ]
  %5 = icmp ne ptr %.0, null
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10) #5
  %11 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %12) #5
  call void @free(ptr noundef %.0) #5
  br label %4, !llvm.loop !8

13:                                               ; preds = %4
  call void @free(ptr noundef %0) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_list()
  call void @add_node(ptr noundef %1, ptr noundef @.str.1, ptr noundef @.str.2)
  call void @add_node(ptr noundef %1, ptr noundef @.str.3, ptr noundef @.str.4)
  call void @add_node(ptr noundef %1, ptr noundef @.str.5, ptr noundef @.str.6)
  call void @print_list(ptr noundef %1)
  call void @free_list(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
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
!8 = distinct !{!8, !7}
