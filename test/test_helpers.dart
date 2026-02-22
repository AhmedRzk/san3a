import 'package:flutter_test/flutter_test.dart';
import 'package:san3a/flutter_flow/flutter_flow_animations.dart';

/// Test helpers for controlling FlutterFlow-generated animations.
///
/// Use `disableFlutterFlowAnimations()` in `setUpAll` for tests that should
/// run without animations; call `restoreFlutterFlowAnimations()` in
/// `tearDownAll` if you want to restore the default behavior.
void disableFlutterFlowAnimations() => enableFlutterFlowAnimations = false;

void restoreFlutterFlowAnimations() => enableFlutterFlowAnimations = true;

/// Convenience helper that disables animations for the duration of `fn`.
Future<T> withAnimationsDisabled<T>(Future<T> Function() fn) async {
  final prev = enableFlutterFlowAnimations;
  disableFlutterFlowAnimations();
  try {
    return await fn();
  } finally {
    if (prev) restoreFlutterFlowAnimations();
  }
}
