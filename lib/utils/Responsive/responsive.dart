import 'package:get/get.dart';

class Responsive{

  static bool isMobile() =>
     Get.width <= 500;

  static bool isMobileLarge() =>
      Get.width <= 700;

  static bool isTablet() =>
      Get.width < 1024;

  static bool isDesktop() =>
      Get.width >= 1024;

}