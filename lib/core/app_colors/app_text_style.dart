import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_pair/core/app_colors/colors.dart';

class AppTextStyle {
  static const String fontFamily = "Montserrat";

  static TextStyle body26w6 = TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: AppColors.primaryColor);

  // static TextStyle body36w6 = TextStyle(
  //     fontSize: 36.sp,
  //     fontWeight: FontWeight.w600,
  //     fontFamily: fontFamily,
  //     color: AppColors.primaryColor);
  static TextStyle body20w6 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: AppColors.textColor);
// static TextStyle body48w6 = TextStyle(
//     fontSize: 48.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body40w6 = TextStyle(
//     fontSize: 40.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body30w6 = TextStyle(
//     fontSize: 30.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body30w4 = TextStyle(
//     fontSize: 30.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body36w7 = TextStyle(
//     fontSize: 36.sp,
//     fontWeight: FontWeight.w700,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body36w6 = TextStyle(
//     fontSize: 36.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
// static TextStyle body90w6 = TextStyle(
//     fontSize: 90.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: fontFamily,
//     color: AppTheme.text);
//
// static TextStyle body24w5 = TextStyle(
//   fontSize: 24.sp,
//   fontWeight: FontWeight.w500,
//   color: AppTheme.text,
//   fontFamily: fontFamily,
// );
// static TextStyle body18w6 = TextStyle(
//   fontSize: 18.sp,
//   fontWeight: FontWeight.w600,
//   color: AppTheme.text,
//   fontFamily: fFMon,
// );
// static TextStyle body24w6 = TextStyle(
//   fontSize: 24.sp,
//   fontWeight: FontWeight.w600,
//   color: AppTheme.text,
//   fontFamily: fontFamily,
// );
//
// static TextStyle body24w4 = TextStyle(
//   fontSize: 24.sp,
//   fontWeight: FontWeight.w400,
//   color: AppTheme.text,
//   fontFamily: fontFamily,
// );
// static TextStyle body30w7 = TextStyle(
//   fontSize: 30.sp,
//   fontWeight: FontWeight.w700,
//   color: AppTheme.text,
//   fontFamily: fontFamily,
// );
}

class AppDecoration {
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: AppColors.primaryColor)),
      side: BorderSide(width: 2.h, color: AppColors.primaryColor));

// static BoxDecoration decoration = BoxDecoration(
//   color: AppTheme.fillColor,
//   borderRadius: BorderRadius.circular(18.r),
//   border: Border.all(color: AppTheme.keyboardBorderColor, width: 4.w),
// );
//
}

class AppImages {
  // static String playIcon = "assets/icons/play_icon.svg";
  static String shoir = "assets/images/shoir.png";
  static String bg = "assets/images/bg.jpg";
}
