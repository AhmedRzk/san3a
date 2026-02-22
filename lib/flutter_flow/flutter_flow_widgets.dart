import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

/// Common FlutterFlow widgets
class FFButtonOptions {
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fillColor;
  final dynamic borderRadius; // can be double or BorderRadius
  final TabController? controller;

  // FlutterFlow compatible fields
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;

  FFButtonOptions({
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fillColor,
    this.borderRadius,
    this.controller,
    this.height,
    this.padding,
    this.iconPadding,
    this.color,
    this.textStyle,
    this.elevation,
  });
}

class FFButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FFButtonOptions? options;
  final Widget? icon;
  final bool isLoading;

  const FFButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.options,
    this.icon,
    this.isLoading = false,
  });

  BorderRadiusGeometry _toBorderRadius(dynamic r) {
    if (r == null) return BorderRadius.circular(4);
    if (r is double) return BorderRadius.circular(r);
    if (r is BorderRadiusGeometry) return r;
    return BorderRadius.circular(4);
  }

  @override
  Widget build(BuildContext context) {
    final bg = options?.color ?? options?.fillColor;
    final txtStyle = options?.textStyle ?? TextStyle(
      color: options?.textColor,
      fontSize: options?.fontSize,
      fontWeight: options?.fontWeight,
    );

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        elevation: options?.elevation,
        minimumSize: Size(0, options?.height ?? 40),
        padding: options?.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: _toBorderRadius(options?.borderRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            if (options?.iconPadding != null)
              Padding(padding: options!.iconPadding!, child: icon)
            else
              icon!,
            const SizedBox(width: 8),
          ],
          if (isLoading)
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Text(
              text,
              style: txtStyle,
            ),
        ],
      ),
    );
  }
}
