; ModuleID = 'DATASETv2/gemini_pro-26019.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @move_car(ptr noundef %0, i8 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  switch i32 %6, label %27 [
    i32 119, label %7
    i32 115, label %12
    i32 97, label %17
    i32 100, label %22
  ]

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.car, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, ptr %9, align 4
  br label %27

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.car, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 4
  br label %27

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.car, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %19, align 4
  br label %27

22:                                               ; preds = %2
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.car, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %24, align 4
  br label %27

27:                                               ; preds = %2, %22, %17, %12, %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_car(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.car, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.car, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5, i32 noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.car, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.car, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, 1
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13, i32 noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.car, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.car, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %25, 2
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22, i32 noundef %26)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.car, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %31, 1
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.car, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 4
  %36 = add nsw i32 %35, 1
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32, i32 noundef %36)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds %struct.car, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, 2
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.car, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %42, i32 noundef %45)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds %struct.car, ptr %48, i32 0, i32 1
  %50 = load i32, ptr %49, align 4
  %51 = add nsw i32 %50, 2
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.car, ptr %52, i32 0, i32 0
  %54 = load i32, ptr %53, align 4
  %55 = add nsw i32 %54, 2
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %51, i32 noundef %55)
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.car, align 4
  %3 = alloca %struct.termios, align 4
  %4 = alloca %struct.termios, align 4
  %5 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const.main.car, i64 12, i1 false)
  %6 = call i32 @tcgetattr(i32 noundef 0, ptr noundef %3) #4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %3, i64 60, i1 false)
  %7 = getelementptr inbounds %struct.termios, ptr %4, i32 0, i32 3
  %8 = load i32, ptr %7, align 4
  %9 = and i32 %8, -11
  store i32 %9, ptr %7, align 4
  %10 = call i32 @tcsetattr(i32 noundef 0, i32 noundef 0, ptr noundef %4) #4
  br label %11

11:                                               ; preds = %0, %18
  call void @draw_car(ptr noundef %2)
  %12 = call i32 @getchar()
  %13 = trunc i32 %12 to i8
  store i8 %13, ptr %5, align 1
  %14 = load i8, ptr %5, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 113
  br i1 %16, label %17, label %18

17:                                               ; preds = %11
  br label %20

18:                                               ; preds = %11
  %19 = load i8, ptr %5, align 1
  call void @move_car(ptr noundef %2, i8 noundef signext %19)
  br label %11

20:                                               ; preds = %17
  %21 = call i32 @tcsetattr(i32 noundef 0, i32 noundef 0, ptr noundef %3) #4
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i32 @tcgetattr(i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare i32 @tcsetattr(i32 noundef, i32 noundef, ptr noundef) #3

declare i32 @getchar() #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
