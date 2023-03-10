import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';


class TitleAndValueWidget extends StatelessWidget {
  final String title;
  final String value;
  const TitleAndValueWidget({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(color: Colors.white),),
        const Spacer(),
        Text(value,style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(color: AppColors.bodyTextColor,fontSize: 12),)
      ],
    );
  }
}
