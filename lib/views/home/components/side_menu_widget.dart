import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/constants/app_constants.dart';
import 'package:my_portfolio/views/global/widgets/animatedProgressIndicator.dart';
import 'package:my_portfolio/views/global/widgets/titleAndValueWidget.dart';
import 'package:url_launcher/url_launcher.dart';

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
            profilePanel(),
            Expanded(
                child: Scrollbar(
                  child: ListView(
                    padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                    children: [
                      profileInfoPanel(),
                      Divider(color: Colors.grey.withOpacity(0.2),height: 50,),
                      skillPanel(),
                      Divider(color: Colors.grey.withOpacity(0.2),height: 50,),
                      languagePanel(),
                      Divider(color: Colors.grey.withOpacity(0.2),height: 50,),
                      interestPanel(),
                      Divider(color: Colors.grey.withOpacity(0.2),height: 50,),
                      socialAccountPanel()
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget profilePanel(){
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
                   image:const DecorationImage(image: AssetImage('assets/images/profile.jpeg'),fit: BoxFit.cover)
                 ),
                ),
                const SizedBox(height: 25,),
                Text('Arkar Min',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(fontWeight:FontWeight.w500),),
                const SizedBox(height: 15,),
                Text('Mid-Level Mobile Developer',style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(color: AppColors.bodyTextColor),)

              ],
            );
          }),
        ),
    );
  }
  
  Widget profileInfoPanel(){
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

  Widget skillPanel(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Skills',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
        const SizedBox(height: 15,),
        Row(
          children: const [
            Expanded(child: AnimatedCircularProgressIndicator(value: 0.85,title:'Flutter',)),
            SizedBox(width: 25,),
            Expanded(child: AnimatedCircularProgressIndicator(value: 0.65,title:'Kotlin',)),
            SizedBox(width: 25,),
            Expanded(child: AnimatedCircularProgressIndicator(value: 0.5,title:'Node.js',)),
          ],
        )
      ],
    );
  }

  Widget languagePanel(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Language',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
        const SizedBox(height: 15,),
        const AnimatedLinearProgressIndicator(value: 0.5, title: 'English'),
        const SizedBox(height: 15,),
        const AnimatedLinearProgressIndicator(value: 1.0, title: 'Mon')
      ],
    );
  }

  Widget interestPanel(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interests',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
        const SizedBox(height: 15,),
        Text('Learn to code',style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(color: Colors.white),),
        const SizedBox(height: 10,),
        Text('Reading',style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(color: Colors.white),),
        const SizedBox(height: 10,),
        Text('E-sport',style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(color: Colors.white),),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget socialAccountPanel(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Social',style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
        const SizedBox(height: 15,),
        Container(
          width: double.maxFinite,
          padding:const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color:const Color(0xFF242430),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                GestureDetector(
                    onTap: ()async{
                      if (!await launchUrl(Uri.parse(AppConstants.urlGithub))) {
                      throw Exception('Could not launch ');
                      }
                    },
                    child: SvgPicture.asset('assets/icons/github.svg')),
                const SizedBox(width: 25,),
                GestureDetector(
                    onTap: ()async{
                      if (!await launchUrl(Uri.parse(AppConstants.urlLinkedIn))) {
                      throw Exception('Could not launch ');
                      }
                    },
                    child: SvgPicture.asset('assets/icons/linkedin.svg')),
            ],
          ),
        ),
      ],
    );
  }

}
