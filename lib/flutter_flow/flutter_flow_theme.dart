import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return FlutterFlowTheme();
  }

  // Primary colors
  Color get primary => const Color(0xFF6750A4);
  Color get secondary => const Color(0xFF625B71);
  Color get tertiary => const Color(0xFF7D5260);
  
  // Background colors
  Color get primaryBackground => const Color(0xFFFFFBFE);
  Color get secondaryBackground => const Color(0xFFF7F2FA);
  Color get tertiaryBackground => const Color(0xFFFFF8F7);
  
  // Text colors
  Color get primaryText => const Color(0xFF1C1B1F);
  Color get secondaryText => const Color(0xFF49454E);
  Color get tertiaryText => const Color(0xFF79747E);
  Color get textColor => const Color(0xFF1C1B1F);
  
  // Alternative colors
  Color get alternate => const Color(0xFFE7E0EC);
  Color get error => const Color(0xFFB3261E);
  Color get success => const Color(0xFF1B5E20);
  Color get warning => const Color(0xFFF57C00);
  Color get info => const Color(0xFF0288D1);
  
  // Shadow
  Color get shadow => const Color(0xFF000000).withValues(alpha: 0.12);
  
  // Divider
  Color get divider => const Color(0xFFE0E0E0);
  Color get border => const Color(0xFFE0E0E0);
  
  // Other
  Color get white => const Color(0xFFFFFFFF);
  Color get outline => const Color(0xFF79747E);
}

extension TextStyleHelper on FlutterFlowTheme {
  TextStyle get displayLarge {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 57.0,
    );
  }

  TextStyle get displayMedium {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 45.0,
    );
  }

  TextStyle get displaySmall {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 36.0,
    );
  }

  TextStyle get headlineLarge {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 32.0,
    );
  }

  TextStyle get headlineMedium {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 28.0,
    );
  }

  TextStyle get headlineSmall {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
    );
  }

  TextStyle get titleLarge {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    );
  }

  TextStyle get titleMedium {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    );
  }

  TextStyle get titleSmall {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    );
  }

  TextStyle get bodyLarge {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    );
  }

  TextStyle get bodyMedium {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    );
  }

  TextStyle get bodySmall {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
    );
  }

  TextStyle get labelLarge {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    );
  }

  TextStyle get labelMedium {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
    );
  }

  TextStyle get labelSmall {
    return GoogleFonts.roboto(
      color: primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 11.0,
    );
  }
}

extension TextStyleOverride on TextStyle {
  TextStyle override({
    TextStyle? font,
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    final base = font ?? this;
    return base.copyWith(
      color: color ?? base.color,
      letterSpacing: letterSpacing ?? base.letterSpacing,
      fontWeight: fontWeight ?? base.fontWeight,
      fontStyle: fontStyle ?? base.fontStyle,
    );
  }
}
