import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/Responsive/responsive.dart';
import 'package:my_portfolio/utils/constants/app_colors.dart';
import 'package:my_portfolio/views/global/super_scaffold.dart';
import 'package:my_portfolio/views/home/components/side_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      backgroundColor: AppColors.bgColor,
        body: Row(
          children: [
             Flexible(
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
