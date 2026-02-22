import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

export 'package:flutter_animate/flutter_animate.dart' show MoveEffect, FadeEffect, ScaleEffect, RotateEffect;

/// Animation triggers for FlutterFlow animations
enum AnimationTrigger {
  onPageLoad,
  onActionTrigger,
  onHover,
}

/// Animation configuration
class AnimationInfo {
  final AnimationTrigger trigger;
  final List<Effect> Function() effectsBuilder;

  AnimationInfo({
    required this.trigger,
    required this.effectsBuilder,
  });
}

/// Extension to add animation capabilities to widgets
extension AnimatedWidgetExtension on Widget {
  /// Apply page load animation to a widget
  Widget animateOnPageLoad(AnimationInfo animationInfo) {
    if (animationInfo.trigger != AnimationTrigger.onPageLoad) {
      return this;
    }

    List<Effect> effects = animationInfo.effectsBuilder();
    var animated = animate();

    for (final effect in effects) {
      animated = animated.addEffect(effect);
    }

    return animated;
  }
}
