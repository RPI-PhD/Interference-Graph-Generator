; ModuleID = 'LLVM_IR/falcon180b-7894.ll'
source_filename = "DATASETv2/falcon180b-7894.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pcap_pkthdr = type { %struct.timeval, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.packet_data = type { ptr, i32 }
%struct.bpf_program = type { i32, ptr }

@.str = private unnamed_addr constant [5 x i8] c"eth0\00", align 1
@dev = dso_local global ptr null, align 8
@handle = dso_local global ptr null, align 8
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"Error opening device: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"tcp port 80\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Error compiling filter: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Error setting filter: %s\0A\00", align 1
@callback = dso_local global ptr null, align 8
@.str.5 = private unnamed_addr constant [33 x i8] c"Error during packet capture: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @packet_handler(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = getelementptr inbounds %struct.pcap_pkthdr, ptr %1, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = zext i32 %5 to i64
  %7 = call noalias ptr @malloc(i64 noundef %6) #6
  %8 = getelementptr inbounds %struct.packet_data, ptr %0, i32 0, i32 0
  store ptr %7, ptr %8, align 8
  %9 = getelementptr inbounds %struct.pcap_pkthdr, ptr %1, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = getelementptr inbounds %struct.packet_data, ptr %0, i32 0, i32 1
  store i32 %10, ptr %11, align 8
  %12 = getelementptr inbounds %struct.packet_data, ptr %0, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.pcap_pkthdr, ptr %1, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = zext i32 %15 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %13, ptr align 1 %2, i64 %16, i1 false)
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = alloca %struct.bpf_program, align 8
  store ptr @.str, ptr @dev, align 8
  %4 = load ptr, ptr @dev, align 8
  %5 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %6 = call ptr @pcap_open_live(ptr noundef %4, i32 noundef 65535, i32 noundef 1, i32 noundef 0, ptr noundef %5)
  store ptr %6, ptr @handle, align 8
  %7 = load ptr, ptr @handle, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %0
  %10 = load ptr, ptr @stderr, align 8
  %11 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.1, ptr noundef %11)
  call void @exit(i32 noundef 1) #7
  unreachable

13:                                               ; preds = %0
  %14 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %15 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %14, ptr noundef @.str.2) #8
  %16 = load ptr, ptr @handle, align 8
  %17 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %18 = call i32 @pcap_compile(ptr noundef %16, ptr noundef %3, ptr noundef %17, i32 noundef 0, i32 noundef undef)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %13
  %21 = load ptr, ptr @stderr, align 8
  %22 = load ptr, ptr @handle, align 8
  %23 = call ptr @pcap_geterr(ptr noundef %22)
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.3, ptr noundef %23)
  call void @exit(i32 noundef 1) #7
  unreachable

25:                                               ; preds = %13
  %26 = load ptr, ptr @handle, align 8
  %27 = call i32 @pcap_setfilter(ptr noundef %26, ptr noundef %3)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %25
  %30 = load ptr, ptr @stderr, align 8
  %31 = load ptr, ptr @handle, align 8
  %32 = call ptr @pcap_geterr(ptr noundef %31)
  %33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %30, ptr noundef @.str.4, ptr noundef %32)
  call void @exit(i32 noundef 1) #7
  unreachable

34:                                               ; preds = %25
  store ptr @packet_handler, ptr @callback, align 8
  %35 = load ptr, ptr @handle, align 8
  %36 = load ptr, ptr @callback, align 8
  %37 = call i32 @pcap_loop(ptr noundef %35, i32 noundef -1, ptr noundef %36, ptr noundef null)
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %44

39:                                               ; preds = %34
  %40 = load ptr, ptr @stderr, align 8
  %41 = load ptr, ptr @handle, align 8
  %42 = call ptr @pcap_geterr(ptr noundef %41)
  %43 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.5, ptr noundef %42)
  call void @exit(i32 noundef 1) #7
  unreachable

44:                                               ; preds = %34
  %45 = load ptr, ptr @handle, align 8
  call void @pcap_close(ptr noundef %45)
  ret i32 0
}

declare ptr @pcap_open_live(ptr noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @pcap_compile(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef) #3

declare ptr @pcap_geterr(ptr noundef) #3

declare i32 @pcap_setfilter(ptr noundef, ptr noundef) #3

declare i32 @pcap_loop(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare void @pcap_close(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
