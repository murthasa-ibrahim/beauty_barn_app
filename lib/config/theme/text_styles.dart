import 'package:flutter/material.dart';
import 'package:machine_test_superlabs/config/constants/app_colors.dart';

class AppTextStyles {
  static const _baseStyle = TextStyle(
    fontFamily: 'Inter',
  );

  // --- AppBar title style ----- // 
  static TextStyle get appBarTitle => _baseStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  // White bold text
  static TextStyle get whiteBold16 => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  // White bold text18
  static TextStyle get whiteBold18 => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );


  // body 16
  static TextStyle get body16 => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blackText,
      );
  // body 16 alt
  static TextStyle get body16Alt => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blackText,
      );

  // Small regular body
  static TextStyle get bodySmall => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );
      static TextStyle get bodysmall => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  // Extra small label or caption
  static TextStyle get caption => _baseStyle.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w400,
      );

  // Large section heading
  static TextStyle get heading20 => _baseStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );

  // Regular body
  static TextStyle get body15 => _baseStyle.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  // Display large
  static TextStyle get displayLarge => _baseStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );

  // Regular secondary text
  static TextStyle get body14 => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
    static TextStyle get body12 => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );  

  // Bold small label
  static TextStyle get labelBold => _baseStyle.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w700,
      );
      static TextStyle get labelBoldbig => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
  // Bold small label
  static TextStyle get labelRegular => _baseStyle.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      );

  // Another body variant
  static TextStyle get body15Alt => _baseStyle.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  // Spaced tag text
  static TextStyle get tagText => _baseStyle.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 3,
      );

  // Medium label
  static TextStyle get labelMedium => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
      static TextStyle get labelMed => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  // Medium label
  static TextStyle get hint => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText
        // letterSpacing: 3,
      );

      // title style
  static TextStyle get mTitle => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
}
