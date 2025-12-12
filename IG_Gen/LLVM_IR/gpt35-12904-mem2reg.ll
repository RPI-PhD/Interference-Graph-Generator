; ModuleID = 'LLVM_IR/gpt35-12904.ll'
source_filename = "DATASETv2/gpt35-12904.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { [50 x i8], [100 x i8], ptr, i32, ptr, i32 }
%struct.Attribute = type { [50 x i8], [100 x i8] }

@.str = private unnamed_addr constant [9 x i8] c"%s=\22%s\22 \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"<%s \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"/>\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c">\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"</%s>\0A\00", align 1
@__const.main.xml = private unnamed_addr constant [200 x i8] c"<animals>\0A    <dog breed=\22golden retreiver\22>\0A        <name>Max</name>\0A        <age>3</age>\0A    </dog>\0A    <cat breed=\22siamese\22>\0A        <name>Fluffy</name>\0A        <age>5</age>\0A    </cat>\0A</animals>\0A\00", align 16
@.str.6 = private unnamed_addr constant [4 x i8] c"dog\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"breed\00", align 1
@.str.8 = private unnamed_addr constant [17 x i8] c"Dog's breed: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_node(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %7) #7
  br label %8

8:                                                ; preds = %5, %1
  %9 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %27

12:                                               ; preds = %8
  br label %13

13:                                               ; preds = %22, %12
  %.0 = phi i32 [ 0, %12 ], [ %23, %22 ]
  %14 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 5
  %15 = load i32, ptr %14, align 8
  %16 = icmp slt i32 %.0, %15
  br i1 %16, label %17, label %24

17:                                               ; preds = %13
  %18 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 4
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds %struct.Node, ptr %19, i64 %20
  call void @free_node(ptr noundef %21)
  br label %22

22:                                               ; preds = %17
  %23 = add nsw i32 %.0, 1
  br label %13, !llvm.loop !6

24:                                               ; preds = %13
  %25 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %26) #7
  br label %27

27:                                               ; preds = %24, %8
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @parse_node(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 184) #8
  %5 = load i32, ptr %1, align 4
  store i32 %5, ptr %3, align 4
  br label %6

6:                                                ; preds = %32, %2
  %.02 = phi i32 [ 0, %2 ], [ %35, %32 ]
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 62
  br i1 %12, label %13, label %22

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp ne i32 %18, 32
  br i1 %19, label %20, label %22

20:                                               ; preds = %13
  %21 = icmp slt i32 %.02, 50
  br label %22

22:                                               ; preds = %20, %13, %6
  %23 = phi i1 [ false, %13 ], [ false, %6 ], [ %21, %20 ]
  br i1 %23, label %24, label %36

24:                                               ; preds = %22
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 0
  %30 = sext i32 %.02 to i64
  %31 = getelementptr inbounds [50 x i8], ptr %29, i64 0, i64 %30
  store i8 %28, ptr %31, align 1
  br label %32

32:                                               ; preds = %24
  %33 = load i32, ptr %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %3, align 4
  %35 = add nsw i32 %.02, 1
  br label %6, !llvm.loop !8

36:                                               ; preds = %22
  %37 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 0
  %38 = sext i32 %.02 to i64
  %39 = getelementptr inbounds [50 x i8], ptr %37, i64 0, i64 %38
  store i8 0, ptr %39, align 1
  br label %40

40:                                               ; preds = %178, %36
  %41 = load i32, ptr %3, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, ptr %0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp ne i32 %45, 62
  br i1 %46, label %47, label %179

47:                                               ; preds = %40
  br label %48

48:                                               ; preds = %55, %47
  %49 = load i32, ptr %3, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, 32
  br i1 %54, label %55, label %58

55:                                               ; preds = %48
  %56 = load i32, ptr %3, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %3, align 4
  br label %48, !llvm.loop !9

58:                                               ; preds = %48
  %59 = load i32, ptr %3, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, ptr %0, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp ne i32 %63, 47
  br i1 %64, label %65, label %177

65:                                               ; preds = %58
  %66 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 3
  %67 = load i32, ptr %66, align 8
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %66, align 8
  %69 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 2
  %70 = load ptr, ptr %69, align 8
  %71 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 3
  %72 = load i32, ptr %71, align 8
  %73 = sext i32 %72 to i64
  %74 = mul i64 150, %73
  %75 = call ptr @realloc(ptr noundef %70, i64 noundef %74) #9
  %76 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 2
  store ptr %75, ptr %76, align 8
  %77 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 2
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 3
  %80 = load i32, ptr %79, align 8
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.Attribute, ptr %78, i64 %82
  br label %84

