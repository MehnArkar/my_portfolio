import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/Responsive/responsive.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';
import 'package:my_portfolio/views/global/super_scaffold.dart';
import 'package:my_portfolio/views/home/components/side_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('width ${Get.width}');
    return SuperScaffold(
      backgroundColor: AppColors.bgColor,
        appBar: Responsive.isDesktop(context)
            ? null
            : AppBar(
          backgroundColor: AppColors.bgColor,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        ),
        drawer: const SideMenuWidget(),
        body: Row(
          children: [
            if(Responsive.isDesktop(context))
             const Flexible(
                flex:2,
                child:SideMenuWidget()),
            Flexible(
                flex: 7,
                child: Container())

          ],
        )
    );
  }
}
