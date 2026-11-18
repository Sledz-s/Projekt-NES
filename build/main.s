; ModuleID = '/mnt/d169bdf4-1bb1-426d-bcf6-c9d82c00e4d8/Robocze/Wiz/NES/Testowy_Projekt/src/main.c'
source_filename = "/mnt/d169bdf4-1bb1-426d-bcf6-c9d82c00e4d8/Robocze/Wiz/NES/Testowy_Projekt/src/main.c"
target datalayout = "e-m:e-p:16:8-p1:8:8-i16:8-i32:8-i64:8-f32:8-f64:8-a:8-Fi8-n8"
target triple = "mos-nes-nrom"

@nmi_ready = dso_local global i8 0, align 1, !guid !0
@current_color = dso_local global i8 42, align 1, !guid !1
@update_palette = dso_local global i8 0, align 1, !guid !2
@oam_buffer = dso_local local_unnamed_addr global [256 x i8] zeroinitializer, align 256, !guid !3

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @nmi() local_unnamed_addr #0 !guid !13 {
  %1 = load volatile i8, ptr @update_palette, align 1, !tbaa !14
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %6, label %3

3:                                                ; preds = %0
  %4 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  %5 = load volatile i8, ptr @current_color, align 1, !tbaa !14
  store volatile i8 %5, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  store volatile i8 0, ptr @update_palette, align 1, !tbaa !14
  br label %6

6:                                                ; preds = %3, %0
  %7 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !14
  store volatile i8 -128, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !14
  store volatile i8 10, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !14
  store volatile i8 1, ptr @nmi_ready, align 1, !tbaa !14
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_set_address(i16 noundef %0) local_unnamed_addr #1 !guid !15 {
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  %3 = lshr i16 %0, 8
  %4 = trunc nuw i16 %3 to i8
  store volatile i8 %4, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  %5 = trunc i16 %0 to i8
  store volatile i8 %5, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_clear_nametable() local_unnamed_addr #1 !guid !16 {
  %1 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  br label %3

2:                                                ; preds = %3
  ret void

