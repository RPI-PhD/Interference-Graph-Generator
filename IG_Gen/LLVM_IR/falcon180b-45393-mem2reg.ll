; ModuleID = 'LLVM_IR/falcon180b-45393.ll'
source_filename = "DATASETv2/falcon180b-45393.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Internet speed: %.2f Mbps\0A\00", align 1
@.str.1 = private unnamed_addr constant [73 x i8] c"https://www.speedtest.net/speedtest.php?test=1&size=10&server=0&thread=1\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @WriteCallback(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = mul i64 %1, %2
  %6 = getelementptr inbounds i8, ptr %3, i64 %5
  store i8 0, ptr %6, align 1
  %7 = mul i64 %1, %2
  ret i64 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PrintSpeedTestResults(ptr noundef %0, double noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 1000000) #4
  %3 = call i32 @curl_global_init(i64 noundef 3)
  %4 = call ptr @curl_easy_init()
  %5 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %4, i32 noundef 10002, ptr noundef @.str.1)
  %6 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %4, i32 noundef 20011, ptr noundef @WriteCallback)
  %7 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %4, i32 noundef 10001, ptr noundef %2)
  %8 = call i32 @curl_easy_perform(ptr noundef %4)
  call void @curl_easy_cleanup(ptr noundef %4)
  call void @curl_global_cleanup()
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %0
  %11 = call double @strtod(ptr noundef %2, ptr noundef %1) #5
  %12 = fdiv double %11, 1.000000e+06
  br label %13

13:                                               ; preds = %10, %0
  %.0 = phi double [ %12, %10 ], [ 0.000000e+00, %0 ]
  call void @PrintSpeedTestResults(ptr noundef %2, double noundef %.0)
  call void @free(ptr noundef %2) #5
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
