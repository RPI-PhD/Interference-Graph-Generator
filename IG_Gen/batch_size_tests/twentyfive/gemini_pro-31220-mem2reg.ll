; ModuleID = 'LLVM_IR/gemini_pro-31220.ll'
source_filename = "DATASETv2/gemini_pro-31220.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.key = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 16
@__const.main.iv = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 16
@__const.main.data = private unnamed_addr constant [14 x i8] c"Hello, world!\00", align 1
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [33 x i8] c"Could not create cipher context\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"Could not initialize cipher context\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not encrypt data\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Could not finalize encryption\0A\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Encrypted data: \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [39 x i8] c"Could not reinitialize cipher context\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Could not decrypt data\0A\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c"Could not finalize decryption\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"Decrypted data: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [17 x i8], align 16
  %2 = alloca [17 x i8], align 16
  %3 = alloca [14 x i8], align 1
  %4 = alloca [1024 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca [1024 x i8], align 16
  %7 = alloca i32, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.key, i64 17, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.iv, i64 17, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.data, i64 14, i1 false)
  %8 = call ptr @EVP_CIPHER_CTX_new()
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %0
  %11 = load ptr, ptr @stderr, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str)
  br label %88

13:                                               ; preds = %0
  %14 = call ptr @EVP_aes_256_cbc()
  %15 = getelementptr inbounds [17 x i8], ptr %1, i64 0, i64 0
  %16 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  %17 = call i32 @EVP_CipherInit_ex(ptr noundef %8, ptr noundef %14, ptr noundef null, ptr noundef %15, ptr noundef %16, i32 noundef 1)
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %19, label %22

19:                                               ; preds = %13
  %20 = load ptr, ptr @stderr, align 8
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.1)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

22:                                               ; preds = %13
  %23 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %24 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0
  %25 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0
  %26 = call i64 @strlen(ptr noundef %25) #4
  %27 = trunc i64 %26 to i32
  %28 = call i32 @EVP_CipherUpdate(ptr noundef %8, ptr noundef %23, ptr noundef %5, ptr noundef %24, i32 noundef %27)
  %29 = icmp ne i32 %28, 1
  br i1 %29, label %30, label %33

30:                                               ; preds = %22
  %31 = load ptr, ptr @stderr, align 8
  %32 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %31, ptr noundef @.str.2)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

33:                                               ; preds = %22
  %34 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %35 = load i32, ptr %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %34, i64 %36
  %38 = call i32 @EVP_CipherFinal_ex(ptr noundef %8, ptr noundef %37, ptr noundef %5)
  %39 = icmp ne i32 %38, 1
  br i1 %39, label %40, label %43

40:                                               ; preds = %33
  %41 = load ptr, ptr @stderr, align 8
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.3)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

43:                                               ; preds = %33
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %45

45:                                               ; preds = %54, %43
  %.01 = phi i32 [ 0, %43 ], [ %55, %54 ]
  %46 = load i32, ptr %5, align 4
  %47 = icmp slt i32 %.01, %46
  br i1 %47, label %48, label %56

48:                                               ; preds = %45
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %49
  %51 = load i8, ptr %50, align 1
  %52 = zext i8 %51 to i32
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %52)
  br label %54

54:                                               ; preds = %48
  %55 = add nsw i32 %.01, 1
  br label %45, !llvm.loop !6

56:                                               ; preds = %45
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %58 = call ptr @EVP_aes_256_cbc()
  %59 = getelementptr inbounds [17 x i8], ptr %1, i64 0, i64 0
  %60 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  %61 = call i32 @EVP_CipherInit_ex(ptr noundef %8, ptr noundef %58, ptr noundef null, ptr noundef %59, ptr noundef %60, i32 noundef 0)
  %62 = icmp ne i32 %61, 1
  br i1 %62, label %63, label %66

63:                                               ; preds = %56
  %64 = load ptr, ptr @stderr, align 8
  %65 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %64, ptr noundef @.str.7)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

66:                                               ; preds = %56
  %67 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %68 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %69 = load i32, ptr %5, align 4
  %70 = call i32 @EVP_CipherUpdate(ptr noundef %8, ptr noundef %67, ptr noundef %7, ptr noundef %68, i32 noundef %69)
  %71 = icmp ne i32 %70, 1
  br i1 %71, label %72, label %75

72:                                               ; preds = %66
  %73 = load ptr, ptr @stderr, align 8
  %74 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %73, ptr noundef @.str.8)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

75:                                               ; preds = %66
  %76 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %77 = load i32, ptr %7, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, ptr %76, i64 %78
  %80 = call i32 @EVP_CipherFinal_ex(ptr noundef %8, ptr noundef %79, ptr noundef %7)
  %81 = icmp ne i32 %80, 1
  br i1 %81, label %82, label %85

82:                                               ; preds = %75
  %83 = load ptr, ptr @stderr, align 8
  %84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %83, ptr noundef @.str.9)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

85:                                               ; preds = %75
  %86 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %86)
  call void @EVP_CIPHER_CTX_free(ptr noundef %8)
  br label %88

88:                                               ; preds = %85, %82, %72, %63, %40, %30, %19, %10
  %.0 = phi i32 [ 1, %10 ], [ 1, %19 ], [ 1, %30 ], [ 1, %40 ], [ 1, %63 ], [ 1, %72 ], [ 1, %82 ], [ 0, %85 ]
  ret i32 %.0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare ptr @EVP_CIPHER_CTX_new() #2

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

declare i32 @EVP_CipherInit_ex(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

declare ptr @EVP_aes_256_cbc() #2

declare void @EVP_CIPHER_CTX_free(ptr noundef) #2

declare i32 @EVP_CipherUpdate(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

declare i32 @EVP_CipherFinal_ex(ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }

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
