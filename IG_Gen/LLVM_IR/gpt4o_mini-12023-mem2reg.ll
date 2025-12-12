; ModuleID = 'LLVM_IR/gpt4o_mini-12023.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @generate_key() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 32) #8
  %2 = icmp ne ptr %1, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

4:                                                ; preds = %0
  %5 = call i32 @RAND_bytes(ptr noundef %1, i32 noundef 32)
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  call void @perror(ptr noundef @.str.1) #9
  call void @free(ptr noundef %1) #11
  call void @exit(i32 noundef 1) #10
  unreachable

8:                                                ; preds = %4
  ret ptr %1
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca %struct.aes_key_st, align 4
  %5 = alloca [16 x i8], align 16
  %6 = call i32 @AES_set_encrypt_key(ptr noundef %0, i32 noundef 256, ptr noundef %4)
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %3
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

9:                                                ; preds = %3
  %10 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %11 = call i32 @RAND_bytes(ptr noundef %10, i32 noundef 16)
  %12 = icmp ne i32 %11, 1
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

14:                                               ; preds = %9
  %15 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 16 %15, i64 16, i1 false)
  %16 = getelementptr inbounds i8, ptr %2, i64 16
  %17 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  call void @AES_cbc_encrypt(ptr noundef %1, ptr noundef %16, i64 noundef 8, ptr noundef %4, ptr noundef %17, i32 noundef 1)
  ret void
}

declare i32 @AES_set_encrypt_key(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

declare void @AES_cbc_encrypt(ptr noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @decrypt(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca %struct.aes_key_st, align 4
  %5 = alloca [16 x i8], align 16
  %6 = call i32 @AES_set_decrypt_key(ptr noundef %0, i32 noundef 256, ptr noundef %4)
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %3
  call void @perror(ptr noundef @.str.4) #9
  call void @exit(i32 noundef 1) #10
  unreachable

9:                                                ; preds = %3
  %10 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %10, ptr align 1 %1, i64 16, i1 false)
  %11 = getelementptr inbounds i8, ptr %1, i64 16
  %12 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  call void @AES_cbc_encrypt(ptr noundef %11, ptr noundef %2, i64 noundef 8, ptr noundef %4, ptr noundef %12, i32 noundef 0)
  ret void
}

declare i32 @AES_set_decrypt_key(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca [1040 x i8], align 16
  %3 = alloca [1024 x i8], align 16
  %4 = call ptr @generate_key()
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 1024)
  %6 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 1024, ptr noundef %7)
  %9 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %10 = call i64 @strcspn(ptr noundef %9, ptr noundef @.str.6) #12
  %11 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 %10
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %13 = getelementptr inbounds [1040 x i8], ptr %2, i64 0, i64 0
  call void @encrypt(ptr noundef %4, ptr noundef %12, ptr noundef %13)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %15

15:                                               ; preds = %24, %0
  %.0 = phi i32 [ 0, %0 ], [ %25, %24 ]
  %16 = sext i32 %.0 to i64
  %17 = icmp ult i64 %16, 1040
  br i1 %17, label %18, label %26

18:                                               ; preds = %15
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [1040 x i8], ptr %2, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = zext i8 %21 to i32
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %22)
  br label %24

24:                                               ; preds = %18
  %25 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !6

26:                                               ; preds = %15
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %28 = getelementptr inbounds [1040 x i8], ptr %2, i64 0, i64 0
  %29 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  call void @decrypt(ptr noundef %4, ptr noundef %28, ptr noundef %29)
  %30 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %30)
  call void @free(ptr noundef %4) #11
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #7

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
