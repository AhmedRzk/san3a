# FlutterFlow Changes (assistant-managed)

This is the single authoritative file where the assistant records edits, fixes, and best-practice notes applied to FlutterFlow-generated code in this repo.

## Format and purpose
- Keep entries short and dated.
- For each entry include: date, files changed, short reason, and a minimal summary of the fix.
- The assistant will append entries here for future automated or manual edits so you have a single history to review.

---

## 2026-02-22 — Animation & test stability improvements (assistant)
- Files changed:
  - `lib/flutter_flow/flutter_flow_animations.dart`
  - `lib/main.dart`
  - `lib/sign_in.dart`
  - `lib/sign_up.dart`
  - `test/test_helpers.dart`
  - `test/widget_test.dart`
- Reason: Tests were flaky due to `flutter_animate` starting timers/animations that remained pending, causing `NoSuchMethodError` and test failures.
- Summary of the fix:
  - Added a typed `AnimateWrapper` and `ffAnimate()` helper so generated code can call `.ffAnimate()` instead of `.animate()`.
  - Added global toggle `enableFlutterFlowAnimations` and public helpers `disableFlutterFlowAnimations()`/`restoreFlutterFlowAnimations()` used by tests.
  - Added `test/test_helpers.dart` and updated `test/widget_test.dart` to call `disableFlutterFlowAnimations()` in `setUpAll` and `restoreFlutterFlowAnimations()` in `tearDownAll`.
  - Replaced the earlier dynamic approach with a typed wrapper to avoid runtime `NoSuchMethodError`.

Notes / Best practices
- Prefer adding small wrapper helpers (like `ffAnimate`) instead of editing many generated expressions.
- Keep this file up to date for every functional change applied to generated code.
- Use `test/test_helpers.dart` to centrally disable test-only behavior (animations, network mocks, etc.) in `setUpAll`.

Maintained by the assistant automation.
