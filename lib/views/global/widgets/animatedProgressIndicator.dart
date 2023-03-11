import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  final double value;
  final String title;
  const AnimatedCircularProgressIndicator({Key? key,required this.value,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: value),
              duration:const Duration(milliseconds: 500),
              builder: (context,value,widget) {
                return Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value:value,
                      backgroundColor:AppColors.darkColor,
                      color: AppColors.primaryColor,
                    ),
                    Center(child: Text('${(value*100).toInt()}%',style: Theme.of(context).textTheme.bodyMedium,))
                  ],
                );
              },
            ),
        ),
        const SizedBox(height: 10,),
        Text(title,style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final String title;
  const AnimatedLinearProgressIndicator({Key? key,required this.value,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0,end: value),
          duration:const Duration(milliseconds: 500),
          builder: (context,value,widget) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                    Text('${(value*100).toInt()}%',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.bodyTextColor),)
                  ],
                ),
                const SizedBox(height: 10,),
                LinearProgressIndicator(
                  value:value,
                  backgroundColor:AppColors.darkColor,
                  color: AppColors.primaryColor,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
