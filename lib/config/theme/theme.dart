import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'text_styles.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    onSurface: AppColors.blackText,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
  ),
  fontFamily: 'Inter',
  appBarTheme: AppBarTheme(
    centerTitle: false,
    titleTextStyle: AppTextStyles.appBarTitle,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) =>
        const Icon(Icons.arrow_back_ios_new, size: 18),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    elevation: 0,
    // extendedTextStyle: AppTextStyles.titleBold,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primary,
      fixedSize: const Size(double.maxFinite, 48),
      textStyle: AppTextStyles.whiteBold16,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      // fixedSize: const Size(double.maxFinite, 48),
      textStyle: AppTextStyles.tagText.copyWith(
        color: AppColors.blackText,
        letterSpacing: .5,
      ),
      side: const BorderSide(color: AppColors.blackText),
      foregroundColor: AppColors.blackText,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    // Border styling
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: AppColors.red),
    ),
    // Text styling
    hintStyle: AppTextStyles.hint,
    // labelStyle: AppTextStyles.bodyMedium,
    errorStyle: AppTextStyles.labelMedium
        .copyWith(color: AppColors.red, letterSpacing: 0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    isDense: true,
    // suffixIconColor: AppColors.secondaryText,
    prefixIconColor: AppColors.blackText,
  ),
  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    enableFeedback: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.white,
    // selectedIconTheme:
    //     const IconThemeData(color: AppColors.darkBlue, size: 22),
    // selectedItemColor: AppColors.darkBlue,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    // unselectedIconTheme:
    //     IconThemeData(color: AppColors.darkBlue.withAlpha(50), size: 22),
    // unselectedItemColor: AppColors.darkBlue.withAlpha(50),
  ),
  //   dividerColor: AppColors.bgGreyDark,
  dropdownMenuTheme: const DropdownMenuThemeData(menuStyle: MenuStyle()),
  //  dividerTheme: const DividerThemeData(color: AppColors.bgGreyDark)
);
