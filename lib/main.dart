import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_pair/core/app_colors/colors.dart';
import 'package:trade_pair/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primaryColor),
          onGenerateRoute: (settings) => Routes.generateRoute(settings),
          // home: const HomePage(),
        );
      },
    );
  }
}