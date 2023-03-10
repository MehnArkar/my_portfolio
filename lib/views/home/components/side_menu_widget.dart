import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/views/global/widgets/titleAndValueWidget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgColor,
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            profileWidget(),
            Expanded(
                child: Scrollbar(
                  child: ListView(
                    padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                    children: [
                      profileInfo(),
                      Divider(color: Colors.grey.withOpacity(0.2),height: 20,),
                      skillWidget()

                      
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget profileWidget(){
    return AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: Alignment.center,
          color:const Color(0xFF242430),
          child: LayoutBuilder(builder: (context,constraints){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: constraints.maxWidth/3,
                  height: constraints.maxWidth/3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular((constraints.maxWidth/3)/2),
                   image:const DecorationImage(image: AssetImage('assets/images/profile.png'),fit: BoxFit.cover)
                 ),
                ),
                const SizedBox(height: 25,),
                Text('Arkar Min',style: Theme.of(Get.context!).textTheme.bodyMedium,),
                const SizedBox(height: 15,),
                Text('Mid-Level Mobile Developer',style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(color: AppColors.bodyTextColor),)

              ],
            );
          }),
        ),
    );
  }
  
  Widget profileInfo(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        TitleAndValueWidget(title: 'Country', value: 'Myanmar'),
        SizedBox(height: 10,),
        TitleAndValueWidget(title: 'City', value: 'Yangon'),
        SizedBox(height: 10,),
        TitleAndValueWidget(title: 'Age', value: '23'),
      ],
    );
  }

  Widget skillWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Skills',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: Colors.white),)
      ],
    );
  }
}
