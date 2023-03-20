import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';

class PriceChapterWidget extends StatelessWidget {
  const PriceChapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
