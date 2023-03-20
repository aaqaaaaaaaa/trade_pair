import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/core/icons/app_icons.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        children: [
          Row(
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('43,810.58',
                          style: AppTextStyles.body24wB.copyWith(
                              color: AppColors.textGreenColor,
                              fontFamily: AppTextStyles.fontGothic)),
                      SizedBox(height: 5.h),
                      Text('~ \$43,810.58',
                          style: AppTextStyles.body13w6.copyWith(
                              color: AppColors.textColor,
                              fontFamily: AppTextStyles.fontGothic))
                    ],
                  ),
                ),
                const Flexible(
                  child: Column(
                    children: [
                      In24HStatisticWidget(
                        state: 'Hight',
                        value: '45,504.32',
                      ),
                      In24HStatisticWidget(
                        state: 'Low',
                        value: '42,128.40',
                      ),
                      In24HStatisticWidget(
                        state: 'Volume',
                        value: '205.08M',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 5.h),
            child: Row(
              children: [
                Text('Time',
                    style: AppTextStyles.body13w6.copyWith(
                        color: AppColors.textColor,
                        fontFamily: AppTextStyles.fontGothic)),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: GroupButton(
                    isRadio: true,
                    onSelected: (title, index, isSelected) =>
                        print('$index button is selected'),
                    buttons: const ['5m', '15m', '4H', 'More'],
                    options: GroupButtonOptions(spacing: 12.w),
                    buttonBuilder: (selected, value, context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: selected
                              ? AppColors.selectedGreyColor
                              : Colors.transparent,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 7.w),
                        child: Text('$value',
                            style: AppTextStyles.body13w6.copyWith(
                                color: selected
                                    ? AppColors.whiteColor
                                    : AppColors.textColor,
                                fontFamily: AppTextStyles.fontGothic)),
                      );
                    },
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.settings)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 5.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GroupButton(
                isRadio: true,
                onSelected: (title, index, isSelected) =>
                    print('$index button is selected'),
                buttons: const ['MA', 'BOLL', 'EMA', 'Volume', 'MACD', 'More'],
                options: GroupButtonOptions(spacing: 10.w, buttonHeight: 24.w),
                buttonBuilder: (selected, value, context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: selected
                            ? AppColors.selectedGreyColor
                            : Colors.transparent),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                    child: Text('$value',
                        style: AppTextStyles.body13w6.copyWith(
                            color: AppColors.textColor,
                            fontFamily: AppTextStyles.fontGothic)),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GroupButton(
                isRadio: true,
                onSelected: (title, index, isSelected) =>
                    print('$index button is selected'),
                buttons: const ['Order Book', 'Traders', 'Info'],
                options: GroupButtonOptions(spacing: 12.w),
                buttonBuilder: (selected, value, context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: selected
                          ? AppColors.selectedGreyColor
                          : Colors.transparent,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                    child: Text('$value',
                        style: AppTextStyles.body14w6.copyWith(
                            color: selected
                                ? AppColors.whiteColor
                                : AppColors.textColor,
                            fontFamily: AppTextStyles.fontGothic)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class In24HStatisticWidget extends StatelessWidget {
  const In24HStatisticWidget({
    super.key,
    required this.state,
    required this.value,
  });

  final String state, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('24h $state',
            style: AppTextStyles.body13w6.copyWith(
                color: AppColors.textColor,
                fontFamily: AppTextStyles.fontGothic)),
        Text(value,
            style: AppTextStyles.body13w5.copyWith(
                color: AppColors.whiteColor,
                fontFamily: AppTextStyles.fontGothic))
      ],
    );
  }
}
