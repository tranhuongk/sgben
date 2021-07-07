import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'package:flutter/material.dart';

/// Standardized textstyle
/// FontWeight + FontSize + Color + FontStyle + decoration
/// example:
/// ```
/// static const TextStyle normal10VermilionItalicUnderline = TextStyle(
///     fontWeight: FontWeight.normal,
///     fontSize: 10.nsp,
///     color: AppColors.vermilion,
///     fontStyle: FontStyle.italic,
///     decoration: TextDecoration.underline,
/// );
/// ```
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle bold16White = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontSize: 16,
  );

  static const TextStyle regular14White = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontSize: 14,
  );
  static const TextStyle normal14RiverBed = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.riverBed,
    fontSize: 14,
  );

  static const TextStyle semiBold14White = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontSize: 14,
  );
  static const TextStyle semiBold14SelectiveYellow = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.selectiveYellow,
    fontSize: 14,
  );

  static const TextStyle medium18White = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontSize: 18,
  );
  static const TextStyle medium14RiverBed = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.riverBed,
    fontSize: 14,
  );

  static final TextStyle normal8White = GoogleFonts.ibmPlexSans(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontSize: 8,
    ),
  );
}