84:                                               ; preds = %110, %65
  %.1 = phi i32 [ 0, %65 ], [ %113, %110 ]
  %85 = load i32, ptr %3, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %0, i64 %86
  %88 = load i8, ptr %87, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp ne i32 %89, 61
  br i1 %90, label %91, label %100

91:                                               ; preds = %84
  %92 = load i32, ptr %3, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, ptr %0, i64 %93
  %95 = load i8, ptr %94, align 1
  %96 = sext i8 %95 to i32
  %97 = icmp ne i32 %96, 32
  br i1 %97, label %98, label %100

98:                                               ; preds = %91
  %99 = icmp slt i32 %.1, 50
  br label %100

100:                                              ; preds = %98, %91, %84
  %101 = phi i1 [ false, %91 ], [ false, %84 ], [ %99, %98 ]
  br i1 %101, label %102, label %114

102:                                              ; preds = %100
  %103 = load i32, ptr %3, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, ptr %0, i64 %104
  %106 = load i8, ptr %105, align 1
  %107 = getelementptr inbounds %struct.Attribute, ptr %83, i32 0, i32 0
  %108 = sext i32 %.1 to i64
  %109 = getelementptr inbounds [50 x i8], ptr %107, i64 0, i64 %108
  store i8 %106, ptr %109, align 1
  br label %110

110:                                              ; preds = %102
  %111 = load i32, ptr %3, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %3, align 4
  %113 = add nsw i32 %.1, 1
  br label %84, !llvm.loop !10

114:                                              ; preds = %100
  %115 = getelementptr inbounds %struct.Attribute, ptr %83, i32 0, i32 0
  %116 = sext i32 %.1 to i64
  %117 = getelementptr inbounds [50 x i8], ptr %115, i64 0, i64 %116
  store i8 0, ptr %117, align 1
  br label %118

118:                                              ; preds = %134, %114
  %119 = load i32, ptr %3, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, ptr %0, i64 %120
  %122 = load i8, ptr %121, align 1
  %123 = sext i8 %122 to i32
  %124 = icmp eq i32 %123, 32
  br i1 %124, label %132, label %125

125:                                              ; preds = %118
  %126 = load i32, ptr %3, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, ptr %0, i64 %127
  %129 = load i8, ptr %128, align 1
  %130 = sext i8 %129 to i32
  %131 = icmp eq i32 %130, 61
  br label %132

132:                                              ; preds = %125, %118
  %133 = phi i1 [ true, %118 ], [ %131, %125 ]
  br i1 %133, label %134, label %137

134:                                              ; preds = %132
  %135 = load i32, ptr %3, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %3, align 4
  br label %118, !llvm.loop !11

137:                                              ; preds = %132
  %138 = load i32, ptr %3, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, ptr %0, i64 %139
  %141 = load i8, ptr %140, align 1
  %142 = sext i8 %141 to i32
  %143 = icmp eq i32 %142, 34
  br i1 %143, label %144, label %176

144:                                              ; preds = %137
  %145 = load i32, ptr %3, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, ptr %3, align 4
  br label %147

147:                                              ; preds = %166, %144
  %.2 = phi i32 [ 0, %144 ], [ %169, %166 ]
  %148 = load i32, ptr %3, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, ptr %0, i64 %149
  %151 = load i8, ptr %150, align 1
  %152 = sext i8 %151 to i32
  %153 = icmp ne i32 %152, 34
  br i1 %153, label %154, label %156

154:                                              ; preds = %147
  %155 = icmp slt i32 %.2, 100
  br label %156

156:                                              ; preds = %154, %147
  %157 = phi i1 [ false, %147 ], [ %155, %154 ]
  br i1 %157, label %158, label %170

158:                                              ; preds = %156
  %159 = load i32, ptr %3, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, ptr %0, i64 %160
  %162 = load i8, ptr %161, align 1
  %163 = getelementptr inbounds %struct.Attribute, ptr %83, i32 0, i32 1
  %164 = sext i32 %.2 to i64
  %165 = getelementptr inbounds [100 x i8], ptr %163, i64 0, i64 %164
  store i8 %162, ptr %165, align 1
  br label %166

166:                                              ; preds = %158
  %167 = load i32, ptr %3, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, ptr %3, align 4
  %169 = add nsw i32 %.2, 1
  br label %147, !llvm.loop !12

