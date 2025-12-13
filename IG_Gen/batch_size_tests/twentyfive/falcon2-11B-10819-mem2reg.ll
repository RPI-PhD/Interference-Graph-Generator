; ModuleID = 'LLVM_IR/falcon2-11B-10819.ll'
source_filename = "DATASETv2/falcon2-11B-10819.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Spaceship = type { [50 x i8], i32, i32, i32 }

@.str = private unnamed_addr constant [27 x i8] c"Initializing spaceship...\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"Name: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Speed: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Fuel: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Health: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Navigating spaceship...\0A\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"Collecting resources...\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Avoiding obstacles...\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"Returning to home planet...\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initializeSpaceship(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.Spaceship, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %4)
  %6 = getelementptr inbounds %struct.Spaceship, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %7)
  %9 = getelementptr inbounds %struct.Spaceship, ptr %0, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %10)
  %12 = getelementptr inbounds %struct.Spaceship, ptr %0, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %13)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @navigateSpaceship(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @collectResources(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @avoidObstacles(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @returnToHome(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Spaceship, align 4
  call void @initializeSpaceship(ptr noundef %1)
  call void @navigateSpaceship(ptr noundef %1)
  call void @collectResources(ptr noundef %1)
  call void @avoidObstacles(ptr noundef %1)
  call void @returnToHome(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
