; ModuleID = 'LLVM_IR/gemini_pro-49.ll'
source_filename = "DATASETv2/gemini_pro-49.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.room = type { ptr, ptr, ptr, ptr, ptr, ptr }
%struct.player = type { ptr, ptr, i32 }

@.str = private unnamed_addr constant [21 x i8] c"\0AYou are in the %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"> \00", align 1
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"north\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"There is no door to the north.\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"south\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"There is no door to the south.\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"east\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c"There is no door to the east.\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"west\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"There is no door to the west.\0A\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"quit\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"Invalid command.\0A\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"Room 1\00", align 1
@.str.15 = private unnamed_addr constant [24 x i8] c"This is the first room.\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"Room 2\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"This is the second room.\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"Room 3\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c"This is the third room.\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"Player\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_room(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 48) #6
  %4 = call noalias ptr @strdup(ptr noundef %0) #7
  %5 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 0
  store ptr %4, ptr %5, align 8
  %6 = call noalias ptr @strdup(ptr noundef %1) #7
  %7 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 1
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 2
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 3
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 4
  store ptr null, ptr %10, align 8
  %11 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 5
  store ptr null, ptr %11, align 8
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_player(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 24) #6
  %4 = call noalias ptr @strdup(ptr noundef %0) #7
  %5 = getelementptr inbounds %struct.player, ptr %3, i32 0, i32 0
  store ptr %4, ptr %5, align 8
  %6 = getelementptr inbounds %struct.player, ptr %3, i32 0, i32 1
  store ptr %1, ptr %6, align 8
  %7 = getelementptr inbounds %struct.player, ptr %3, i32 0, i32 2
  store i32 100, ptr %7, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_room_description(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.room, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  %5 = getelementptr inbounds %struct.room, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @process_input(ptr noundef %0) #0 {
  %2 = alloca [80 x i8], align 16
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 80, ptr noundef %5)
  %7 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %8 = call i64 @strcspn(ptr noundef %7, ptr noundef @.str.3) #8
  %9 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 %8
  store i8 0, ptr %9, align 1
  %10 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef @.str.4) #8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %30

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.room, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %27

19:                                               ; preds = %13
  %20 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.room, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  store ptr %23, ptr %24, align 8
  %25 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  call void @print_room_description(ptr noundef %26)
  br label %29

27:                                               ; preds = %13
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %29

29:                                               ; preds = %27, %19
  br label %104

30:                                               ; preds = %1
  %31 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %32 = call i32 @strcmp(ptr noundef %31, ptr noundef @.str.6) #8
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %51

34:                                               ; preds = %30
  %35 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.room, ptr %36, i32 0, i32 3
  %38 = load ptr, ptr %37, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %48

40:                                               ; preds = %34
  %41 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.room, ptr %42, i32 0, i32 3
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  store ptr %44, ptr %45, align 8
  %46 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  call void @print_room_description(ptr noundef %47)
  br label %50

48:                                               ; preds = %34
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %50

50:                                               ; preds = %48, %40
  br label %103

51:                                               ; preds = %30
  %52 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %53 = call i32 @strcmp(ptr noundef %52, ptr noundef @.str.8) #8
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %72

55:                                               ; preds = %51
  %56 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.room, ptr %57, i32 0, i32 4
  %59 = load ptr, ptr %58, align 8
  %60 = icmp ne ptr %59, null
  br i1 %60, label %61, label %69

61:                                               ; preds = %55
  %62 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr inbounds %struct.room, ptr %63, i32 0, i32 4
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  store ptr %65, ptr %66, align 8
  %67 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %68 = load ptr, ptr %67, align 8
  call void @print_room_description(ptr noundef %68)
  br label %71

69:                                               ; preds = %55
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %71

71:                                               ; preds = %69, %61
  br label %102

72:                                               ; preds = %51
  %73 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %74 = call i32 @strcmp(ptr noundef %73, ptr noundef @.str.10) #8
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %93

76:                                               ; preds = %72
  %77 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.room, ptr %78, i32 0, i32 5
  %80 = load ptr, ptr %79, align 8
  %81 = icmp ne ptr %80, null
  br i1 %81, label %82, label %90

82:                                               ; preds = %76
  %83 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds %struct.room, ptr %84, i32 0, i32 5
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  store ptr %86, ptr %87, align 8
  %88 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %89 = load ptr, ptr %88, align 8
  call void @print_room_description(ptr noundef %89)
  br label %92

90:                                               ; preds = %76
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %92

92:                                               ; preds = %90, %82
  br label %101

93:                                               ; preds = %72
  %94 = getelementptr inbounds [80 x i8], ptr %2, i64 0, i64 0
  %95 = call i32 @strcmp(ptr noundef %94, ptr noundef @.str.12) #8
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %98

97:                                               ; preds = %93
  call void @exit(i32 noundef 0) #9
  unreachable

98:                                               ; preds = %93
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %100

100:                                              ; preds = %98
  br label %101

101:                                              ; preds = %100, %92
  br label %102

102:                                              ; preds = %101, %71
  br label %103

103:                                              ; preds = %102, %50
  br label %104

104:                                              ; preds = %103, %29
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @game_loop(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %6, %1
  %3 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 2
  %4 = load i32, ptr %3, align 8
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.player, ptr %0, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  call void @print_room_description(ptr noundef %8)
  call void @process_input(ptr noundef %0)
  br label %2, !llvm.loop !6

9:                                                ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_room(ptr noundef @.str.14, ptr noundef @.str.15)
  %2 = call ptr @create_room(ptr noundef @.str.16, ptr noundef @.str.17)
  %3 = call ptr @create_room(ptr noundef @.str.18, ptr noundef @.str.19)
  %4 = getelementptr inbounds %struct.room, ptr %1, i32 0, i32 2
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds %struct.room, ptr %2, i32 0, i32 3
  store ptr %1, ptr %5, align 8
  %6 = getelementptr inbounds %struct.room, ptr %2, i32 0, i32 4
  store ptr %3, ptr %6, align 8
  %7 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 5
  store ptr %2, ptr %7, align 8
  %8 = call ptr @create_player(ptr noundef @.str.20, ptr noundef %1)
  call void @game_loop(ptr noundef %8)
  call void @free(ptr noundef %1) #7
  call void @free(ptr noundef %2) #7
  call void @free(ptr noundef %3) #7
  call void @free(ptr noundef %8) #7
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { noreturn nounwind }

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