170:                                              ; preds = %156
  %171 = getelementptr inbounds %struct.Attribute, ptr %83, i32 0, i32 1
  %172 = sext i32 %.2 to i64
  %173 = getelementptr inbounds [100 x i8], ptr %171, i64 0, i64 %172
  store i8 0, ptr %173, align 1
  %174 = load i32, ptr %3, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %3, align 4
  br label %176

176:                                              ; preds = %170, %137
  br label %178

177:                                              ; preds = %58
  br label %179

178:                                              ; preds = %176
  br label %40, !llvm.loop !13

179:                                              ; preds = %177, %40
  %180 = load i32, ptr %3, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, ptr %3, align 4
  %182 = load i32, ptr %3, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, ptr %0, i64 %183
  %185 = load i8, ptr %184, align 1
  %186 = sext i8 %185 to i32
  %187 = icmp eq i32 %186, 47
  br i1 %187, label %188, label %191

188:                                              ; preds = %179
  %189 = load i32, ptr %3, align 4
  %190 = add nsw i32 %189, 2
  store i32 %190, ptr %3, align 4
  br label %263

191:                                              ; preds = %179
  %192 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 5
  store i32 0, ptr %192, align 8
  %193 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 4
  store ptr null, ptr %193, align 8
  br label %194

194:                                              ; preds = %201, %191
  %.01 = phi i32 [ 0, %191 ], [ %208, %201 ]
  %195 = load i32, ptr %3, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i8, ptr %0, i64 %196
  %198 = load i8, ptr %197, align 1
  %199 = sext i8 %198 to i32
  %200 = icmp ne i32 %199, 60
  br i1 %200, label %201, label %211

201:                                              ; preds = %194
  %202 = load i32, ptr %3, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, ptr %3, align 4
  %204 = sext i32 %202 to i64
  %205 = getelementptr inbounds i8, ptr %0, i64 %204
  %206 = load i8, ptr %205, align 1
  %207 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 1
  %208 = add nsw i32 %.01, 1
  %209 = sext i32 %.01 to i64
  %210 = getelementptr inbounds [100 x i8], ptr %207, i64 0, i64 %209
  store i8 %206, ptr %210, align 1
  br label %194, !llvm.loop !14

211:                                              ; preds = %194
  %212 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 1
  %213 = sext i32 %.01 to i64
  %214 = getelementptr inbounds [100 x i8], ptr %212, i64 0, i64 %213
  store i8 0, ptr %214, align 1
  br label %215

215:                                              ; preds = %239, %211
  %216 = load i32, ptr %3, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i8, ptr %0, i64 %217
  %219 = load i8, ptr %218, align 1
  %220 = sext i8 %219 to i32
  %221 = icmp eq i32 %220, 60
  br i1 %221, label %222, label %261

222:                                              ; preds = %215
  %223 = load i32, ptr %3, align 4
  %224 = add nsw i32 %223, 1
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, ptr %0, i64 %225
  %227 = load i8, ptr %226, align 1
  %228 = sext i8 %227 to i32
  %229 = icmp eq i32 %228, 47
  br i1 %229, label %230, label %239

230:                                              ; preds = %222
  %231 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 0
  %232 = getelementptr inbounds [50 x i8], ptr %231, i64 0, i64 0
  %233 = call i64 @strlen(ptr noundef %232) #10
  %234 = add i64 %233, 2
  %235 = load i32, ptr %3, align 4
  %236 = sext i32 %235 to i64
  %237 = add i64 %236, %234
  %238 = trunc i64 %237 to i32
  store i32 %238, ptr %3, align 4
  br label %261

239:                                              ; preds = %222
  %240 = load i32, ptr %3, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, ptr %3, align 4
  %242 = call ptr @parse_node(ptr noundef %0, ptr noundef %3)
  %243 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 5
  %244 = load i32, ptr %243, align 8
  %245 = add nsw i32 %244, 1
  store i32 %245, ptr %243, align 8
  %246 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 4
  %247 = load ptr, ptr %246, align 8
  %248 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 5
  %249 = load i32, ptr %248, align 8
  %250 = sext i32 %249 to i64
  %251 = mul i64 184, %250
  %252 = call ptr @realloc(ptr noundef %247, i64 noundef %251) #9
  %253 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 4
  store ptr %252, ptr %253, align 8
  %254 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 4
  %255 = load ptr, ptr %254, align 8
  %256 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 5
  %257 = load i32, ptr %256, align 8
  %258 = sub nsw i32 %257, 1
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds %struct.Node, ptr %255, i64 %259
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %260, ptr align 8 %242, i64 184, i1 false)
  call void @free(ptr noundef %242) #7
  br label %215, !llvm.loop !15

