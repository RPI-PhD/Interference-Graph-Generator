; ModuleID = 'LLVM_IR/gpt4o_mini-38754.ll'
source_filename = "DATASETv2/gpt4o_mini-38754.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Metadata = type { [100 x i8], [100 x i8], [100 x i8], i32, float }

@.str = private unnamed_addr constant [32 x i8] c"---- Metadata Information ----\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Title: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"Artist: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Album: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Year: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Duration: %.2f seconds\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"-------------------------------\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Mystery of C\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"C Programmer\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"C Compilation\00", align 1
@.str.10 = private unnamed_addr constant [38 x i8] c"Welcome to the C Metadata Extractor!\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"===================================\0A\00", align 1
@.str.12 = private unnamed_addr constant [63 x i8] c"Please enter the filename whose metadata you want to extract: \00", align 1
@stdin = external global ptr, align 8
@.str.13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.14 = private unnamed_addr constant [32 x i8] c"Extracting metadata from %s...\0A\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"Starting the Metadata Extractor...\0A\00", align 1
@.str.16 = private unnamed_addr constant [47 x i8] c"Thank you for using the C Metadata Extractor!\0A\00", align 1
@.str.17 = private unnamed_addr constant [41 x i8] c"Goodbye! Keep exploring the music of C!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMetadata(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.Metadata, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %4)
  %6 = getelementptr inbounds %struct.Metadata, ptr %0, i32 0, i32 1
  %7 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %7)
  %9 = getelementptr inbounds %struct.Metadata, ptr %0, i32 0, i32 2
  %10 = getelementptr inbounds [100 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %10)
  %12 = getelementptr inbounds %struct.Metadata, ptr %0, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %13)
  %15 = getelementptr inbounds %struct.Metadata, ptr %0, i32 0, i32 4
  %16 = load float, ptr %15, align 4
  %17 = fpext float %16 to double
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @extractMetadata(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Metadata, ptr %1, i32 0, i32 0
  %4 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %5 = call ptr @strcpy(ptr noundef %4, ptr noundef @.str.7) #4
  %6 = getelementptr inbounds %struct.Metadata, ptr %1, i32 0, i32 1
  %7 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %8 = call ptr @strcpy(ptr noundef %7, ptr noundef @.str.8) #4
  %9 = getelementptr inbounds %struct.Metadata, ptr %1, i32 0, i32 2
  %10 = getelementptr inbounds [100 x i8], ptr %9, i64 0, i64 0
  %11 = call ptr @strcpy(ptr noundef %10, ptr noundef @.str.9) #4
  %12 = getelementptr inbounds %struct.Metadata, ptr %1, i32 0, i32 3
  store i32 2023, ptr %12, align 4
  %13 = getelementptr inbounds %struct.Metadata, ptr %1, i32 0, i32 4
  store float 2.405000e+02, ptr %13, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @userInteraction() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca %struct.Metadata, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %6 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 100, ptr noundef %7)
  %9 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %10 = call i64 @strcspn(ptr noundef %9, ptr noundef @.str.13) #5
  %11 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %10
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %12)
  %14 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @extractMetadata(ptr noundef %14, ptr noundef %2)
  call void @printMetadata(ptr noundef %2)
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @userInteraction()
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
