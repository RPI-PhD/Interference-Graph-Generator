; ModuleID = 'LLVM_IR/gpt35-51218.ll'
source_filename = "DATASETv2/gpt35-51218.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.master_password = private unnamed_addr constant [11 x i8] c"s3cur3p@ssw", align 1
@.str = private unnamed_addr constant [33 x i8] c"Welcome to the Password Manager\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"1. Add Password\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"2. Edit Password\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"3. Show All Passwords\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"4. Remove Password\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Enter Choice: \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [17 x i8] c"Enter Password: \00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"Password Added\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"Maximum Number of Passwords Reached\0A\00", align 1
@.str.12 = private unnamed_addr constant [31 x i8] c"Enter Password Number (1-%d): \00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"Enter New Password: \00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"Password Updated\0A\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"Invalid Password Number\0A\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"Password List:\0A\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"%d: %s\0A\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c"Are you sure you want to remove password %d? (y/n)\0A\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"Password Removed\0A\00", align 1
@.str.20 = private unnamed_addr constant [22 x i8] c"Password Not Removed\0A\00", align 1
@.str.21 = private unnamed_addr constant [12 x i8] c"Exiting...\0A\00", align 1
@.str.22 = private unnamed_addr constant [16 x i8] c"Invalid Choice\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [11 x i8]], align 16
  %2 = alloca [11 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [11 x i8], align 1
  %6 = alloca [2 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.master_password, i64 11, i1 false)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %8

8:                                                ; preds = %136, %0
  %.0 = phi i32 [ 0, %0 ], [ %.4, %136 ]
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %3)
  %16 = load i32, ptr %3, align 4
  switch i32 %16, label %134 [
    i32 1, label %17
    i32 2, label %34
    i32 3, label %59
    i32 4, label %84
    i32 5, label %132
  ]

17:                                               ; preds = %8
  %18 = icmp slt i32 %.0, 5
  br i1 %18, label %19, label %31

19:                                               ; preds = %17
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %21 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %22 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %21)
  %23 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  call void @scramble_password(ptr noundef %23)
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %24
  %26 = getelementptr inbounds [11 x i8], ptr %25, i64 0, i64 0
  %27 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %28 = call ptr @strcpy(ptr noundef %26, ptr noundef %27) #5
  %29 = add nsw i32 %.0, 1
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %33

31:                                               ; preds = %17
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %33

33:                                               ; preds = %31, %19
  %.1 = phi i32 [ %29, %19 ], [ %.0, %31 ]
  br label %136

34:                                               ; preds = %8
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %.0)
  %36 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %4)
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, ptr %4, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp slt i32 %39, %.0
  br i1 %40, label %41, label %56

41:                                               ; preds = %34
  %42 = load i32, ptr %4, align 4
  %43 = icmp sge i32 %42, 0
  br i1 %43, label %44, label %56

44:                                               ; preds = %41
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %46 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %47 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %46)
  %48 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  call void @scramble_password(ptr noundef %48)
  %49 = load i32, ptr %4, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %50
  %52 = getelementptr inbounds [11 x i8], ptr %51, i64 0, i64 0
  %53 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %54 = call ptr @strcpy(ptr noundef %52, ptr noundef %53) #5
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %58

56:                                               ; preds = %41, %34
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %58

58:                                               ; preds = %56, %44
  br label %136

59:                                               ; preds = %8
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 0, ptr %4, align 4
  br label %61

61:                                               ; preds = %80, %59
  %62 = load i32, ptr %4, align 4
  %63 = icmp slt i32 %62, %.0
  br i1 %63, label %64, label %83

64:                                               ; preds = %61
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %66
  %68 = getelementptr inbounds [11 x i8], ptr %67, i64 0, i64 0
  call void @unscramble_password(ptr noundef %68)
  %69 = load i32, ptr %4, align 4
  %70 = add nsw i32 %69, 1
  %71 = load i32, ptr %4, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %72
  %74 = getelementptr inbounds [11 x i8], ptr %73, i64 0, i64 0
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %70, ptr noundef %74)
  %76 = load i32, ptr %4, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %77
  %79 = getelementptr inbounds [11 x i8], ptr %78, i64 0, i64 0
  call void @scramble_password(ptr noundef %79)
  br label %80