3:                                                ; preds = %0, %3
  %4 = phi i16 [ 0, %0 ], [ %5, %3 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  %5 = add nuw nsw i16 %4, 1
  %6 = icmp eq i16 %5, 1024
  br i1 %6, label %2, label %3, !llvm.loop !17
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_draw_test_tile() local_unnamed_addr #1 !guid !19 {
  %1 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @Reset() local_unnamed_addr #1 !guid !20 {
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !14
  br label %1

1:                                                ; preds = %1, %0
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  %3 = icmp sgt i8 %2, -1
  br i1 %3, label %1, label %4, !llvm.loop !21

4:                                                ; preds = %1, %4
  %5 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  %6 = icmp sgt i8 %5, -1
  br i1 %6, label %4, label %7, !llvm.loop !21

7:                                                ; preds = %4
  %8 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  br label %9

9:                                                ; preds = %9, %7
  %10 = phi i16 [ 0, %7 ], [ %11, %9 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  %11 = add nuw nsw i16 %10, 1
  %12 = icmp eq i16 %11, 1024
  br i1 %12, label %13, label %9, !llvm.loop !17

13:                                               ; preds = %9
  %14 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  store volatile i8 42, ptr @current_color, align 1, !tbaa !14
  store volatile i8 1, ptr @update_palette, align 1, !tbaa !14
  ret void
}

; Function Attrs: noreturn nounwind
define dso_local noundef i16 @main() local_unnamed_addr #2 !guid !22 {
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !14
  br label %1

1:                                                ; preds = %1, %0
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  %3 = icmp sgt i8 %2, -1
  br i1 %3, label %1, label %4, !llvm.loop !21

4:                                                ; preds = %1, %4
  %5 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  %6 = icmp sgt i8 %5, -1
  br i1 %6, label %4, label %7, !llvm.loop !21

7:                                                ; preds = %4
  %8 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  br label %9

9:                                                ; preds = %9, %7
  %10 = phi i16 [ 0, %7 ], [ %11, %9 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  %11 = add nuw nsw i16 %10, 1
  %12 = icmp eq i16 %11, 1024
  br i1 %12, label %13, label %9, !llvm.loop !17

13:                                               ; preds = %9
  %14 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !14
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !14
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !14
  store volatile i8 42, ptr @current_color, align 1, !tbaa !14
  store volatile i8 1, ptr @update_palette, align 1, !tbaa !14
  store volatile i8 -128, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !14
  br label %15

15:                                               ; preds = %36, %13
  %16 = phi i8 [ 0, %13 ], [ %21, %36 ]
  br label %17

17:                                               ; preds = %17, %15
  %18 = load volatile i8, ptr @nmi_ready, align 1, !tbaa !14
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %17, label %20, !llvm.loop !23

20:                                               ; preds = %17
  store volatile i8 0, ptr @nmi_ready, align 1, !tbaa !14
  %21 = tail call zeroext i8 @read_controller_1() #4
  %22 = zext i8 %21 to i16
  %23 = and i16 %22, 1
  %24 = icmp eq i16 %23, 0
  br i1 %24, label %29, label %25

25:                                               ; preds = %20
  %26 = and i8 %16, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store volatile i8 43, ptr @current_color, align 1, !tbaa !14
  store volatile i8 1, ptr @update_palette, align 1, !tbaa !14
  br label %29

29:                                               ; preds = %28, %25, %20
  %30 = and i16 %22, 2
  %31 = icmp eq i16 %30, 0
  br i1 %31, label %36, label %32

32:                                               ; preds = %29
  %33 = and i8 %16, 2
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  store volatile i8 42, ptr @current_color, align 1, !tbaa !14
  store volatile i8 1, ptr @update_palette, align 1, !tbaa !14
  br label %36

36:                                               ; preds = %35, %32, %29
  br label %15
}

declare dso_local zeroext i8 @read_controller_1() local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "interrupt-norecurse" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = !{i64 -1789392151253431434}
!1 = !{i64 -3713974878293163476}
!2 = !{i64 -1925709021488259748}
!3 = !{i64 -7201264821641068761}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ThinLTO", i32 0}
!6 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!7 = !{!"clang version 24.0.0git (https://github.com/llvm-mos/llvm-mos a40207a371b60ff787ece46817d9c0f62eada719)"}
!8 = !{!9, !10, i64 0}
!9 = !{!"__libc_errno", !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{i64 4406504767366742204}
!14 = !{!11, !11, i64 0}
!15 = !{i64 6329947078378131458}
!16 = !{i64 -8544342151232735994}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{i64 -1914443377477637936}
!20 = !{i64 4354321371319790930}
!21 = distinct !{!21, !18}
!22 = !{i64 -2624081020897602054}
!23 = distinct !{!23, !18}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "Reset", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 25, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), refs: (^7, ^9)))) ; guid = 4354321371319790930
^2 = gv: (name: "nmi", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 20, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), refs: (^9, ^7, ^11)))) ; guid = 4406504767366742204
^3 = gv: (name: "ppu_set_address", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 7, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 6329947078378131458
^4 = gv: (name: "ppu_clear_nametable", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 10, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 9902401922476815622
^5 = gv: (name: "read_controller_1") ; guid = 10562001439917643255
^6 = gv: (name: "oam_buffer", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 11245479252068482855
^7 = gv: (name: "current_color", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 14732769195416388140
^8 = gv: (name: "main", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 53, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^5, tail: 1)), refs: (^7, ^9, ^11)))) ; guid = 15822663052811949562
^9 = gv: (name: "update_palette", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 16521035052221291868
^10 = gv: (name: "ppu_draw_test_tile", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 5, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 16532300696231913680
^11 = gv: (name: "nmi_ready", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 16657351922456120182
^12 = flags: 8
^13 = blockcount: 0
