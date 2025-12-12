; ModuleID = 'LLVM_IR/gemini_pro-26019.ll'
source_filename = "DATASETv2/gemini_pro-26019.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.car = type { i32, i32, i8 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

@.str = private unnamed_addr constant [9 x i8] c"\1B[%d;%dH\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"|\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"___\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"|===|\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"/   \\\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"|\1B[31m|_|\1B[0m|\00", align 1
@__const.main.car = private unnamed_addr constant %struct.car { i32 0, i32 0, i8 119 }, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @move_car(ptr noundef %0, i8 noundef signext %1) #0 {
  %3 = sext i8 %1 to i32
  switch i32 %3, label %20 [
    i32 119, label %4
    i32 115, label %8
    i32 97, label %12
    i32 100, label %16
  ]

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, ptr %5, align 4
  br label %20

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %9, align 4
  br label %20

12:                                               ; preds = %2
  %13 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %13, align 4
  br label %20

16:                                               ; preds = %2
  %17 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 4
  br label %20

20:                                               ; preds = %16, %12, %8, %4, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_car(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3, i32 noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 1
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %15 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %16, i32 noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %22 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 1
  %25 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef %27)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %30 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %31, 2
  %33 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %34 = load i32, ptr %33, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32, i32 noundef %34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %37 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, 2
  %40 = getelementptr inbounds %struct.car, ptr %0, i32 0, i32 0
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, 2
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %39, i32 noundef %42)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.car, align 4
  %2 = alloca %struct.termios, align 4
  %3 = alloca %struct.termios, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 @__const.main.car, i64 12, i1 false)
  %4 = call i32 @tcgetattr(i32 noundef 0, ptr noundef %2) #4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %2, i64 60, i1 false)
  %5 = getelementptr inbounds %struct.termios, ptr %3, i32 0, i32 3
  %6 = load i32, ptr %5, align 4
  %7 = and i32 %6, -11
  store i32 %7, ptr %5, align 4
  %8 = call i32 @tcsetattr(i32 noundef 0, i32 noundef 0, ptr noundef %3) #4
  br label %9

9:                                                ; preds = %15, %0
  call void @draw_car(ptr noundef %1)
  %10 = call i32 @getchar()
  %11 = trunc i32 %10 to i8
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 113
  br i1 %13, label %14, label %15

14:                                               ; preds = %9
  br label %16

15:                                               ; preds = %9
  call void @move_car(ptr noundef %1, i8 noundef signext %11)
  br label %9

16:                                               ; preds = %14
  %17 = call i32 @tcsetattr(i32 noundef 0, i32 noundef 0, ptr noundef %2) #4
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i32 @tcgetattr(i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare i32 @tcsetattr(i32 noundef, i32 noundef, ptr noundef) #3

declare i32 @getchar() #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
