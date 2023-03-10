import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_constants.dart';

final RouteObserver<PageRoute> routeObserver =  RouteObserver<PageRoute>();

class SuperScaffold extends StatefulWidget{
  final Widget body;
  final bool isStatusBarSafe;
  final bool isNavigationBarSafe;
  final Color statusBarColor;
  final Color systemNavigationBarColor;
  final Color backgroundColor;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButton? floatingActionButton;
  final Brightness statusBarBrightness;
  final Brightness statusIconBrightness;
  final VoidCallback? onWillPop;
  final bool isWillPop;
  const SuperScaffold({Key? key,required this.body,this.floatingActionButton, this.statusBarColor = Colors.white,this.systemNavigationBarColor = Colors.white,this.backgroundColor=Colors.white,this.appBar,this.drawer,this.isNavigationBarSafe=true,this.isStatusBarSafe=true,this.resizeToAvoidBottomInset=true, this.statusBarBrightness = Brightness.light,this.statusIconBrightness=Brightness.dark,this.onWillPop,this.isWillPop=true}) : super(key: key);

  @override
  State<SuperScaffold> createState() => _SuperScaffoldState();
}

class _SuperScaffoldState extends State<SuperScaffold> with RouteAware {

  @override
  void initState() {
    widget.statusBarColor.computeLuminance() > 0.5
        ? setBarBrightnessDark()
        : setBarBrightnessLight();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    widget.statusBarColor.computeLuminance() > 0.5
        ? setBarBrightnessDark()
        : setBarBrightnessLight();
    super.didPopNext();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    widget.statusBarColor.computeLuminance() > 0.5
        ? setBarBrightnessDark()
        : setBarBrightnessLight();
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: WillPopScope(
        onWillPop: ()async{
          if(widget.onWillPop != null){
            widget.onWillPop!();
          }
          return widget.isWillPop;
        },
        child: Scaffold(
          appBar: widget.appBar,
          drawer: widget.drawer,
          backgroundColor: widget.backgroundColor,
          floatingActionButton: widget.floatingActionButton,
          resizeToAvoidBottomInset:widget.resizeToAvoidBottomInset,
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: AppConstants.textScaleFactor),
            child: Column(
              children: [
                if(widget.isStatusBarSafe)
                  topPadding(widget.statusBarColor),
                Expanded(child: widget.body),
                if(widget.isNavigationBarSafe)
                  botPadding(widget.systemNavigationBarColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topPadding(Color color){
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(Get.context!).padding.top,
      color: color,
    );
  }

  Widget botPadding(Color color){
    return Container(
      width:double.maxFinite,
      height: MediaQuery.of(Get.context!).padding.bottom,
      color: color,
    );


  }

  void setBarBrightnessLight(){
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: widget.statusBarColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: widget.systemNavigationBarColor
        ));
  }

  void setBarBrightnessDark(){
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: widget.statusBarColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: widget.systemNavigationBarColor));
  }

}