261:                                              ; preds = %230, %215
  %262 = load i32, ptr %3, align 4
  store i32 %262, ptr %1, align 4
  br label %263

263:                                              ; preds = %261, %188
  ret ptr %4
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @get_attribute_value(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %24, %2
  %.01 = phi i32 [ 0, %2 ], [ %25, %24 ]
  %4 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %5 = load i32, ptr %4, align 8
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %26

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds %struct.Attribute, ptr %9, i64 %10
  %12 = getelementptr inbounds %struct.Attribute, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef %1) #10
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %7
  %17 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds %struct.Attribute, ptr %18, i64 %19
  %21 = getelementptr inbounds %struct.Attribute, ptr %20, i32 0, i32 1
  %22 = getelementptr inbounds [100 x i8], ptr %21, i64 0, i64 0
  br label %27

23:                                               ; preds = %7
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !16

26:                                               ; preds = %3
  br label %27

27:                                               ; preds = %26, %16
  %.0 = phi ptr [ %22, %16 ], [ null, %26 ]
  ret ptr %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_attributes(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %20, %1
  %.0 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %3 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %22

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds %struct.Attribute, ptr %8, i64 %9
  %11 = getelementptr inbounds %struct.Attribute, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.Attribute, ptr %14, i64 %15
  %17 = getelementptr inbounds %struct.Attribute, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [100 x i8], ptr %17, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %12, ptr noundef %18)
  br label %20

20:                                               ; preds = %6
  %21 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !17

22:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_nodes(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %3)
  call void @print_attributes(ptr noundef %0)
  %5 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 5
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %10 = getelementptr inbounds [100 x i8], ptr %9, i64 0, i64 0
  %11 = call i64 @strlen(ptr noundef %10) #10
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %41

15:                                               ; preds = %8, %1
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %17 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %18 = getelementptr inbounds [100 x i8], ptr %17, i64 0, i64 0
  %19 = call i64 @strlen(ptr noundef %18) #10
  %20 = icmp ugt i64 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %15
  %22 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %23 = getelementptr inbounds [100 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %23)
  br label %25

25:                                               ; preds = %21, %15
  br label %26

26:                                               ; preds = %35, %25
  %.0 = phi i32 [ 0, %25 ], [ %36, %35 ]
  %27 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 5
  %28 = load i32, ptr %27, align 8
  %29 = icmp slt i32 %.0, %28
  br i1 %29, label %30, label %37

30:                                               ; preds = %26
  %31 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 4
  %32 = load ptr, ptr %31, align 8
  %33 = sext i32 %.0 to i64
  %34 = getelementptr inbounds %struct.Node, ptr %32, i64 %33
  call void @print_nodes(ptr noundef %34)
  br label %35

35:                                               ; preds = %30
  %36 = add nsw i32 %.0, 1
  br label %26, !llvm.loop !18

37:                                               ; preds = %26
  %38 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 0
  %39 = getelementptr inbounds [50 x i8], ptr %38, i64 0, i64 0
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %39)
  br label %41

41:                                               ; preds = %37, %13
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @find_node_by_name(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef %1) #10
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %25

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %22, %8
  %.01 = phi i32 [ 0, %8 ], [ %23, %22 ]
  %10 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 5
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %.01, %11
  br i1 %12, label %13, label %24

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds %struct.Node, ptr %15, i64 %16
  %18 = call ptr @find_node_by_name(ptr noundef %17, ptr noundef %1)
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  br label %25

21:                                               ; preds = %13
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !19

24:                                               ; preds = %9
  br label %25

25:                                               ; preds = %24, %20, %7
  %.0 = phi ptr [ %0, %7 ], [ %18, %20 ], [ null, %24 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [200 x i8], align 16
  %2 = alloca i32, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.xml, i64 200, i1 false)
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds [200 x i8], ptr %1, i64 0, i64 0
  %4 = call ptr @parse_node(ptr noundef %3, ptr noundef %2)
  %5 = call ptr @find_node_by_name(ptr noundef %4, ptr noundef @.str.6)
  %6 = call ptr @get_attribute_value(ptr noundef %5, ptr noundef @.str.7)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %6)
  call void @print_nodes(ptr noundef %4)
  call void @free_node(ptr noundef %4)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0,1) }
attributes #9 = { nounwind allocsize(1) }
attributes #10 = { nounwind willreturn memory(read) }

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
