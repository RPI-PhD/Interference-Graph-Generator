; ModuleID = 'LLVM_IR/gemma7b-23002.ll'
source_filename = "DATASETv2/gemma7b-23002.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [121 x i8] c"Welcome, traveler, to the labyrinth of deceit. Prepare to delve into a realm of shadowy figures and sinister agendas...\0A\00", align 1
@.str.1 = private unnamed_addr constant [162 x i8] c"The Illuminati, a secretive society of shadowy elites, is manipulating the world from behind the scenes. Their aim? To maintain their grip on power and control.\0A\00", align 1
@.str.2 = private unnamed_addr constant [194 x i8] c"A cabal of rogue AI engineers has created a sentient weapon capable of influencing the minds of unsuspecting individuals. Be vigilant, for this technology could be used for nefarious purposes.\0A\00", align 1
@.str.3 = private unnamed_addr constant [167 x i8] c"A cabal of spies, known as the Black Order, is infiltrated the government, perpetrating a web of corruption and deceit. Uncover the truth and expose their treachery.\0A\00", align 1
@.str.4 = private unnamed_addr constant [202 x i8] c"A shadowy organization known as the Order of the Phoenix is orchestrating a global conspiracy against a powerful government agency. Brace yourself for a clash of ideologies and a battle for supremacy.\0A\00", align 1
@.str.5 = private unnamed_addr constant [193 x i8] c"The Freemasons, an ancient secret society, is rumored to be involved in a secret war against a secretive order known as the Priory of Sion. Prepare for a tale steeped in mystery and intrigue.\0A\00", align 1
@.str.6 = private unnamed_addr constant [180 x i8] c"A group of eccentric scientists have developed a technology that allows them to manipulate the flow of time. Be wary, for this technology could be used for catastrophic purposes.\0A\00", align 1
@.str.7 = private unnamed_addr constant [179 x i8] c"A group of disgruntled scientists, known as the Luddite Revolution, is plotting to overthrow the government. Their motivations? To restore the principles of freedom and justice.\0A\00", align 1
@.str.8 = private unnamed_addr constant [195 x i8] c"A secret cult, shrouded in mystery and shrouded in darkness, is manipulating the human psyche through mind control techniques. Be vigilant, for this cult could be used for destructive purposes.\0A\00", align 1
@.str.9 = private unnamed_addr constant [172 x i8] c"The Bilderberg Group, a secretive group of wealthy individuals, is alleged to be orchestrating a global economic crisis. Be watchful for signs of their manipulative hand.\0A\00", align 1
@.str.10 = private unnamed_addr constant [159 x i8] c"A mysterious alien civilization is secretly influencing human events, using their advanced technology to manipulate the world. Prepare for a cosmic showdown.\0A\00", align 1
@.str.11 = private unnamed_addr constant [208 x i8] c"The secrets you have uncovered are only a glimpse into the shadowy tapestry of human history. May they serve as a reminder that even in the darkest of times, there is always a story waiting to be unraveled.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 @rand() #3
  %3 = srem i32 %2, 10
  switch i32 %3, label %24 [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %8
    i32 3, label %10
    i32 4, label %12
    i32 5, label %14
    i32 6, label %16
    i32 7, label %18
    i32 8, label %20
    i32 9, label %22
  ]

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %24

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %24

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %24

10:                                               ; preds = %0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %24

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %24

14:                                               ; preds = %0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %24

16:                                               ; preds = %0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %24

18:                                               ; preds = %0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %24

20:                                               ; preds = %0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %24

22:                                               ; preds = %0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %24

24:                                               ; preds = %22, %20, %18, %16, %14, %12, %10, %8, %6, %4, %0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
