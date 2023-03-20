import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trade_pair/core/app_colors/app_text_style.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/core/data/content.dart';
import 'package:trade_pair/core/icons/app_icons.dart';

class ChartChapter extends StatelessWidget {
  ChartChapter({super.key});

  final GroupButtonController groupController =
      GroupButtonController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  controller: groupController,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
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
        Container(
          height: 266.h,
          // color: AppColors.textColor,
          child: CustomChartWidget(),
        ),
      ],
    );
  }
}

class CustomChartWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomChartWidget({Key? key}) : super(key: key);

  @override
  State<CustomChartWidget> createState() => _CustomChartWidgetState();
}

class _CustomChartWidgetState extends State<CustomChartWidget> {
  late List<ChartSampleData> data;

  @override
  void initState() {
    data = getContent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      series: <CandleSeries>[
        CandleSeries<ChartSampleData, DateTime>(
            bearColor: AppColors.purpleColor,
            bullColor: AppColors.textGreenColor,
            dataSource: data,
            xValueMapper: (ChartSampleData sales, _) => sales.x,
            lowValueMapper: (ChartSampleData sales, _) => sales.low,
            highValueMapper: (ChartSampleData sales, _) => sales.high,
            openValueMapper: (ChartSampleData sales, _) => sales.open,
            closeValueMapper: (ChartSampleData sales, _) => sales.close)
      ],
      primaryXAxis: DateTimeAxis(
          axisLine: const AxisLine(width: 0),
          dateFormat: DateFormat.Hm(),
          majorTickLines: const MajorTickLines(width: 0),
          // minorTickLines: MinorTickLines(width: 0),
          labelAlignment: LabelAlignment.end,
          labelStyle: AppTextStyles.body12w5,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          minimum: 70,
          opposedPosition: true,
          majorGridLines:
              MajorGridLines(color: AppColors.textColor.withOpacity(0.08)),
          maximum: 130,
          interval: 10,
          borderColor: Colors.transparent,
          labelStyle: AppTextStyles.body12w5,
          labelAlignment: LabelAlignment.center),
    );
  }
}
