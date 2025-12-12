; ModuleID = 'DATASETv2/gpt35-73252.c'
source_filename = "DATASETv2/gpt35-73252.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Input word is spelled correctly.\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Did you mean:\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"world\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"spell\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"checking\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"example\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"computer\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"science\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"awesome\00", align 1
@__const.main.dictionary = private unnamed_addr constant [9 x ptr] [ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@.str.12 = private unnamed_addr constant [28 x i8] c"Enter word to spell check: \00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @strip(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store ptr %4, ptr %3, align 8
  br label %5

5:                                                ; preds = %30, %1
  %6 = load ptr, ptr %3, align 8
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %33

10:                                               ; preds = %5
  %11 = call ptr @__ctype_b_loc() #6
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i16, ptr %12, i64 %16
  %18 = load i16, ptr %17, align 2
  %19 = zext i16 %18 to i32
  %20 = and i32 %19, 8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %30

22:                                               ; preds = %10
  %23 = load ptr, ptr %3, align 8
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = call i32 @tolower(i32 noundef %25) #7
  %27 = trunc i32 %26 to i8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds i8, ptr %28, i32 1
  store ptr %29, ptr %2, align 8
  store i8 %27, ptr %28, align 1
  br label %30

30:                                               ; preds = %22, %10
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds i8, ptr %31, i32 1
  store ptr %32, ptr %3, align 8
  br label %5, !llvm.loop !6

33:                                               ; preds = %5
  %34 = load ptr, ptr %2, align 8
  store i8 0, ptr %34, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @min(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i32, ptr %3, align 4
  br label %12

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  br label %12

12:                                               ; preds = %10, %8
  %13 = phi i32 [ %9, %8 ], [ %11, %10 ]
  ret i32 %13
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @spellcheck(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %25 = load ptr, ptr %4, align 8
  call void @strip(ptr noundef %25)
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  %28 = zext i32 %27 to i64
  %29 = call ptr @llvm.stacksave.p0()
  store ptr %29, ptr %7, align 8
  %30 = alloca i32, i64 %28, align 16
  store i64 %28, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %31

31:                                               ; preds = %40, %3
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %6, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %35, label %43

35:                                               ; preds = %31
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %9, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %30, i64 %38
  store i32 %36, ptr %39, align 4
  br label %40

40:                                               ; preds = %35
  %41 = load i32, ptr %9, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %9, align 4
  br label %31, !llvm.loop !8

43:                                               ; preds = %31
  store i32 0, ptr %10, align 4
  br label %44

44:                                               ; preds = %107, %43
  %45 = load i32, ptr %10, align 4
  %46 = load i32, ptr %6, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %110

48:                                               ; preds = %44
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51
  %53 = load ptr, ptr %52, align 8
  store ptr %53, ptr %11, align 8
  %54 = load ptr, ptr %11, align 8
  %55 = call i64 @strlen(ptr noundef %54) #7
  %56 = trunc i64 %55 to i32
  store i32 %56, ptr %12, align 4
  %57 = getelementptr inbounds i32, ptr %30, i64 0
  %58 = load i32, ptr %57, align 16
  store i32 %58, ptr %13, align 4
  %59 = load i32, ptr %10, align 4
  %60 = add nsw i32 %59, 1
  %61 = getelementptr inbounds i32, ptr %30, i64 0
  store i32 %60, ptr %61, align 16
  store i32 0, ptr %14, align 4
  br label %62

62:                                               ; preds = %99, %48
  %63 = load i32, ptr %14, align 4
  %64 = load i32, ptr %12, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %102

66:                                               ; preds = %62
  %67 = load i32, ptr %14, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %30, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %15, align 4
  %72 = load i32, ptr %13, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %16, align 4
  %74 = load i32, ptr %13, align 4
  %75 = load ptr, ptr %11, align 8
  %76 = load i32, ptr %14, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, ptr %75, i64 %77
  %79 = load i8, ptr %78, align 1
  %80 = sext i8 %79 to i32
  %81 = load ptr, ptr %4, align 8
  %82 = load i32, ptr %14, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, ptr %81, i64 %83
  %85 = load i8, ptr %84, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %80, %86
  %88 = zext i1 %87 to i32
  %89 = add nsw i32 %74, %88
  store i32 %89, ptr %17, align 4
  %90 = load i32, ptr %13, align 4
  %91 = load i32, ptr %14, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %30, i64 %92
  store i32 %90, ptr %93, align 4
  %94 = load i32, ptr %15, align 4
  %95 = load i32, ptr %16, align 4
  %96 = call i32 @min(i32 noundef %94, i32 noundef %95)
  %97 = load i32, ptr %17, align 4
  %98 = call i32 @min(i32 noundef %96, i32 noundef %97)
  store i32 %98, ptr %13, align 4
  br label %99

99:                                               ; preds = %66
  %100 = load i32, ptr %14, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %14, align 4
  br label %62, !llvm.loop !9

102:                                              ; preds = %62
  %103 = load i32, ptr %13, align 4
  %104 = load i32, ptr %12, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %30, i64 %105
  store i32 %103, ptr %106, align 4
  br label %107

107:                                              ; preds = %102
  %108 = load i32, ptr %10, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %10, align 4
  br label %44, !llvm.loop !10

110:                                              ; preds = %44
  %111 = getelementptr inbounds i32, ptr %30, i64 0
  %112 = load i32, ptr %111, align 16
  store i32 %112, ptr %18, align 4
  store i32 1, ptr %19, align 4
  br label %113

113:                                              ; preds = %128, %110
  %114 = load i32, ptr %19, align 4
  %115 = load i32, ptr %6, align 4
  %116 = icmp sle i32 %114, %115
  br i1 %116, label %117, label %131

117:                                              ; preds = %113
  %118 = load i32, ptr %19, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, ptr %30, i64 %119
  %121 = load i32, ptr %120, align 4
  store i32 %121, ptr %20, align 4
  %122 = load i32, ptr %20, align 4
  %123 = load i32, ptr %18, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %127

125:                                              ; preds = %117
  %126 = load i32, ptr %20, align 4
  store i32 %126, ptr %18, align 4
  br label %127

127:                                              ; preds = %125, %117
  br label %128

128:                                              ; preds = %127
  %129 = load i32, ptr %19, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, ptr %19, align 4
  br label %113, !llvm.loop !11

131:                                              ; preds = %113
  %132 = load i32, ptr %18, align 4
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %136

134:                                              ; preds = %131
  %135 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 1, ptr %21, align 4
  br label %163

136:                                              ; preds = %131
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %22, align 4
  br label %138

138:                                              ; preds = %159, %136
  %139 = load i32, ptr %22, align 4
  %140 = load i32, ptr %6, align 4
  %141 = icmp slt i32 %139, %140
  br i1 %141, label %142, label %162

142:                                              ; preds = %138
  %143 = load ptr, ptr %5, align 8
  %144 = load i32, ptr %22, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds ptr, ptr %143, i64 %145
  %147 = load ptr, ptr %146, align 8
  store ptr %147, ptr %23, align 8
  %148 = load i32, ptr %22, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr %30, i64 %149
  %151 = load i32, ptr %150, align 4
  store i32 %151, ptr %24, align 4
  %152 = load i32, ptr %24, align 4
  %153 = load i32, ptr %18, align 4
  %154 = icmp eq i32 %152, %153
  br i1 %154, label %155, label %158

155:                                              ; preds = %142
  %156 = load ptr, ptr %23, align 8
  %157 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %156)
  br label %158

158:                                              ; preds = %155, %142
  br label %159

159:                                              ; preds = %158
  %160 = load i32, ptr %22, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %22, align 4
  br label %138, !llvm.loop !12

162:                                              ; preds = %138
  store i32 0, ptr %21, align 4
  br label %163

163:                                              ; preds = %162, %134
  %164 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore.p0(ptr %164)
  %165 = load i32, ptr %21, align 4
  switch i32 %165, label %167 [
    i32 0, label %166
    i32 1, label %166
  ]

166:                                              ; preds = %163, %163
  ret void

167:                                              ; preds = %163
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x ptr], align 16
  %3 = alloca i32, align 4
  %4 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.dictionary, i64 72, i1 false)
  store i32 9, ptr %3, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %6 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %9 = getelementptr inbounds [9 x ptr], ptr %2, i64 0, i64 0
  %10 = load i32, ptr %3, align 4
  call void @spellcheck(ptr noundef %8, ptr noundef %9, i32 noundef %10)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
