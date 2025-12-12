; ModuleID = 'DATASETv2/gemini_pro-31220.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [17 x i8], align 16
  %3 = alloca [17 x i8], align 16
  %4 = alloca [14 x i8], align 1
  %5 = alloca [1024 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca [1024 x i8], align 16
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.key, i64 17, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.iv, i64 17, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %4, ptr align 1 @__const.main.data, i64 14, i1 false)
  %11 = call ptr @EVP_CIPHER_CTX_new()
  store ptr %11, ptr %7, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %0
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str)
  store i32 1, ptr %1, align 4
  br label %108

17:                                               ; preds = %0
  %18 = load ptr, ptr %7, align 8
  %19 = call ptr @EVP_aes_256_cbc()
  %20 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  %21 = getelementptr inbounds [17 x i8], ptr %3, i64 0, i64 0
  %22 = call i32 @EVP_CipherInit_ex(ptr noundef %18, ptr noundef %19, ptr noundef null, ptr noundef %20, ptr noundef %21, i32 noundef 1)
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %24, label %28

24:                                               ; preds = %17
  %25 = load ptr, ptr @stderr, align 8
  %26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.1)
  %27 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %27)
  store i32 1, ptr %1, align 4
  br label %108

28:                                               ; preds = %17
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %31 = getelementptr inbounds [14 x i8], ptr %4, i64 0, i64 0
  %32 = getelementptr inbounds [14 x i8], ptr %4, i64 0, i64 0
  %33 = call i64 @strlen(ptr noundef %32) #4
  %34 = trunc i64 %33 to i32
  %35 = call i32 @EVP_CipherUpdate(ptr noundef %29, ptr noundef %30, ptr noundef %6, ptr noundef %31, i32 noundef %34)
  %36 = icmp ne i32 %35, 1
  br i1 %36, label %37, label %41

37:                                               ; preds = %28
  %38 = load ptr, ptr @stderr, align 8
  %39 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.2)
  %40 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %40)
  store i32 1, ptr %1, align 4
  br label %108

41:                                               ; preds = %28
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, ptr %43, i64 %45
  %47 = call i32 @EVP_CipherFinal_ex(ptr noundef %42, ptr noundef %46, ptr noundef %6)
  %48 = icmp ne i32 %47, 1
  br i1 %48, label %49, label %53

49:                                               ; preds = %41
  %50 = load ptr, ptr @stderr, align 8
  %51 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.3)
  %52 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %52)
  store i32 1, ptr %1, align 4
  br label %108

53:                                               ; preds = %41
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %8, align 4
  br label %55

55:                                               ; preds = %66, %53
  %56 = load i32, ptr %8, align 4
  %57 = load i32, ptr %6, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %69

59:                                               ; preds = %55
  %60 = load i32, ptr %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %64)
  br label %66

66:                                               ; preds = %59
  %67 = load i32, ptr %8, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %8, align 4
  br label %55, !llvm.loop !6

69:                                               ; preds = %55
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %71 = load ptr, ptr %7, align 8
  %72 = call ptr @EVP_aes_256_cbc()
  %73 = getelementptr inbounds [17 x i8], ptr %2, i64 0, i64 0
  %74 = getelementptr inbounds [17 x i8], ptr %3, i64 0, i64 0
  %75 = call i32 @EVP_CipherInit_ex(ptr noundef %71, ptr noundef %72, ptr noundef null, ptr noundef %73, ptr noundef %74, i32 noundef 0)
  %76 = icmp ne i32 %75, 1
  br i1 %76, label %77, label %81

77:                                               ; preds = %69
  %78 = load ptr, ptr @stderr, align 8
  %79 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %78, ptr noundef @.str.7)
  %80 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %80)
  store i32 1, ptr %1, align 4
  br label %108

81:                                               ; preds = %69
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %84 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %85 = load i32, ptr %6, align 4
  %86 = call i32 @EVP_CipherUpdate(ptr noundef %82, ptr noundef %83, ptr noundef %10, ptr noundef %84, i32 noundef %85)
  %87 = icmp ne i32 %86, 1
  br i1 %87, label %88, label %92

88:                                               ; preds = %81
  %89 = load ptr, ptr @stderr, align 8
  %90 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %89, ptr noundef @.str.8)
  %91 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %91)
  store i32 1, ptr %1, align 4
  br label %108

92:                                               ; preds = %81
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %95 = load i32, ptr %10, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, ptr %94, i64 %96
  %98 = call i32 @EVP_CipherFinal_ex(ptr noundef %93, ptr noundef %97, ptr noundef %10)
  %99 = icmp ne i32 %98, 1
  br i1 %99, label %100, label %104

100:                                              ; preds = %92
  %101 = load ptr, ptr @stderr, align 8
  %102 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %101, ptr noundef @.str.9)
  %103 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %103)
  store i32 1, ptr %1, align 4
  br label %108

104:                                              ; preds = %92
  %105 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %105)
  %107 = load ptr, ptr %7, align 8
  call void @EVP_CIPHER_CTX_free(ptr noundef %107)
  store i32 0, ptr %1, align 4
  br label %108

108:                                              ; preds = %104, %100, %88, %77, %49, %37, %24, %14
  %109 = load i32, ptr %1, align 4
  ret i32 %109
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
