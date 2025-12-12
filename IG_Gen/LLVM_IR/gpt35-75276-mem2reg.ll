; ModuleID = 'LLVM_IR/gpt35-75276.ll'
source_filename = "DATASETv2/gpt35-75276.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.message = type { i64, [100 x i8] }

@.str = private unnamed_addr constant [5 x i8] c"prog\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"msgget\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Message queue created with id %d and key %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Child process\0A\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"Message received from parent:\0A%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"Hello parent, I am your child with pid %d\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Parent process with child pid %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [42 x i8] c"Hello child, I am your parent with pid %d\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Message received from child:\0A%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"fork\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.message, align 8
  %2 = call i32 @ftok(ptr noundef @.str, i32 noundef 97) #5
  %3 = call i32 @msgget(i32 noundef %2, i32 noundef 950) #5
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  call void @perror(ptr noundef @.str.1) #6
  call void @exit(i32 noundef 1) #7
  unreachable

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %3, i32 noundef %2)
  %8 = call i32 @fork() #5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %22

10:                                               ; preds = %6
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %12 = call i64 @msgrcv(i32 noundef %3, ptr noundef %1, i64 noundef 112, i64 noundef 1, i32 noundef 0)
  %13 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 1
  %14 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %14)
  %16 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 1
  %17 = getelementptr inbounds [100 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 @getpid() #5
  %19 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %17, ptr noundef @.str.5, i32 noundef %18) #5
  %20 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 0
  store i64 2, ptr %20, align 8
  %21 = call i32 @msgsnd(i32 noundef %3, ptr noundef %1, i64 noundef 112, i32 noundef 0)
  br label %38

22:                                               ; preds = %6
  %23 = icmp sgt i32 %8, 0
  br i1 %23, label %24, label %36

24:                                               ; preds = %22
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %8)
  %26 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 1
  %27 = getelementptr inbounds [100 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 @getpid() #5
  %29 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %27, ptr noundef @.str.7, i32 noundef %28) #5
  %30 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 0
  store i64 1, ptr %30, align 8
  %31 = call i32 @msgsnd(i32 noundef %3, ptr noundef %1, i64 noundef 112, i32 noundef 0)
  %32 = call i64 @msgrcv(i32 noundef %3, ptr noundef %1, i64 noundef 112, i64 noundef 2, i32 noundef 0)
  %33 = getelementptr inbounds %struct.message, ptr %1, i32 0, i32 1
  %34 = getelementptr inbounds [100 x i8], ptr %33, i64 0, i64 0
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %34)
  br label %37

36:                                               ; preds = %22
  call void @perror(ptr noundef @.str.9) #6
  call void @exit(i32 noundef 1) #7
  unreachable

37:                                               ; preds = %24
  br label %38

38:                                               ; preds = %37, %10
  %39 = call i32 @msgctl(i32 noundef %3, i32 noundef 0, ptr noundef null) #5
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @ftok(ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @msgget(i32 noundef, i32 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare i32 @fork() #1

declare i64 @msgrcv(i32 noundef, ptr noundef, i64 noundef, i64 noundef, i32 noundef) #4

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @getpid() #1

declare i32 @msgsnd(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #4

; Function Attrs: nounwind
declare i32 @msgctl(i32 noundef, i32 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
