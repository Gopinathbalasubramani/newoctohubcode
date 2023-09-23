import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../Res/Utils/color.dart';
import '../Dashboard/activepage.dart';
import '../Dashboard/AllPage/allPage.dart';
import '../Dashboard/completedPage.dart';
import 'bootmNavebar.dart';
class BottomTabsCustomWidget extends StatefulWidget {
  final BuildContext menuScreenContext;
  final int? selectedIndex;
  final bool? notificationNavigation;
  final String? latetude;
  final String? longitude;

  const BottomTabsCustomWidget(
      {Key? key,
        required this.selectedIndex,
        required this.menuScreenContext,
        this.notificationNavigation,
        this.latetude,
        this.longitude})
      : super(key: key);

  @override
  _BottomTabsCustomWidgetState createState() => _BottomTabsCustomWidgetState();
}

class _BottomTabsCustomWidgetState extends State<BottomTabsCustomWidget> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  final bool _isTransactionsAvailable = true;


  String medicalOutlineImg = 'assets/BottomNavImages/MedicalOutline.svg';

  String medicalFillImg = 'assets/BottomNavImages/MedicalFill.svg';

  String myProfileFillImg = 'assets/BottomNavImages/ProfileFill.svg';

  String myProfileOutlineImg = 'assets/BottomNavImages/ProfileOutline.svg';

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
    _controller.index = widget.selectedIndex ?? 0;

  }

  List<Widget> _buildScreens() {
    return [
      AllPage(),
      ActivatePage(),
      CompletedPage()
    ];
  }



  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.only(top: 10, bottom: 0, left: 16),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(29),
          //   color: _controller.index == 0 ?greenAccent : Colors.white,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_note,size: 20,color: _controller.index == 0 ? primary : Colors.grey),

              Text("All",
                  style: TextStyle(
                      //fontFamily: fontfamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: _controller.index == 0
                          ? primary
                          : Colors.grey))
            ],
          ),
        ),
        title: "",
        activeColorPrimary: primarySoft,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(29),
          //   color: _controller.index == 1 ? greenAccent : Colors.white,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_note,size: 20,color: _controller.index == 1 ? primary : Colors.grey),
              const SizedBox(width: 10),
              Text("Activate",
                  style: TextStyle(
                    color: _controller.index == 1 ? primary : Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                  ))
            ],
          ),
        ),
        title: "",
        activeColorPrimary: primaryAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(29),
          //   color: _controller.index == 2 ? greenAccent : Colors.white,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_note,size: 20,color: _controller.index == 2 ? primary : Colors.grey),
              const SizedBox(width: 10),
              Text("Completed",
                  style: TextStyle(
                    color: _controller.index == 2 ? primary : Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ))
            ],
          ),
        ),
        title: "",
        activeColorPrimary: primaryAccent,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {


        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PersistentTabView.custom(
            context,
            controller: _controller,
            screens: _buildScreens(),
            confineInSafeArea: true,
            itemCount: 3,
            handleAndroidBackButtonPress: true,
            stateManagement: true,
            hideNavigationBar: _hideNavBar,
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            backgroundColor: Colors.white,
            customWidget: BottomNavBar(
              items: _navBarsItems(),
              onItemSelected: (index) {
                setState(() {

                  _controller.index = index;
                  print(
                      'Bottom index :::::::::::::::::::: ${_controller.index}');
                });
              },
              selectedIndex: _controller.index,
            ),
          ),
        ),
      ),
    );
  }
}
