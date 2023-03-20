import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/core/icons/app_icons.dart';


class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.arrowBack),
        SizedBox(width: 10.w),
        SvgPicture.asset(AppIcons.menuIcon),
        Text('BTC/USDT',
            style: AppTextStyles.body20w6.copyWith(
                color: AppColors.whiteColor,
                fontFamily: AppTextStyles.fontGothic)),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
              color: AppColors.lightGreenColor,
              borderRadius: BorderRadius.circular(8.r)),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          child: Text('+2.38%',
              style: AppTextStyles.body14w5.copyWith(
                  color: AppColors.textGreenColor,
                  fontFamily: AppTextStyles.fontGothic)),
        ),
        const Spacer(),
        SvgPicture.asset(AppIcons.resizeIcon),
        SizedBox(width: 16.w),
        SvgPicture.asset(AppIcons.star),
      ],
    );
  }
}