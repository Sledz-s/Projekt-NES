; ModuleID = '/mnt/d169bdf4-1bb1-426d-bcf6-c9d82c00e4d8/Robocze/Wiz/NES/Testowy_Projekt/src/main.c'
source_filename = "/mnt/d169bdf4-1bb1-426d-bcf6-c9d82c00e4d8/Robocze/Wiz/NES/Testowy_Projekt/src/main.c"
target datalayout = "e-m:e-p:16:8-p1:8:8-i16:8-i32:8-i64:8-f32:8-f64:8-a:8-Fi8-n8"
target triple = "mos-nes-nrom"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_wait_vblank() local_unnamed_addr #0 !guid !9 {
  br label %1

1:                                                ; preds = %1, %0
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  %3 = icmp sgt i8 %2, -1
  br i1 %3, label %1, label %4, !llvm.loop !11

4:                                                ; preds = %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_set_address(i16 noundef %0) local_unnamed_addr #0 !guid !13 {
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  %3 = lshr i16 %0, 8
  %4 = trunc nuw i16 %3 to i8
  store volatile i8 %4, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  %5 = trunc i16 %0 to i8
  store volatile i8 %5, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_set_nametable(i8 noundef zeroext %0) local_unnamed_addr #0 !guid !14 {
  %2 = and i8 %0, 3
  store volatile i8 %2, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_clear_nametable() local_unnamed_addr #0 !guid !15 {
  %1 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  br label %3

2:                                                ; preds = %3
  ret void

3:                                                ; preds = %0, %3
  %4 = phi i16 [ 0, %0 ], [ %5, %3 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  %5 = add nuw nsw i16 %4, 1
  %6 = icmp eq i16 %5, 1024
  br i1 %6, label %2, label %3, !llvm.loop !16
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_set_palette(i8 noundef zeroext %0) local_unnamed_addr #0 !guid !17 {
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 %0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  %3 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_draw_test_tile() local_unnamed_addr #0 !guid !18 {
  %1 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @ppu_reset_scroll() local_unnamed_addr #0 !guid !19 {
  %1 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  store volatile i8 10, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define dso_local void @Reset() local_unnamed_addr #0 !guid !20 {
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !10
  br label %1

1:                                                ; preds = %1, %0
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  %3 = icmp sgt i8 %2, -1
  br i1 %3, label %1, label %4, !llvm.loop !11

4:                                                ; preds = %1
  %5 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  br label %6

6:                                                ; preds = %6, %4
  %7 = phi i16 [ 0, %4 ], [ %8, %6 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  %8 = add nuw nsw i16 %7, 1
  %9 = icmp eq i16 %8, 1024
  br i1 %9, label %10, label %6, !llvm.loop !16

10:                                               ; preds = %6
  %11 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 42, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  %12 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  %13 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  %14 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  store volatile i8 10, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  ret void
}

; Function Attrs: noreturn nounwind
define dso_local noundef i16 @main() local_unnamed_addr #1 !guid !21 {
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !10
  br label %1

1:                                                ; preds = %1, %0
  %2 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  %3 = icmp sgt i8 %2, -1
  br i1 %3, label %1, label %4, !llvm.loop !11

4:                                                ; preds = %1
  %5 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 32, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  br label %6

6:                                                ; preds = %6, %4
  %7 = phi i16 [ 0, %4 ], [ %8, %6 ]
  store volatile i8 0, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  %8 = add nuw nsw i16 %7, 1
  %9 = icmp eq i16 %8, 1024
  br i1 %9, label %10, label %6, !llvm.loop !16

10:                                               ; preds = %6
  %11 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 42, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  %12 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  %13 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 33, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 74, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 1, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  %14 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  store volatile i8 10, ptr inttoptr (i16 8193 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  br label %15

15:                                               ; preds = %40, %10
  %16 = phi i8 [ 0, %10 ], [ %21, %40 ]
  br label %17

17:                                               ; preds = %17, %15
  %18 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  %19 = icmp sgt i8 %18, -1
  br i1 %19, label %17, label %20, !llvm.loop !11

20:                                               ; preds = %17
  %21 = tail call zeroext i8 @read_controller_1() #3
  %22 = zext i8 %21 to i16
  %23 = and i16 %22, 1
  %24 = icmp eq i16 %23, 0
  br i1 %24, label %31, label %25

25:                                               ; preds = %20
  %26 = and i8 %16, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 43, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  %30 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  br label %31

31:                                               ; preds = %28, %25, %20
  %32 = and i16 %22, 2
  %33 = icmp eq i16 %32, 0
  br i1 %33, label %40, label %34

34:                                               ; preds = %31
  %35 = and i8 %16, 2
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %34
  %38 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 63, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8198 to ptr), align 2, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 42, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 15, ptr inttoptr (i16 8199 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8192 to ptr), align 8192, !tbaa !10
  %39 = load volatile i8, ptr inttoptr (i16 8194 to ptr), align 2, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  store volatile i8 0, ptr inttoptr (i16 8197 to ptr), align 1, !tbaa !10
  br label %40

40:                                               ; preds = %37, %34, %31
  br label %15
}

declare dso_local zeroext i8 @read_controller_1() local_unnamed_addr #2

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!llvm.errno.tbaa = !{!4}

!0 = !{i32 7, !"frame-pointer", i32 2}
!1 = !{i32 1, !"ThinLTO", i32 0}
!2 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!3 = !{!"clang version 24.0.0git (https://github.com/llvm-mos/llvm-mos a40207a371b60ff787ece46817d9c0f62eada719)"}
!4 = !{!5, !6, i64 0}
!5 = !{!"__libc_errno", !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{i64 4001492701215873357}
!10 = !{!7, !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{i64 6329947078378131458}
!14 = !{i64 8129674464747819825}
!15 = !{i64 -8544342151232735994}
!16 = distinct !{!16, !12}
!17 = !{i64 1150243459224282130}
!18 = !{i64 -1914443377477637936}
!19 = !{i64 5028057656688387339}
!20 = !{i64 4354321371319790930}
!21 = !{i64 -2624081020897602054}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "ppu_set_palette", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 12, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 1150243459224282130
^2 = gv: (name: "ppu_wait_vblank", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 5, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 4001492701215873357
^3 = gv: (name: "Reset", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 37, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 4354321371319790930
^4 = gv: (name: "ppu_reset_scroll", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 7, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 5028057656688387339
^5 = gv: (name: "ppu_set_address", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 7, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 6329947078378131458
^6 = gv: (name: "ppu_set_nametable", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 3, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 8129674464747819825
^7 = gv: (name: "ppu_clear_nametable", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 10, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 9902401922476815622
^8 = gv: (name: "read_controller_1") ; guid = 10562001439917643255
^9 = gv: (name: "main", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 81, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^8, tail: 1))))) ; guid = 15822663052811949562
^10 = gv: (name: "ppu_draw_test_tile", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 5, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 16532300696231913680
^11 = flags: 8
^12 = blockcount: 0
