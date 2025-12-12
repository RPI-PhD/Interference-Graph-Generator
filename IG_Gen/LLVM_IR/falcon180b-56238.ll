; ModuleID = 'DATASETv2/falcon180b-56238.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @parse_email(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %9 = call noalias ptr @malloc(i64 noundef 32) #5
  store ptr %9, ptr %3, align 8
  %10 = call noalias ptr @malloc(i64 noundef 1024) #5
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.Email, ptr %11, i32 0, i32 0
  store ptr %10, ptr %12, align 8
  %13 = call noalias ptr @malloc(i64 noundef 1024) #5
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Email, ptr %14, i32 0, i32 1
  store ptr %13, ptr %15, align 8
  %16 = call noalias ptr @malloc(i64 noundef 1024) #5
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.Email, ptr %17, i32 0, i32 2
  store ptr %16, ptr %18, align 8
  %19 = call noalias ptr @malloc(i64 noundef 10240) #5
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.Email, ptr %20, i32 0, i32 3
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = call ptr @strtok(ptr noundef %22, ptr noundef @.str) #6
  store ptr %23, ptr %4, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.Email, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = call ptr @strcpy(ptr noundef %26, ptr noundef %27) #6
  %29 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #6
  store ptr %29, ptr %5, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = call ptr @strtok(ptr noundef %30, ptr noundef @.str.1) #6
  store ptr %31, ptr %6, align 8
  %32 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #6
  store ptr %32, ptr %7, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.Email, ptr %33, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = call ptr @strcpy(ptr noundef %35, ptr noundef %36) #6
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.Email, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = call ptr @strcpy(ptr noundef %40, ptr noundef %41) #6
  %43 = call ptr @strtok(ptr noundef null, ptr noundef @.str.2) #6
  store ptr %43, ptr %8, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.Email, ptr %44, i32 0, i32 3
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %8, align 8
  %48 = call ptr @strcat(ptr noundef %46, ptr noundef %47) #6
  %49 = load ptr, ptr %3, align 8
  ret ptr %49
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_email(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Email, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Email, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Email, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Email, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %17)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1024 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %3, align 8
  %5 = call noalias ptr @fopen(ptr noundef @.str.7, ptr noundef @.str.8)
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #7
  unreachable

10:                                               ; preds = %0
  br label %11

11:                                               ; preds = %21, %10
  %12 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %13 = load ptr, ptr %4, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 1024, ptr noundef %13)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load ptr, ptr %3, align 8
  call void @print_email(ptr noundef %20)
  br label %21

21:                                               ; preds = %19, %16
  %22 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %23 = call ptr @parse_email(ptr noundef %22)
  store ptr %23, ptr %3, align 8
  br label %11, !llvm.loop !6

24:                                               ; preds = %11
  %25 = load ptr, ptr %3, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %24
  %28 = load ptr, ptr %3, align 8
  call void @print_email(ptr noundef %28)
  br label %29

29:                                               ; preds = %27, %24
  %30 = load ptr, ptr %4, align 8
  %31 = call i32 @fclose(ptr noundef %30)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
