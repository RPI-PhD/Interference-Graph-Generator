; ModuleID = 'LLVM_IR/gemma7b-10809.ll'
source_filename = "DATASETv2/gemma7b-10809.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { ptr, ptr }

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"int main() {\0A  printf(\22Hello, world!\22);\0A}\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @parse_c_syntax(ptr noundef %0) #0 {
  %2 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #6
  br label %3

3:                                                ; preds = %25, %1
  %.02 = phi ptr [ %2, %1 ], [ %26, %25 ]
  %.01 = phi ptr [ null, %1 ], [ %.2, %25 ]
  %4 = icmp ne ptr %.02, null
  br i1 %4, label %5, label %27

5:                                                ; preds = %3
  %6 = call ptr @strstr(ptr noundef %.02, ptr noundef @.str.1) #7
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %25

8:                                                ; preds = %5
  %9 = call i64 @strlen(ptr noundef %6) #7
  %10 = trunc i64 %9 to i32
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = call noalias ptr @malloc(i64 noundef %12) #8
  %14 = sext i32 %10 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %13, ptr align 1 %13, i64 %14, i1 false)
  %15 = sext i32 %10 to i64
  %16 = getelementptr inbounds i8, ptr %13, i64 %15
  store i8 0, ptr %16, align 1
  %17 = call noalias ptr @malloc(i64 noundef 16) #8
  %18 = getelementptr inbounds %struct.Node, ptr %17, i32 0, i32 0
  store ptr %13, ptr %18, align 8
  %19 = getelementptr inbounds %struct.Node, ptr %17, i32 0, i32 1
  store ptr null, ptr %19, align 8
  %20 = icmp ne ptr %.01, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %8
  %22 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  store ptr %17, ptr %22, align 8
  br label %24

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %23, %21
  %.1 = phi ptr [ %.01, %21 ], [ %17, %23 ]
  br label %25

25:                                               ; preds = %24, %5
  %.2 = phi ptr [ %.1, %24 ], [ %.01, %5 ]
  %26 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #6
  br label %3, !llvm.loop !6

27:                                               ; preds = %3
  br label %28

28:                                               ; preds = %30, %27
  %.0 = phi ptr [ %.01, %27 ], [ %35, %30 ]
  %29 = icmp ne ptr %.0, null
  br i1 %29, label %30, label %36

30:                                               ; preds = %28
  %31 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %32)
  %34 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8
  br label %28, !llvm.loop !8

36:                                               ; preds = %28
  call void @free(ptr noundef %.01) #6
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @parse_c_syntax(ptr noundef @.str.3)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind allocsize(0) }

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
