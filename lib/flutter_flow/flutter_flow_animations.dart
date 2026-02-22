import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as fa;

export 'package:flutter_animate/flutter_animate.dart';

/// Animation triggers for FlutterFlow animations
enum AnimationTrigger { onPageLoad, onActionTrigger, onHover }

/// Animation configuration
class AnimationInfo {
  final AnimationTrigger trigger;
  final List<fa.Effect> Function() effectsBuilder;

  AnimationInfo({required this.trigger, required this.effectsBuilder});
}

/// Extension to add animation capabilities to widgets
extension AnimatedWidgetExtension on Widget {
  /// Apply page load animation to a widget
  Widget animateOnPageLoad(AnimationInfo animationInfo) {
    // Allow disabling animations globally (useful for tests).
    if (!_enableFlutterFlowAnimations) {
      return this;
    }

    if (animationInfo.trigger != AnimationTrigger.onPageLoad) {
      return this;
    }

    List<fa.Effect> effects = animationInfo.effectsBuilder();
    var animated = animate();

    for (final effect in effects) {
      animated = animated.addEffect(effect);
    }

    return animated;
  }
}

/// Global toggle to enable/disable FlutterFlow animations at runtime.
///
/// Set this to `false` in tests to avoid timers/animations that keep tests
/// from completing (for example: `enableFlutterFlowAnimations = false;`).
bool _enableFlutterFlowAnimations = true;

/// Public setter so test code can disable animations.
set enableFlutterFlowAnimations(bool v) => _enableFlutterFlowAnimations = v;

/// Public getter for the current animations enabled state.
bool get enableFlutterFlowAnimations => _enableFlutterFlowAnimations;

/// Provide a safe `animate()` extension that respects the global toggle.
extension SafeAnimateExtension on Widget {
  /// Safe wrapper around the animation API used by FlutterFlow-generated code.
  ///
  /// Use `ffAnimate()` in generated widgets instead of `.animate()` so tests can
  /// opt-out of animations without conflicting with the package extension.
  dynamic ffAnimate() {
    if (_enableFlutterFlowAnimations) {
      // Call the package extension method via the prefixed import to get the
      // real Animate object without bringing the extension into this file's
      // unprefixed scope.
      return fa.AnimateWidgetExtensions(this).animate();
    }

    return _NoopAnimate(child: this);
  }
}

class _NoopAnimate extends StatelessWidget {
  final Widget child;

  const _NoopAnimate({required this.child});

  // Keep chainable API used in generated code.
  _NoopAnimate addEffect(fa.Effect e) => this;

  _NoopAnimate move({
    Curve? curve,
    Duration? delay,
    Duration? duration,
    Offset? begin,
    Offset? end,
  }) => this;

  _NoopAnimate fade({
    Curve? curve,
    Duration? delay,
    Duration? duration,
    double? begin,
    double? end,
  }) => this;

  @override
  Widget build(BuildContext context) => child;
}
