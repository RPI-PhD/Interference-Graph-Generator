; ModuleID = 'LLVM_IR/falcon180b-56238.ll'
source_filename = "DATASETv2/falcon180b-56238.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Email = type { ptr, ptr, ptr, ptr }

@.str = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Subject: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"From: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"To: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Body:\0A%s\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"emails.txt\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"Error opening file.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @parse_email(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 32) #5
  %3 = call noalias ptr @malloc(i64 noundef 1024) #5
  %4 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 0
  store ptr %3, ptr %4, align 8
  %5 = call noalias ptr @malloc(i64 noundef 1024) #5
  %6 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 1
  store ptr %5, ptr %6, align 8
  %7 = call noalias ptr @malloc(i64 noundef 1024) #5
  %8 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 2
  store ptr %7, ptr %8, align 8
  %9 = call noalias ptr @malloc(i64 noundef 10240) #5
  %10 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 3
  store ptr %9, ptr %10, align 8
  %11 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #6
  %12 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = call ptr @strcpy(ptr noundef %13, ptr noundef %11) #6
  %15 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #6
  %16 = call ptr @strtok(ptr noundef %15, ptr noundef @.str.1) #6
  %17 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #6
  %18 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = call ptr @strcpy(ptr noundef %19, ptr noundef %16) #6
  %21 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = call ptr @strcpy(ptr noundef %22, ptr noundef %17) #6
  %24 = call ptr @strtok(ptr noundef null, ptr noundef @.str.2) #6
  %25 = getelementptr inbounds %struct.Email, ptr %2, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = call ptr @strcat(ptr noundef %26, ptr noundef %24) #6
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_email(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Email, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %3)
  %5 = getelementptr inbounds %struct.Email, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %6)
  %8 = getelementptr inbounds %struct.Email, ptr %0, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %9)
  %11 = getelementptr inbounds %struct.Email, ptr %0, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %12)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = call noalias ptr @fopen(ptr noundef @.str.7, ptr noundef @.str.8)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #7
  unreachable

6:                                                ; preds = %0
  br label %7

7:                                                ; preds = %14, %6
  %.0 = phi ptr [ null, %6 ], [ %16, %14 ]
  %8 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %9 = call ptr @fgets(ptr noundef %8, i32 noundef 1024, ptr noundef %2)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %7
  %12 = icmp ne ptr %.0, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  call void @print_email(ptr noundef %.0)
  br label %14

14:                                               ; preds = %13, %11
  %15 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %16 = call ptr @parse_email(ptr noundef %15)
  br label %7, !llvm.loop !6

17:                                               ; preds = %7
  %18 = icmp ne ptr %.0, null
  br i1 %18, label %19, label %20

19:                                               ; preds = %17
  call void @print_email(ptr noundef %.0)
  br label %20

20:                                               ; preds = %19, %17
  %21 = call i32 @fclose(ptr noundef %2)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

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
