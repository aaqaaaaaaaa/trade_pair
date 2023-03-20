import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/pages/trade/presentation/pages/trade_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController = TabController(length: 2, vsync: this);
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SegmentedTabControl(
                  controller: tabController,
                  radius: Radius.circular(6.r),
                  backgroundColor: AppColors.backgroundColor,
                  tabTextColor: AppColors.textColor,
                  selectedTabTextColor: AppColors.whiteColor,
                  squeezeIntensity: 2,
                  height: 30.h,
                  textStyle: AppTextStyles.body14w7,
                  tabs: [
                    SegmentTab(
                        label: 'Charts', color: AppColors.selectedGreyColor),
                    SegmentTab(
                        label: 'Trade', color: AppColors.selectedGreyColor),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppColors.selectedGreyColor,
                      ),
                      const TradePage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
