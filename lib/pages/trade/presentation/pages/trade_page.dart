import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/pages/trade/presentation/widgets/app_bar_widget.dart';
import 'package:trade_pair/pages/trade/presentation/widgets/chart_widget.dart';
import 'package:trade_pair/pages/trade/presentation/widgets/price_chapter.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  int time = 0;
  int types = 0;
  int orders = 0;
  GroupButtonController ordersController =
      GroupButtonController(selectedIndex: 0);
  GroupButtonController typesController =
      GroupButtonController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        children: [
          const CustomAppBarWidget(),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const PriceChapterWidget(),
                ChartChapter(),
                Padding(
                  padding: EdgeInsets.only(top: 18.h, bottom: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GroupButton(
                      isRadio: true,
                      controller: typesController,
                      onSelected: (title, index, isSelected) =>
                          print('$index button is selected'),
                      buttons: const [
                        'MA',
                        'BOLL',
                        'EMA',
                        'Volume',
                        'MACD',
                        'More'
                      ],
                      options:
                          GroupButtonOptions(spacing: 10.w, buttonHeight: 24.w),
                      buttonBuilder: (selected, value, context) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: selected
                                  ? AppColors.selectedGreyColor
                                  : Colors.transparent),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 7.w),
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
                      controller: ordersController,
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
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 10.w),
                          child: Text(
                            '$value',
                            style: AppTextStyles.body14w6.copyWith(
                                color: selected
                                    ? AppColors.whiteColor
                                    : AppColors.textColor,
                                fontFamily: AppTextStyles.fontGothic),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 17.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Quantity',
                                    style: AppTextStyles.body11w6.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: AppTextStyles.fontGothic)),
                                Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Text('Buy Price',
                                      style: AppTextStyles.body11w6.copyWith(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              AppTextStyles.fontGothic)),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            ...List.generate(
                              5,
                              (index) => quantityAndBuyInfo(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 17.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: Text('Sell Price',
                                      style: AppTextStyles.body11w6.copyWith(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              AppTextStyles.fontGothic)),
                                ),
                                Text('Quantity',
                                    style: AppTextStyles.body11w6.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: AppTextStyles.fontGothic)),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            ...List.generate(
                                12, (index) => quantityAndSell(index))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 83.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Buy',
                          style: AppTextStyles.body16w6.copyWith(
                            color: AppColors.whiteColor,
                            fontFamily: AppTextStyles.fontGothic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Flexible(
                  child: SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Text(
                        'Sell',
                        style: AppTextStyles.body16w6.copyWith(
                          color: AppColors.whiteColor,
                          fontFamily: AppTextStyles.fontGothic,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack quantityAndSell(int index) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          color: AppColors.lightPurpleColor,
          width: (index + 1) * 15,
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Text('43,805',
                  style: AppTextStyles.body12w6.copyWith(
                      color: AppColors.purpleColor,
                      fontFamily: AppTextStyles.fontGothic)),
            ),
            Text('0.1600343',
                style: AppTextStyles.body12w6.copyWith(
                    color: AppColors.whiteColor,
                    fontFamily: AppTextStyles.fontGothic)),
          ],
        ),
      ],
    );
  }

  Stack quantityAndBuyInfo(int index) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          color: AppColors.lightGreenColor,
          width: (index + 1) * 15,
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0.1600343',
                style: AppTextStyles.body12w6.copyWith(
                    color: AppColors.whiteColor,
                    fontFamily: AppTextStyles.fontGothic)),
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Text('43,805',
                  style: AppTextStyles.body12w6.copyWith(
                      color: AppColors.textGreenColor,
                      fontFamily: AppTextStyles.fontGothic)),
            ),
          ],
        ),
      ],
    );
  }
}
