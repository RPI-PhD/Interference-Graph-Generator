; ModuleID = 'DATASETv2/gpt35-75897.c'
source_filename = "DATASETv2/gpt35-75897.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"Enter password: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"\0AWeak Password!\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"Password length must be between 8 and 20 characters.\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"\0AStrong Password!\0A\00", align 1
@.str.5 = private unnamed_addr constant [56 x i8] c"- Password must contain at least one uppercase letter.\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"- Password must contain at least one lowercase letter.\0A\00", align 1
@.str.7 = private unnamed_addr constant [45 x i8] c"- Password must contain at least one digit.\0A\00", align 1
@.str.8 = private unnamed_addr constant [57 x i8] c"- Password must contain at least one special character.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %10)
  %12 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %13 = call i64 @strlen(ptr noundef %12) #5
  %14 = trunc i64 %13 to i32
  store i32 %14, ptr %3, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %15, 8
  br i1 %16, label %20, label %17

17:                                               ; preds = %0
  %18 = load i32, ptr %3, align 4
  %19 = icmp sgt i32 %18, 20
  br i1 %19, label %20, label %23

20:                                               ; preds = %17, %0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 0) #6
  unreachable

23:                                               ; preds = %17
  store i32 0, ptr %4, align 4
  br label %24

24:                                               ; preds = %104, %23
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %107

28:                                               ; preds = %24
  %29 = call ptr @__ctype_b_loc() #7
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, ptr %30, i64 %36
  %38 = load i16, ptr %37, align 2
  %39 = zext i16 %38 to i32
  %40 = and i32 %39, 256
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %28
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  br label %45

45:                                               ; preds = %42, %28
  %46 = call ptr @__ctype_b_loc() #7
  %47 = load ptr, ptr %46, align 8
  %48 = load i32, ptr %4, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %49
  %51 = load i8, ptr %50, align 1
  %52 = sext i8 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i16, ptr %47, i64 %53
  %55 = load i16, ptr %54, align 2
  %56 = zext i16 %55 to i32
  %57 = and i32 %56, 512
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %62

59:                                               ; preds = %45
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %6, align 4
  br label %62

62:                                               ; preds = %59, %45
  %63 = call ptr @__ctype_b_loc() #7
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = sext i8 %68 to i32
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, ptr %64, i64 %70
  %72 = load i16, ptr %71, align 2
  %73 = zext i16 %72 to i32
  %74 = and i32 %73, 2048
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %79

76:                                               ; preds = %62
  %77 = load i32, ptr %7, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %7, align 4
  br label %79

79:                                               ; preds = %76, %62
  %80 = load i32, ptr %4, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %81
  %83 = load i8, ptr %82, align 1
  %84 = sext i8 %83 to i32
  %85 = icmp sge i32 %84, 33
  br i1 %85, label %86, label %93

86:                                               ; preds = %79
  %87 = load i32, ptr %4, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %88
  %90 = load i8, ptr %89, align 1
  %91 = sext i8 %90 to i32
  %92 = icmp sle i32 %91, 46
  br i1 %92, label %100, label %93

93:                                               ; preds = %86, %79
  %94 = load i32, ptr %4, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %95
  %97 = load i8, ptr %96, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp eq i32 %98, 64
  br i1 %99, label %100, label %103

100:                                              ; preds = %93, %86
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %8, align 4
  br label %103

103:                                              ; preds = %100, %93
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %4, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %4, align 4
  br label %24, !llvm.loop !6

107:                                              ; preds = %24
  %108 = load i32, ptr %5, align 4
  %109 = icmp sge i32 %108, 1
  br i1 %109, label %110, label %121

110:                                              ; preds = %107
  %111 = load i32, ptr %6, align 4
  %112 = icmp sge i32 %111, 1
  br i1 %112, label %113, label %121

113:                                              ; preds = %110
  %114 = load i32, ptr %7, align 4
  %115 = icmp sge i32 %114, 1
  br i1 %115, label %116, label %121

116:                                              ; preds = %113
  %117 = load i32, ptr %8, align 4
  %118 = icmp sge i32 %117, 1
  br i1 %118, label %119, label %121

119:                                              ; preds = %116
  %120 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %143

121:                                              ; preds = %116, %113, %110, %107
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %123 = load i32, ptr %5, align 4
  %124 = icmp slt i32 %123, 1
  br i1 %124, label %125, label %127

125:                                              ; preds = %121
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %127

127:                                              ; preds = %125, %121
  %128 = load i32, ptr %6, align 4
  %129 = icmp slt i32 %128, 1
  br i1 %129, label %130, label %132

130:                                              ; preds = %127
  %131 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %132

132:                                              ; preds = %130, %127
  %133 = load i32, ptr %7, align 4
  %134 = icmp slt i32 %133, 1
  br i1 %134, label %135, label %137

135:                                              ; preds = %132
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %137

137:                                              ; preds = %135, %132
  %138 = load i32, ptr %8, align 4
  %139 = icmp slt i32 %138, 1
  br i1 %139, label %140, label %142

140:                                              ; preds = %137
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %142

142:                                              ; preds = %140, %137
  br label %143

143:                                              ; preds = %142, %119
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(none) }

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
