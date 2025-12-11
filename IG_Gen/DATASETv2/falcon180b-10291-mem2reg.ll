; ModuleID = 'DATASETv2/falcon180b-10291.ll'
source_filename = "DATASETv2/falcon180b-10291.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [14 x i8] c"socket failed\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"bind failed\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"server is listening\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"accept failed\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"server is busy\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = getelementptr inbounds ptr, ptr %1, i64 1
  %7 = load ptr, ptr %6, align 8
  %8 = sext i32 5 to i64
  %9 = mul i64 %8, 4
  %10 = call noalias ptr @malloc(i64 noundef %9) #7
  br label %11

11:                                               ; preds = %16, %2
  %.01 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %12 = icmp slt i32 %.01, 5
  br i1 %12, label %13, label %18

13:                                               ; preds = %11
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds i32, ptr %10, i64 %14
  store i32 -1, ptr %15, align 4
  br label %16

16:                                               ; preds = %13
  %17 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !6

18:                                               ; preds = %11
  %19 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %18
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 0) #9
  unreachable

23:                                               ; preds = %18
  call void @llvm.memset.p0.i64(ptr align 4 %4, i8 0, i64 16, i1 false)
  %24 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %24, align 4
  %25 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %26 = getelementptr inbounds %struct.in_addr, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 4
  %27 = trunc i32 8080 to i16
  %28 = call zeroext i16 @htons(i16 noundef zeroext %27) #10
  %29 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %28, ptr %29, align 2
  %30 = call i32 @bind(i32 noundef %19, ptr noundef %4, i32 noundef 16) #8
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %23
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 0) #9
  unreachable

34:                                               ; preds = %23
  %35 = call i32 @listen(i32 noundef %19, i32 noundef 5) #8
  %36 = call i32 @puts(ptr noundef @.str.2)
  br label %37

37:                                               ; preds = %61, %34
  %.02 = phi i32 [ 0, %34 ], [ %.1, %61 ]
  store i32 16, ptr %3, align 4
  %38 = call i32 @accept(i32 noundef %19, ptr noundef %5, ptr noundef %3)
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %37
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 0) #9
  unreachable

42:                                               ; preds = %37
  br label %43

43:                                               ; preds = %54, %42
  %.0 = phi i32 [ 0, %42 ], [ %55, %54 ]
  %44 = icmp slt i32 %.0, 5
  br i1 %44, label %45, label %56

45:                                               ; preds = %43
  %46 = sext i32 %.0 to i64
  %47 = getelementptr inbounds i32, ptr %10, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp eq i32 %48, -1
  br i1 %49, label %50, label %53

50:                                               ; preds = %45
  %51 = sext i32 %.0 to i64
  %52 = getelementptr inbounds i32, ptr %10, i64 %51
  store i32 %38, ptr %52, align 4
  br label %56

53:                                               ; preds = %45
  br label %54

54:                                               ; preds = %53
  %55 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !8

56:                                               ; preds = %50, %43
  %.1 = phi i32 [ 1, %50 ], [ %.02, %43 ]
  %57 = icmp eq i32 %.1, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %56
  %59 = call i64 @send(i32 noundef %38, ptr noundef @.str.4, i64 noundef 15, i32 noundef 0)
  %60 = call i32 @close(i32 noundef %38)
  br label %61

61:                                               ; preds = %58, %56
  br label %37
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #6

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #2

declare i32 @puts(ptr noundef) #3

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #3

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #3

declare i32 @close(i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(none) }

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