80:                                               ; preds = %64
  %81 = load i32, ptr %4, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %4, align 4
  br label %61, !llvm.loop !6

83:                                               ; preds = %61
  br label %136

84:                                               ; preds = %8
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %.0)
  %86 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %4)
  %87 = load i32, ptr %4, align 4
  %88 = add nsw i32 %87, -1
  store i32 %88, ptr %4, align 4
  %89 = load i32, ptr %4, align 4
  %90 = icmp slt i32 %89, %.0
  br i1 %90, label %91, label %129

91:                                               ; preds = %84
  %92 = load i32, ptr %4, align 4
  %93 = icmp sge i32 %92, 0
  br i1 %93, label %94, label %129

94:                                               ; preds = %91
  %95 = load i32, ptr %4, align 4
  %96 = add nsw i32 %95, 1
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %96)
  %98 = getelementptr inbounds [2 x i8], ptr %6, i64 0, i64 0
  %99 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %98)
  %100 = getelementptr inbounds [2 x i8], ptr %6, i64 0, i64 0
  %101 = load i8, ptr %100, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp eq i32 %102, 121
  br i1 %103, label %104, label %126

104:                                              ; preds = %94
  br label %105

105:                                              ; preds = %120, %104
  %106 = load i32, ptr %4, align 4
  %107 = sub nsw i32 %.0, 1
  %108 = icmp slt i32 %106, %107
  br i1 %108, label %109, label %123

109:                                              ; preds = %105
  %110 = load i32, ptr %4, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %111
  %113 = getelementptr inbounds [11 x i8], ptr %112, i64 0, i64 0
  %114 = load i32, ptr %4, align 4
  %115 = add nsw i32 %114, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [5 x [11 x i8]], ptr %1, i64 0, i64 %116
  %118 = getelementptr inbounds [11 x i8], ptr %117, i64 0, i64 0
  %119 = call ptr @strcpy(ptr noundef %113, ptr noundef %118) #5
  br label %120

120:                                              ; preds = %109
  %121 = load i32, ptr %4, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %4, align 4
  br label %105, !llvm.loop !8

123:                                              ; preds = %105
  %124 = add nsw i32 %.0, -1
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %128

126:                                              ; preds = %94
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %128

128:                                              ; preds = %126, %123
  %.2 = phi i32 [ %124, %123 ], [ %.0, %126 ]
  br label %131

129:                                              ; preds = %91, %84
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %131

131:                                              ; preds = %129, %128
  %.3 = phi i32 [ %.2, %128 ], [ %.0, %129 ]
  br label %136

132:                                              ; preds = %8
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  ret i32 0

134:                                              ; preds = %8
  %135 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %136

136:                                              ; preds = %134, %131, %83, %58, %33
  %.4 = phi i32 [ %.0, %134 ], [ %.3, %131 ], [ %.0, %83 ], [ %.0, %58 ], [ %.1, %33 ]
  br label %8
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @scramble_password(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #6
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %15, %1
  %.0 = phi i32 [ 0, %1 ], [ %16, %15 ]
  %5 = icmp slt i32 %.0, %3
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = xor i32 %10, 255
  %12 = trunc i32 %11 to i8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  store i8 %12, ptr %14, align 1
  br label %15

15:                                               ; preds = %6
  %16 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !9

17:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @unscramble_password(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #6
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %15, %1
  %.0 = phi i32 [ 0, %1 ], [ %16, %15 ]
  %5 = icmp slt i32 %.0, %3
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = xor i32 %10, 255
  %12 = trunc i32 %11 to i8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  store i8 %12, ptr %14, align 1
  br label %15

15:                                               ; preds = %6
  %16 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !10

17:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
