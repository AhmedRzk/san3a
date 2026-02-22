import 'package:flutter/material.dart';

/// Utility functions for Flutter Flow
class FFAppState {
  static FFAppState instance = FFAppState._();
  FFAppState._();
}

extension StateExtension<T extends StatefulWidget> on State<T> {
  void safeSetState(VoidCallback callback) {
    if (mounted) {
      callback();
    }
  }
}

/// Lightweight page transition types used by FlutterFlow-generated code.
enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotation,
}

/// Transition info container passed via `extra['__transition_info__']`.
class TransitionInfo {
  final bool hasTransition;
  final PageTransitionType transitionType;

  const TransitionInfo({this.hasTransition = false, this.transitionType = PageTransitionType.fade});
}

/// Navigation helpers to mimic FlutterFlow's `context.pushNamed(...)` API.
extension NavigationExtensions on BuildContext {
  Future<T?> pushNamed<T extends Object?>(String name, {Map<String, dynamic>? extra}) {
    // The FlutterFlow transition info is provided in `extra['__transition_info__']`.
    // For simplicity we ignore transition animations here and use standard named routing.
    return Navigator.pushNamed<T>(this, name);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(String name, {Map<String, dynamic>? extra}) {
    return Navigator.pushReplacementNamed<T, TO>(this, name);
  }
}
