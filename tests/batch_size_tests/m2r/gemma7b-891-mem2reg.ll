; ModuleID = 'LLVM_IR/gemma7b-891.ll'
source_filename = "DATASETv2/gemma7b-891.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FileEntry = type { [255 x i8], ptr, i64 }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"my_file.txt\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"another_file.doc\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @CreateFileEntry(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 272) #4
  %3 = getelementptr inbounds %struct.FileEntry, ptr %2, i32 0, i32 0
  %4 = getelementptr inbounds [255 x i8], ptr %3, i64 0, i64 0
  %5 = call ptr @strcpy(ptr noundef %4, ptr noundef %0) #5
  %6 = getelementptr inbounds %struct.FileEntry, ptr %2, i32 0, i32 1
  store ptr null, ptr %6, align 8
  %7 = call i64 @time(ptr noundef null) #5
  %8 = getelementptr inbounds %struct.FileEntry, ptr %2, i32 0, i32 2
  store i64 %7, ptr %8, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @AddFileEntry(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call ptr @CreateFileEntry(ptr noundef %1)
  %4 = icmp eq ptr %0, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  br label %8

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.FileEntry, ptr %0, i32 0, i32 1
  store ptr %3, ptr %7, align 8
  br label %8

8:                                                ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @BackupFiles(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %12, %1
  %.0 = phi ptr [ %0, %1 ], [ %14, %12 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %15

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.FileEntry, ptr %.0, i32 0, i32 0
  %6 = getelementptr inbounds [255 x i8], ptr %5, i64 0, i64 0
  %7 = call noalias ptr @fopen(ptr noundef %6, ptr noundef @.str)
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %4
  %10 = call i32 @fclose(ptr noundef %7)
  br label %11

11:                                               ; preds = %9, %4
  br label %12

12:                                               ; preds = %11
  %13 = getelementptr inbounds %struct.FileEntry, ptr %.0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  br label %2, !llvm.loop !6

15:                                               ; preds = %2
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @AddFileEntry(ptr noundef null, ptr noundef @.str.1)
  call void @AddFileEntry(ptr noundef null, ptr noundef @.str.2)
  call void @BackupFiles(ptr noundef null)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
