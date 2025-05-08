import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get headline1 => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorPrimary,
      );

  static TextStyle get headline2 => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorPrimary,
      );

  static TextStyle get title => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600, // Semi-bold
        color: AppColors.textColorPrimary,
      );
  
  static TextStyle get mentorName => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorPrimary,
      );

  static TextStyle get bodyText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorSecondary,
      );
  
  static TextStyle get bodyTextSmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorSecondary,
      );

  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorSecondary,
      );

  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium
        color: Colors.white,
      );
  
  static TextStyle get tagText => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.accentColor, 
      );

  static TextStyle get compatibilityText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.compatibilityGood, 
      );
  
  static TextStyle get bottomNavLabel => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      );
}
