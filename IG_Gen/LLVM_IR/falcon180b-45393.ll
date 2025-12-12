; ModuleID = 'DATASETv2/falcon180b-45393.c'
source_filename = "DATASETv2/falcon180b-45393.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Internet speed: %.2f Mbps\0A\00", align 1
@.str.1 = private unnamed_addr constant [73 x i8] c"https://www.speedtest.net/speedtest.php?test=1&size=10&server=0&thread=1\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i64 @WriteCallback(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load i64, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = mul i64 %10, %11
  %13 = getelementptr inbounds i8, ptr %9, i64 %12
  store i8 0, ptr %13, align 1
  %14 = load i64, ptr %6, align 8
  %15 = load i64, ptr %7, align 8
  %16 = mul i64 %14, %15
  ret i64 %16
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @PrintSpeedTestResults(ptr noundef %0, double noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  %5 = load double, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr @.str.1, ptr %4, align 8
  %8 = call noalias ptr @malloc(i64 noundef 1000000) #4
  store ptr %8, ptr %5, align 8
  store double 0.000000e+00, ptr %6, align 8
  %9 = call i32 @curl_global_init(i64 noundef 3)
  %10 = call ptr @curl_easy_init()
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %11, i32 noundef 10002, ptr noundef %12)
  %14 = load ptr, ptr %2, align 8
  %15 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %14, i32 noundef 20011, ptr noundef @WriteCallback)
  %16 = load ptr, ptr %2, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %16, i32 noundef 10001, ptr noundef %17)
  %19 = load ptr, ptr %2, align 8
  %20 = call i32 @curl_easy_perform(ptr noundef %19)
  store i32 %20, ptr %3, align 4
  %21 = load ptr, ptr %2, align 8
  call void @curl_easy_cleanup(ptr noundef %21)
  call void @curl_global_cleanup()
  %22 = load i32, ptr %3, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %0
  %25 = load ptr, ptr %5, align 8
  %26 = call double @strtod(ptr noundef %25, ptr noundef %7) #5
  store double %26, ptr %6, align 8
  %27 = load double, ptr %6, align 8
  %28 = fdiv double %27, 1.000000e+06
  store double %28, ptr %6, align 8
  br label %29

29:                                               ; preds = %24, %0
  %30 = load ptr, ptr %5, align 8
  %31 = load double, ptr %6, align 8
  call void @PrintSpeedTestResults(ptr noundef %30, double noundef %31)
  %32 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %32) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @curl_global_init(i64 noundef) #1

declare ptr @curl_easy_init() #1

declare i32 @curl_easy_setopt(ptr noundef, i32 noundef, ...) #1

declare i32 @curl_easy_perform(ptr noundef) #1

declare void @curl_easy_cleanup(ptr noundef) #1

declare void @curl_global_cleanup() #1

; Function Attrs: nounwind
declare double @strtod(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
