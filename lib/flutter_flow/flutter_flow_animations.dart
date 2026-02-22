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
    var animated = ffAnimate();

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
  AnimateWrapper ffAnimate() => AnimateWrapper(child: this);
}
// No-op class removed; AnimateWrapper handles both enabled/disabled paths.

/// Lightweight wrapper that provides the chainable API used by the
/// FlutterFlow-generated code but builds to a real `fa.Animate` when
/// animations are enabled.
class AnimateWrapper extends StatelessWidget {
  final Widget child;
  final List<fa.Effect> _effects = [];

  AnimateWrapper({super.key, required this.child});

  AnimateWrapper addEffect(fa.Effect e) {
    _effects.add(e);
    return this;
  }

  AnimateWrapper move({
    Curve? curve,
    Duration? delay,
    Duration? duration,
    Offset? begin,
    Offset? end,
  }) {
    _effects.add(
      fa.MoveEffect(
        begin: begin ?? Offset.zero,
        end: end ?? Offset.zero,
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.linear,
        delay: delay ?? Duration.zero,
      ),
    );
    return this;
  }

  AnimateWrapper fade({
    Curve? curve,
    Duration? delay,
    Duration? duration,
    double? begin,
    double? end,
  }) {
    _effects.add(
      fa.FadeEffect(
        begin: begin ?? 0.0,
        end: end ?? 1.0,
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.linear,
        delay: delay ?? Duration.zero,
      ),
    );
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (!_enableFlutterFlowAnimations || _effects.isEmpty) {
      return child;
    }

    var animateWidget = fa.AnimateWidgetExtensions(child).animate();
    for (final e in _effects) {
      animateWidget = animateWidget.addEffect(e);
    }
    return animateWidget as Widget;
  }
}
