; ModuleID = 'DATASETv2/gpt35-51218.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x [11 x i8]], align 16
  %3 = alloca [11 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [11 x i8], align 1
  %8 = alloca [11 x i8], align 1
  %9 = alloca [2 x i8], align 1
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.master_password, i64 11, i1 false)
  store i32 0, ptr %4, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %11

11:                                               ; preds = %0, %149
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %5)
  %19 = load i32, ptr %5, align 4
  switch i32 %19, label %147 [
    i32 1, label %20
    i32 2, label %40
    i32 3, label %67
    i32 4, label %93
    i32 5, label %145
  ]

20:                                               ; preds = %11
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %23, label %37

23:                                               ; preds = %20
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %25 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %26 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %25)
  %27 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  call void @scramble_password(ptr noundef %27)
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %29
  %31 = getelementptr inbounds [11 x i8], ptr %30, i64 0, i64 0
  %32 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %33 = call ptr @strcpy(ptr noundef %31, ptr noundef %32) #5
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %39

37:                                               ; preds = %20
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %39

39:                                               ; preds = %37, %23
  br label %149

40:                                               ; preds = %11
  %41 = load i32, ptr %4, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %41)
  %43 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %6)
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, ptr %6, align 4
  %46 = load i32, ptr %6, align 4
  %47 = load i32, ptr %4, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %64

49:                                               ; preds = %40
  %50 = load i32, ptr %6, align 4
  %51 = icmp sge i32 %50, 0
  br i1 %51, label %52, label %64

52:                                               ; preds = %49
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %54 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %55 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %54)
  %56 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  call void @scramble_password(ptr noundef %56)
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %58
  %60 = getelementptr inbounds [11 x i8], ptr %59, i64 0, i64 0
  %61 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %62 = call ptr @strcpy(ptr noundef %60, ptr noundef %61) #5
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %66

64:                                               ; preds = %49, %40
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %66

66:                                               ; preds = %64, %52
  br label %149

67:                                               ; preds = %11
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 0, ptr %6, align 4
  br label %69

69:                                               ; preds = %89, %67
  %70 = load i32, ptr %6, align 4
  %71 = load i32, ptr %4, align 4
  %72 = icmp slt i32 %70, %71
  br i1 %72, label %73, label %92

73:                                               ; preds = %69
  %74 = load i32, ptr %6, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %75
  %77 = getelementptr inbounds [11 x i8], ptr %76, i64 0, i64 0
  call void @unscramble_password(ptr noundef %77)
  %78 = load i32, ptr %6, align 4
  %79 = add nsw i32 %78, 1
  %80 = load i32, ptr %6, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %81
  %83 = getelementptr inbounds [11 x i8], ptr %82, i64 0, i64 0
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %79, ptr noundef %83)
  %85 = load i32, ptr %6, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %86
  %88 = getelementptr inbounds [11 x i8], ptr %87, i64 0, i64 0
  call void @scramble_password(ptr noundef %88)
  br label %89

89:                                               ; preds = %73
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %6, align 4
  br label %69, !llvm.loop !6

92:                                               ; preds = %69
  br label %149

93:                                               ; preds = %11
  %94 = load i32, ptr %4, align 4
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %94)
  %96 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %6)
  %97 = load i32, ptr %6, align 4
  %98 = add nsw i32 %97, -1
  store i32 %98, ptr %6, align 4
  %99 = load i32, ptr %6, align 4
  %100 = load i32, ptr %4, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %142

102:                                              ; preds = %93
  %103 = load i32, ptr %6, align 4
  %104 = icmp sge i32 %103, 0
  br i1 %104, label %105, label %142

105:                                              ; preds = %102
  %106 = load i32, ptr %6, align 4
  %107 = add nsw i32 %106, 1
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %107)
  %109 = getelementptr inbounds [2 x i8], ptr %9, i64 0, i64 0
  %110 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %109)
  %111 = getelementptr inbounds [2 x i8], ptr %9, i64 0, i64 0
  %112 = load i8, ptr %111, align 1
  %113 = sext i8 %112 to i32
  %114 = icmp eq i32 %113, 121
  br i1 %114, label %115, label %139

115:                                              ; preds = %105
  br label %116

116:                                              ; preds = %132, %115
  %117 = load i32, ptr %6, align 4
  %118 = load i32, ptr %4, align 4
  %119 = sub nsw i32 %118, 1
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %135

121:                                              ; preds = %116
  %122 = load i32, ptr %6, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %123
  %125 = getelementptr inbounds [11 x i8], ptr %124, i64 0, i64 0
  %126 = load i32, ptr %6, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [5 x [11 x i8]], ptr %2, i64 0, i64 %128
  %130 = getelementptr inbounds [11 x i8], ptr %129, i64 0, i64 0
  %131 = call ptr @strcpy(ptr noundef %125, ptr noundef %130) #5
  br label %132

132:                                              ; preds = %121
  %133 = load i32, ptr %6, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %6, align 4
  br label %116, !llvm.loop !8

135:                                              ; preds = %116
  %136 = load i32, ptr %4, align 4
  %137 = add nsw i32 %136, -1
  store i32 %137, ptr %4, align 4
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %141

139:                                              ; preds = %105
  %140 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %141

141:                                              ; preds = %139, %135
  br label %144

142:                                              ; preds = %102, %93
  %143 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %144

144:                                              ; preds = %142, %141
  br label %149

145:                                              ; preds = %11
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  ret i32 0

147:                                              ; preds = %11
  %148 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %149

149:                                              ; preds = %147, %144, %92, %66, %39
  br label %11
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @scramble_password(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call i64 @strlen(ptr noundef %5) #6
  %7 = trunc i64 %6 to i32
  store i32 %7, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %25, %1
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %13, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = xor i32 %18, 255
  %20 = trunc i32 %19 to i8
  %21 = load ptr, ptr %2, align 8
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, ptr %21, i64 %23
  store i8 %20, ptr %24, align 1
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %8, !llvm.loop !9

28:                                               ; preds = %8
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @unscramble_password(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call i64 @strlen(ptr noundef %5) #6
  %7 = trunc i64 %6 to i32
  store i32 %7, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %25, %1
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %13, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = xor i32 %18, 255
  %20 = trunc i32 %19 to i8
  %21 = load ptr, ptr %2, align 8
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, ptr %21, i64 %23
  store i8 %20, ptr %24, align 1
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %8, !llvm.loop !10

28:                                               ; preds = %8
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
