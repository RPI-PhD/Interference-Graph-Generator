; ModuleID = 'DATASETv2/gemma7b-19805.ll'
source_filename = "DATASETv2/gemma7b-19805.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.TemporalNexus = type { i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"2222-12-21 14:21:00\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Temporal Nexus:\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Year: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"Month: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Day: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Hour: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"Minute: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"Second: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @temporalNexus(ptr dead_on_unwind noalias writable sret(%struct.TemporalNexus) align 4 %0, ptr noundef %1) #0 {
  %3 = call ptr @strtok(ptr noundef %1, ptr noundef @.str) #4
  %4 = call i32 @atoi(ptr noundef %3) #5
  %5 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 0
  store i32 %4, ptr %5, align 4
  %6 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #4
  %7 = call i32 @atoi(ptr noundef %6) #5
  %8 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 1
  store i32 %7, ptr %8, align 4
  %9 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #4
  %10 = call i32 @atoi(ptr noundef %9) #5
  %11 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 2
  store i32 %10, ptr %11, align 4
  %12 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #4
  %13 = call i32 @atoi(ptr noundef %12) #5
  %14 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 3
  store i32 %13, ptr %14, align 4
  %15 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #4
  %16 = call i32 @atoi(ptr noundef %15) #5
  %17 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 4
  store i32 %16, ptr %17, align 4
  %18 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #4
  %19 = call i32 @atoi(ptr noundef %18) #5
  %20 = getelementptr inbounds %struct.TemporalNexus, ptr %0, i32 0, i32 5
  store i32 %19, ptr %20, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.TemporalNexus, align 4
  call void @temporalNexus(ptr dead_on_unwind writable sret(%struct.TemporalNexus) align 4 %1, ptr noundef @.str.2)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %3 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %4)
  %6 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %7)
  %9 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %10)
  %12 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %13)
  %15 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 4
  %16 = load i32, ptr %15, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %16)
  %18 = getelementptr inbounds %struct.TemporalNexus, ptr %1, i32 0, i32 5
  %19 = load i32, ptr %18, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %19)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
