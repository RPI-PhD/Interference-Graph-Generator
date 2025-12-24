; ModuleID = 'LLVM_IR/gpt35-52130.ll'
source_filename = "DATASETv2/gpt35-52130.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"File not found!\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"recoveredData.txt\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"Data recovery completed!\0A\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"Enter the name of file to recover data from: \00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @toUpperCase(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %7, %1
  %.0 = phi i32 [ 0, %1 ], [ %16, %7 ]
  %3 = sext i32 %.0 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %17

7:                                                ; preds = %2
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 @toupper(i32 noundef %11) #6
  %13 = trunc i32 %12 to i8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  store i8 %13, ptr %15, align 1
  %16 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

17:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dataRecovery(ptr noundef %0) #0 {
  %2 = alloca [100000 x i8], align 16
  %3 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %30

7:                                                ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 100000, i1 false)
  %8 = getelementptr inbounds [100000 x i8], ptr %2, i64 0, i64 0
  %9 = call ptr @fgets(ptr noundef %8, i32 noundef 100000, ptr noundef %3)
  %10 = call i32 @fclose(ptr noundef %3)
  %11 = getelementptr inbounds [100000 x i8], ptr %2, i64 0, i64 0
  %12 = call ptr @strtok(ptr noundef %11, ptr noundef @.str.2) #7
  br label %13

13:                                               ; preds = %26, %7
  %.0 = phi ptr [ %12, %7 ], [ %27, %26 ]
  %14 = icmp ne ptr %.0, null
  br i1 %14, label %15, label %28

15:                                               ; preds = %13
  %16 = call ptr @strstr(ptr noundef %.0, ptr noundef @.str.3) #6
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %26

18:                                               ; preds = %15
  %19 = call i64 @strlen(ptr noundef %.0) #6
  %20 = mul i64 %19, 1
  %21 = call noalias ptr @malloc(i64 noundef %20) #8
  %22 = call ptr @strcpy(ptr noundef %21, ptr noundef %.0) #7
  call void @toUpperCase(ptr noundef %21)
  %23 = call noalias ptr @fopen(ptr noundef @.str.4, ptr noundef @.str.5)
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.6, ptr noundef %21)
  %25 = call i32 @fclose(ptr noundef %23)
  br label %26

26:                                               ; preds = %18, %15
  %27 = call ptr @strtok(ptr noundef null, ptr noundef @.str.2) #7
  br label %13, !llvm.loop !8

28:                                               ; preds = %13
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %30

30:                                               ; preds = %28, %5
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [50 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %3 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %3)
  %5 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  call void @dataRecovery(ptr noundef %5)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }
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
