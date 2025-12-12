; ModuleID = 'DATASETv2/falcon180b-58090.c'
source_filename = "DATASETv2/falcon180b-58090.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Token = type { ptr, i32 }

@.str = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"logfile.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c" \09\0A\0D\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_token(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.Token, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %32, %3
  %10 = load i32, ptr %7, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %35

13:                                               ; preds = %9
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %7, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.Token, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.Token, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #7
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %31

23:                                               ; preds = %13
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.Token, ptr %24, i64 %26
  %28 = getelementptr inbounds %struct.Token, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %28, align 8
  br label %46

31:                                               ; preds = %13
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %7, align 4
  br label %9, !llvm.loop !6

35:                                               ; preds = %9
  %36 = getelementptr inbounds %struct.Token, ptr %8, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = call ptr @strcpy(ptr noundef %37, ptr noundef %38) #8
  %40 = getelementptr inbounds %struct.Token, ptr %8, i32 0, i32 1
  store i32 1, ptr %40, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %5, align 4
  %44 = sext i32 %42 to i64
  %45 = getelementptr inbounds %struct.Token, ptr %41, i64 %44
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %45, ptr align 8 %8, i64 16, i1 false)
  br label %46

46:                                               ; preds = %35, %23
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_tokens(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %24, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.Token, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.Token, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.Token, ptr %17, i64 %19
  %21 = getelementptr inbounds %struct.Token, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %16, i32 noundef %22)
  br label %24

24:                                               ; preds = %10
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %6, !llvm.loop !8

27:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca [1000 x %struct.Token], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  store i32 0, ptr %6, align 4
  %10 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  store ptr %10, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #9
  unreachable

15:                                               ; preds = %0
  br label %16

16:                                               ; preds = %60, %15
  %17 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %18 = load ptr, ptr %2, align 8
  %19 = call ptr @fgets(ptr noundef %17, i32 noundef 100, ptr noundef %18)
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %61

21:                                               ; preds = %16
  %22 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %23 = call i64 @strlen(ptr noundef %22) #7
  %24 = trunc i64 %23 to i32
  store i32 %24, ptr %7, align 4
  %25 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  store ptr %25, ptr %8, align 8
  br label %26

26:                                               ; preds = %55, %21
  %27 = load i32, ptr %7, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %60

29:                                               ; preds = %26
  %30 = load ptr, ptr %8, align 8
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = call i32 @tolower(i32 noundef %32) #7
  %34 = trunc i32 %33 to i8
  store i8 %34, ptr %9, align 1
  %35 = call ptr @__ctype_b_loc() #10
  %36 = load ptr, ptr %35, align 8
  %37 = load i8, ptr %9, align 1
  %38 = sext i8 %37 to i32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i16, ptr %36, i64 %39
  %41 = load i16, ptr %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %42, 1024
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %55

45:                                               ; preds = %29
  %46 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %47 = load ptr, ptr %8, align 8
  %48 = call ptr @strncpy(ptr noundef %46, ptr noundef %47, i64 noundef 100) #8
  %49 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %50 = call i64 @strcspn(ptr noundef %49, ptr noundef @.str.4) #7
  %51 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %50
  store i8 0, ptr %51, align 1
  %52 = getelementptr inbounds [1000 x %struct.Token], ptr %5, i64 0, i64 0
  %53 = load i32, ptr %6, align 4
  %54 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  call void @add_token(ptr noundef %52, i32 noundef %53, ptr noundef %54)
  br label %55

55:                                               ; preds = %45, %29
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds i8, ptr %56, i32 1
  store ptr %57, ptr %8, align 8
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, -1
  store i32 %59, ptr %7, align 4
  br label %26, !llvm.loop !9

60:                                               ; preds = %26
  br label %16, !llvm.loop !10

61:                                               ; preds = %16
  %62 = load ptr, ptr %2, align 8
  %63 = call i32 @fclose(ptr noundef %62)
  %64 = getelementptr inbounds [1000 x %struct.Token], ptr %5, i64 0, i64 0
  %65 = load i32, ptr %6, align 4
  call void @print_tokens(ptr noundef %64, i32 noundef %65)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #6

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
