; ModuleID = 'DATASETv2/gpt4o_mini-12023.c'
source_filename = "DATASETv2/gpt4o_mini-12023.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aes_key_st = type { [60 x i32], i32 }

@.str = private unnamed_addr constant [34 x i8] c"Failed to allocate memory for key\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Failed to generate random key\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Failed to set encryption key\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Failed to generate random IV\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Failed to set decryption key\00", align 1
@.str.5 = private unnamed_addr constant [48 x i8] c"Enter a plaintext message (max %d characters): \00", align 1
@stdin = external global ptr, align 8
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Encrypted message (in hex): \00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"Decrypted message: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @generate_key() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 32) #8
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

6:                                                ; preds = %0
  %7 = load ptr, ptr %1, align 8
  %8 = call i32 @RAND_bytes(ptr noundef %7, i32 noundef 32)
  %9 = icmp ne i32 %8, 1
  br i1 %9, label %10, label %12

10:                                               ; preds = %6
  call void @perror(ptr noundef @.str.1) #9
  %11 = load ptr, ptr %1, align 8
  call void @free(ptr noundef %11) #11
  call void @exit(i32 noundef 1) #10
  unreachable

12:                                               ; preds = %6
  %13 = load ptr, ptr %1, align 8
  ret ptr %13
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @RAND_bytes(ptr noundef, i32 noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encrypt(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.aes_key_st, align 4
  %8 = alloca [16 x i8], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @AES_set_encrypt_key(ptr noundef %9, i32 noundef 256, ptr noundef %7)
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

13:                                               ; preds = %3
  %14 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 0
  %15 = call i32 @RAND_bytes(ptr noundef %14, i32 noundef 16)
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %19, ptr align 16 %20, i64 16, i1 false)
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds i8, ptr %22, i64 16
  %24 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 0
  call void @AES_cbc_encrypt(ptr noundef %21, ptr noundef %23, i64 noundef 8, ptr noundef %7, ptr noundef %24, i32 noundef 1)
  ret void
}

declare i32 @AES_set_encrypt_key(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

declare void @AES_cbc_encrypt(ptr noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @decrypt(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.aes_key_st, align 4
  %8 = alloca [16 x i8], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @AES_set_decrypt_key(ptr noundef %9, i32 noundef 256, ptr noundef %7)
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  call void @perror(ptr noundef @.str.4) #9
  call void @exit(i32 noundef 1) #10
  unreachable

13:                                               ; preds = %3
  %14 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 0
  %15 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %14, ptr align 1 %15, i64 16, i1 false)
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds i8, ptr %16, i64 16
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 0
  call void @AES_cbc_encrypt(ptr noundef %17, ptr noundef %18, i64 noundef 8, ptr noundef %7, ptr noundef %19, i32 noundef 0)
  ret void
}

declare i32 @AES_set_decrypt_key(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [1024 x i8], align 16
  %4 = alloca [1040 x i8], align 16
  %5 = alloca [1024 x i8], align 16
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = call ptr @generate_key()
  store ptr %7, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 1024)
  %9 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %10 = load ptr, ptr @stdin, align 8
  %11 = call ptr @fgets(ptr noundef %9, i32 noundef 1024, ptr noundef %10)
  %12 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %13 = call i64 @strcspn(ptr noundef %12, ptr noundef @.str.6) #12
  %14 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 %13
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %17 = getelementptr inbounds [1040 x i8], ptr %4, i64 0, i64 0
  call void @encrypt(ptr noundef %15, ptr noundef %16, ptr noundef %17)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %30, %0
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = icmp ult i64 %21, 1040
  br i1 %22, label %23, label %33

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [1040 x i8], ptr %4, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = zext i8 %27 to i32
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %28)
  br label %30

30:                                               ; preds = %23
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %6, align 4
  br label %19, !llvm.loop !6

33:                                               ; preds = %19
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds [1040 x i8], ptr %4, i64 0, i64 0
  %37 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  call void @decrypt(ptr noundef %35, ptr noundef %36, ptr noundef %37)
  %38 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %38)
  %40 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %40) #11
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #7

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { nounwind willreturn memory(read) }

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
