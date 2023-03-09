import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';
import 'package:my_portfolio/utils/constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        fontFamilyFallback:const ['Book'],
        textTheme:const TextTheme(
          bodySmall: TextStyle(fontSize: AppConstants.sizeTextSmall,color: AppColors.bodyTextColor,fontFamily: 'Poppins',fontFamilyFallback: ['Book']),
          bodyMedium: TextStyle(fontSize: AppConstants.sizeTextMedium,color: Colors.white,fontFamily: 'Poppins',fontFamilyFallback: ['Book']),
          bodyLarge: TextStyle(fontSize: AppConstants.sizeTextLarge,color:Colors.white,fontFamily: 'Poppins',fontFamilyFallback: ['Book']),
        )
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

