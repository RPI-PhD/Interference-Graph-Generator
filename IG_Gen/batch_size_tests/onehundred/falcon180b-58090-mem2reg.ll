; ModuleID = 'LLVM_IR/falcon180b-58090.ll'
source_filename = "DATASETv2/falcon180b-58090.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Token = type { ptr, i32 }

@.str = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"logfile.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c" \09\0A\0D\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_token(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca %struct.Token, align 8
  br label %5

5:                                                ; preds = %21, %3
  %.0 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %6 = icmp slt i32 %.0, %1
  br i1 %6, label %7, label %23

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.Token, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.Token, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef %2) #7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %20

14:                                               ; preds = %7
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.Token, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.Token, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 8
  br label %31

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

23:                                               ; preds = %5
  %24 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = call ptr @strcpy(ptr noundef %25, ptr noundef %2) #8
  %27 = getelementptr inbounds %struct.Token, ptr %4, i32 0, i32 1
  store i32 1, ptr %27, align 8
  %28 = add nsw i32 %1, 1
  %29 = sext i32 %1 to i64
  %30 = getelementptr inbounds %struct.Token, ptr %0, i64 %29
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %30, ptr align 8 %4, i64 16, i1 false)
  br label %31

31:                                               ; preds = %23, %14
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_tokens(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %15, %2
  %.0 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.Token, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.Token, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds %struct.Token, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.Token, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %9, i32 noundef %13)
  br label %15

15:                                               ; preds = %5
  %16 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

17:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = alloca [1000 x %struct.Token], align 16
  %4 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #9
  unreachable

8:                                                ; preds = %0
  br label %9

9:                                                ; preds = %45, %8
  %10 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %11 = call ptr @fgets(ptr noundef %10, i32 noundef 100, ptr noundef %4)
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %46

13:                                               ; preds = %9
  %14 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %15 = call i64 @strlen(ptr noundef %14) #7
  %16 = trunc i64 %15 to i32
  %17 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  br label %18

18:                                               ; preds = %42, %13
  %.01 = phi i32 [ %16, %13 ], [ %44, %42 ]
  %.0 = phi ptr [ %17, %13 ], [ %43, %42 ]
  %19 = icmp sgt i32 %.01, 0
  br i1 %19, label %20, label %45

20:                                               ; preds = %18
  %21 = load i8, ptr %.0, align 1
  %22 = sext i8 %21 to i32
  %23 = call i32 @tolower(i32 noundef %22) #7
  %24 = trunc i32 %23 to i8
  %25 = call ptr @__ctype_b_loc() #10
  %26 = load ptr, ptr %25, align 8
  %27 = sext i8 %24 to i32
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, ptr %26, i64 %28
  %30 = load i16, ptr %29, align 2
  %31 = zext i16 %30 to i32
  %32 = and i32 %31, 1024
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %42

34:                                               ; preds = %20
  %35 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %36 = call ptr @strncpy(ptr noundef %35, ptr noundef %.0, i64 noundef 100) #8
  %37 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %38 = call i64 @strcspn(ptr noundef %37, ptr noundef @.str.4) #7
  %39 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %38
  store i8 0, ptr %39, align 1
  %40 = getelementptr inbounds [1000 x %struct.Token], ptr %3, i64 0, i64 0
  %41 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  call void @add_token(ptr noundef %40, i32 noundef 0, ptr noundef %41)
  br label %42

42:                                               ; preds = %34, %20
  %43 = getelementptr inbounds i8, ptr %.0, i32 1
  %44 = add nsw i32 %.01, -1
  br label %18, !llvm.loop !9

45:                                               ; preds = %18
  br label %9, !llvm.loop !10

46:                                               ; preds = %9
  %47 = call i32 @fclose(ptr noundef %4)
  %48 = getelementptr inbounds [1000 x %struct.Token], ptr %3, i64 0, i64 0
  call void @print_tokens(ptr noundef %48, i32 noundef 0)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
