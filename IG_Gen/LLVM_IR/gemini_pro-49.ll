; ModuleID = 'DATASETv2/gemini_pro-49.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_room(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call noalias ptr @malloc(i64 noundef 48) #6
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noalias ptr @strdup(ptr noundef %7) #7
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.room, ptr %9, i32 0, i32 0
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call noalias ptr @strdup(ptr noundef %11) #7
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.room, ptr %13, i32 0, i32 1
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.room, ptr %15, i32 0, i32 2
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.room, ptr %17, i32 0, i32 3
  store ptr null, ptr %18, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.room, ptr %19, i32 0, i32 4
  store ptr null, ptr %20, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.room, ptr %21, i32 0, i32 5
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  ret ptr %23
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_player(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call noalias ptr @malloc(i64 noundef 24) #6
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noalias ptr @strdup(ptr noundef %7) #7
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.player, ptr %9, i32 0, i32 0
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.player, ptr %12, i32 0, i32 1
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.player, ptr %14, i32 0, i32 2
  store i32 100, ptr %15, align 8
  %16 = load ptr, ptr %5, align 8
  ret ptr %16
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_room_description(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.room, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.room, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @process_input(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [80 x i8], align 16
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 80, ptr noundef %6)
  %8 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %9 = call i64 @strcspn(ptr noundef %8, ptr noundef @.str.3) #8
  %10 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  %11 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.4) #8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %35

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.player, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.room, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %32

21:                                               ; preds = %14
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.player, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.room, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.player, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.player, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  call void @print_room_description(ptr noundef %31)
  br label %34

32:                                               ; preds = %14
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %34

34:                                               ; preds = %32, %21
  br label %121

35:                                               ; preds = %1
  %36 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %37 = call i32 @strcmp(ptr noundef %36, ptr noundef @.str.6) #8
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %60

39:                                               ; preds = %35
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.player, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.room, ptr %42, i32 0, i32 3
  %44 = load ptr, ptr %43, align 8
  %45 = icmp ne ptr %44, null
  br i1 %45, label %46, label %57

46:                                               ; preds = %39
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.player, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.room, ptr %49, i32 0, i32 3
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.player, ptr %52, i32 0, i32 1
  store ptr %51, ptr %53, align 8
  %54 = load ptr, ptr %2, align 8
  %55 = getelementptr inbounds %struct.player, ptr %54, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  call void @print_room_description(ptr noundef %56)
  br label %59

57:                                               ; preds = %39
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %59

59:                                               ; preds = %57, %46
  br label %120

60:                                               ; preds = %35
  %61 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %62 = call i32 @strcmp(ptr noundef %61, ptr noundef @.str.8) #8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %85

64:                                               ; preds = %60
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.player, ptr %65, i32 0, i32 1
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.room, ptr %67, i32 0, i32 4
  %69 = load ptr, ptr %68, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %82

71:                                               ; preds = %64
  %72 = load ptr, ptr %2, align 8
  %73 = getelementptr inbounds %struct.player, ptr %72, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.room, ptr %74, i32 0, i32 4
  %76 = load ptr, ptr %75, align 8
  %77 = load ptr, ptr %2, align 8
  %78 = getelementptr inbounds %struct.player, ptr %77, i32 0, i32 1
  store ptr %76, ptr %78, align 8
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr inbounds %struct.player, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  call void @print_room_description(ptr noundef %81)
  br label %84

82:                                               ; preds = %64
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %84

84:                                               ; preds = %82, %71
  br label %119

85:                                               ; preds = %60
  %86 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %87 = call i32 @strcmp(ptr noundef %86, ptr noundef @.str.10) #8
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %110

89:                                               ; preds = %85
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.player, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.room, ptr %92, i32 0, i32 5
  %94 = load ptr, ptr %93, align 8
  %95 = icmp ne ptr %94, null
  br i1 %95, label %96, label %107

96:                                               ; preds = %89
  %97 = load ptr, ptr %2, align 8
  %98 = getelementptr inbounds %struct.player, ptr %97, i32 0, i32 1
  %99 = load ptr, ptr %98, align 8
  %100 = getelementptr inbounds %struct.room, ptr %99, i32 0, i32 5
  %101 = load ptr, ptr %100, align 8
  %102 = load ptr, ptr %2, align 8
  %103 = getelementptr inbounds %struct.player, ptr %102, i32 0, i32 1
  store ptr %101, ptr %103, align 8
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr inbounds %struct.player, ptr %104, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  call void @print_room_description(ptr noundef %106)
  br label %109

107:                                              ; preds = %89
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %109

109:                                              ; preds = %107, %96
  br label %118

110:                                              ; preds = %85
  %111 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %112 = call i32 @strcmp(ptr noundef %111, ptr noundef @.str.12) #8
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %115

114:                                              ; preds = %110
  call void @exit(i32 noundef 0) #9
  unreachable

115:                                              ; preds = %110
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %117

117:                                              ; preds = %115
  br label %118

118:                                              ; preds = %117, %109
  br label %119

119:                                              ; preds = %118, %84
  br label %120

120:                                              ; preds = %119, %59
  br label %121

121:                                              ; preds = %120, %34
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local void @game_loop(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %8, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.player, ptr %4, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %3
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.player, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  call void @print_room_description(ptr noundef %11)
  %12 = load ptr, ptr %2, align 8
  call void @process_input(ptr noundef %12)
  br label %3, !llvm.loop !6

13:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %6 = call ptr @create_room(ptr noundef @.str.14, ptr noundef @.str.15)
  store ptr %6, ptr %2, align 8
  %7 = call ptr @create_room(ptr noundef @.str.16, ptr noundef @.str.17)
  store ptr %7, ptr %3, align 8
  %8 = call ptr @create_room(ptr noundef @.str.18, ptr noundef @.str.19)
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.room, ptr %10, i32 0, i32 2
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.room, ptr %13, i32 0, i32 3
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.room, ptr %16, i32 0, i32 4
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.room, ptr %19, i32 0, i32 5
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = call ptr @create_player(ptr noundef @.str.20, ptr noundef %21)
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  call void @game_loop(ptr noundef %23)
  %24 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %24) #7
  %25 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %25) #7
  %26 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %26) #7
  %27 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %27) #7
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
