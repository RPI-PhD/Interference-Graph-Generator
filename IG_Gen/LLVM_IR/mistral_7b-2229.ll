; ModuleID = 'DATASETv2/mistral_7b-2229.c'
source_filename = "DATASETv2/mistral_7b-2229.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%02X\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Invalid hexadecimal string.\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Enter a hexadecimal string: \00", align 1
@stdin = external global ptr, align 8
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_hex(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca [33 x i8], align 16
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %21, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 16
  br i1 %7, label %8, label %24

8:                                                ; preds = %5
  %9 = getelementptr inbounds [33 x i8], ptr %4, i64 0, i64 0
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %9, i64 %12
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %14, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = zext i8 %18 to i32
  %20 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %13, ptr noundef @.str, i32 noundef %19) #5
  br label %21

21:                                               ; preds = %8
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  br label %5, !llvm.loop !6

24:                                               ; preds = %5
  %25 = getelementptr inbounds [33 x i8], ptr %4, i64 0, i64 0
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %25)
  ret void
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_hex_character(i8 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  %4 = call ptr @__ctype_b_loc() #6
  %5 = load ptr, ptr %4, align 8
  %6 = load i8, ptr %3, align 1
  %7 = sext i8 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i16, ptr %5, i64 %8
  %10 = load i16, ptr %9, align 2
  %11 = zext i16 %10 to i32
  %12 = and i32 %11, 2048
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %58, label %14

14:                                               ; preds = %1
  %15 = call ptr @__ctype_b_loc() #6
  %16 = load ptr, ptr %15, align 8
  %17 = load i8, ptr %3, align 1
  %18 = sext i8 %17 to i32
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i16, ptr %16, i64 %19
  %21 = load i16, ptr %20, align 2
  %22 = zext i16 %21 to i32
  %23 = and i32 %22, 1024
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %36

25:                                               ; preds = %14
  %26 = call ptr @__ctype_b_loc() #6
  %27 = load ptr, ptr %26, align 8
  %28 = load i8, ptr %3, align 1
  %29 = sext i8 %28 to i32
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, ptr %27, i64 %30
  %32 = load i16, ptr %31, align 2
  %33 = zext i16 %32 to i32
  %34 = and i32 %33, 1024
  %35 = icmp sle i32 %34, 70
  br i1 %35, label %58, label %36

36:                                               ; preds = %25, %14
  %37 = call ptr @__ctype_b_loc() #6
  %38 = load ptr, ptr %37, align 8
  %39 = load i8, ptr %3, align 1
  %40 = sext i8 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, ptr %38, i64 %41
  %43 = load i16, ptr %42, align 2
  %44 = zext i16 %43 to i32
  %45 = and i32 %44, 1024
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %59

47:                                               ; preds = %36
  %48 = call ptr @__ctype_b_loc() #6
  %49 = load ptr, ptr %48, align 8
  %50 = load i8, ptr %3, align 1
  %51 = sext i8 %50 to i32
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i16, ptr %49, i64 %52
  %54 = load i16, ptr %53, align 2
  %55 = zext i16 %54 to i32
  %56 = and i32 %55, 1024
  %57 = icmp sge i32 %56, 65
  br i1 %57, label %58, label %59

58:                                               ; preds = %47, %25, %1
  store i32 1, ptr %2, align 4
  br label %60

59:                                               ; preds = %47, %36
  store i32 0, ptr %2, align 4
  br label %60

60:                                               ; preds = %59, %58
  %61 = load i32, ptr %2, align 4
  ret i32 %61
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @hex_string_to_array(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %112, %2
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %6, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, ptr %10, i64 %12
  %14 = load i8, ptr %13, align 1
  store i8 %14, ptr %8, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %115

17:                                               ; preds = %9
  %18 = load i8, ptr %8, align 1
  %19 = call i32 @is_hex_character(i8 noundef signext %18)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %101

21:                                               ; preds = %17
  %22 = call ptr @__ctype_b_loc() #6
  %23 = load ptr, ptr %22, align 8
  %24 = load i8, ptr %8, align 1
  %25 = sext i8 %24 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, ptr %23, i64 %26
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 2048
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %60

32:                                               ; preds = %21
  %33 = call ptr @__ctype_b_loc() #6
  %34 = load ptr, ptr %33, align 8
  %35 = load i8, ptr %8, align 1
  %36 = sext i8 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, ptr %34, i64 %37
  %39 = load i16, ptr %38, align 2
  %40 = zext i16 %39 to i32
  %41 = and i32 %40, 2048
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %47

43:                                               ; preds = %32
  %44 = load i8, ptr %8, align 1
  %45 = sext i8 %44 to i32
  %46 = sub nsw i32 %45, 48
  br label %52

47:                                               ; preds = %32
  %48 = load i8, ptr %8, align 1
  %49 = sext i8 %48 to i32
  %50 = sub nsw i32 %49, 65
  %51 = add nsw i32 %50, 10
  br label %52

52:                                               ; preds = %47, %43
  %53 = phi i32 [ %46, %43 ], [ %51, %47 ]
  %54 = trunc i32 %53 to i8
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %7, align 4
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds i8, ptr %55, i64 %58
  store i8 %54, ptr %59, align 1
  br label %88

60:                                               ; preds = %21
  %61 = call ptr @__ctype_b_loc() #6
  %62 = load ptr, ptr %61, align 8
  %63 = load i8, ptr %8, align 1
  %64 = sext i8 %63 to i32
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, ptr %62, i64 %65
  %67 = load i16, ptr %66, align 2
  %68 = zext i16 %67 to i32
  %69 = and i32 %68, 1024
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %75

71:                                               ; preds = %60
  %72 = load i8, ptr %8, align 1
  %73 = sext i8 %72 to i32
  %74 = sub nsw i32 %73, 65
  br label %80

75:                                               ; preds = %60
  %76 = load i8, ptr %8, align 1
  %77 = sext i8 %76 to i32
  %78 = sub nsw i32 %77, 48
  %79 = sub nsw i32 %78, 10
  br label %80

80:                                               ; preds = %75, %71
  %81 = phi i32 [ %74, %71 ], [ %79, %75 ]
  %82 = trunc i32 %81 to i8
  %83 = load ptr, ptr %5, align 8
  %84 = load i32, ptr %7, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %7, align 4
  %86 = sext i32 %84 to i64
  %87 = getelementptr inbounds i8, ptr %83, i64 %86
  store i8 %82, ptr %87, align 1
  br label %88

88:                                               ; preds = %80, %52
  %89 = load ptr, ptr %4, align 8
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, ptr %89, i64 %92
  %94 = load i8, ptr %93, align 1
  %95 = call i32 @is_hex_character(i8 noundef signext %94)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %100

97:                                               ; preds = %88
  %98 = load i32, ptr %6, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %6, align 4
  br label %100

100:                                              ; preds = %97, %88
  br label %112

101:                                              ; preds = %17
  %102 = load i32, ptr %7, align 4
  %103 = icmp sgt i32 %102, 0
  br i1 %103, label %104, label %109

104:                                              ; preds = %101
  %105 = load i32, ptr %6, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %6, align 4
  %107 = load i32, ptr %7, align 4
  %108 = add nsw i32 %107, -1
  store i32 %108, ptr %7, align 4
  br label %111

109:                                              ; preds = %101
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %3, align 4
  br label %120

111:                                              ; preds = %104
  br label %112

112:                                              ; preds = %111, %100
  %113 = load i32, ptr %6, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %6, align 4
  br label %9, !llvm.loop !8

115:                                              ; preds = %9
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds i8, ptr %116, i64 50
  store i8 0, ptr %117, align 1
  %118 = load i32, ptr %7, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %3, align 4
  br label %120

120:                                              ; preds = %115, %109
  %121 = load i32, ptr %3, align 4
  ret i32 %121
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  %3 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %5 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 100, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %9 = call i64 @strcspn(ptr noundef %8, ptr noundef @.str.4) #7
  %10 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  %11 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %12 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 @hex_string_to_array(ptr noundef %11, ptr noundef %12)
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %0
  %16 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @print_hex(ptr noundef %16)
  br label %17

17:                                               ; preds = %15, %0
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(none) }
attributes #7 = { nounwind willreturn memory(read) }

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
