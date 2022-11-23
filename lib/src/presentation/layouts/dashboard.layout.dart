import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class DashboardManager extends GetView<DashboardLayoutController> {
  const DashboardManager({super.key});

  @override
  DashboardLayoutController get controller =>
      Get.put(DashboardLayoutController());

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.currentIndex,
              children: <Widget>[
                //TODO add all dashboard pages
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: primary,
              unselectedItemColor: grayScale500,
              unselectedLabelStyle: bodyXSmall.copyWith(
                color: grayScale500,
              ),
              selectedLabelStyle: bodyXSmall.copyWith(
                color: primary,
              ),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: controller.currentIndex,
              onTap: (i) => controller.currentIndex = i,
              items: ['ll', 'dd', 'dd', 'd'].map((String destination) {
                //TODO add all dashboard pages icons and title
                return const BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Home',
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardLayoutController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int i) => _currentIndex.value = i;
}

class DashboardNavBarContent {
  const DashboardNavBarContent(
    this.title,
    this.icon,
    this.activeIcon,
    this.color,
  );
  final String title;
  final String icon;
  final String activeIcon;
  final MaterialColor color;
}

const List<DashboardNavBarContent> allDestinations = <DashboardNavBarContent>[
  DashboardNavBarContent(
    'Home',
    'assets/images/bottom_nav_icons/home_inactive.png',
    'assets/images/bottom_nav_icons/home_active.png',
    Colors.teal,
  ),
  DashboardNavBarContent(
    'Transactions',
    'assets/images/bottom_nav_icons/transactions_inactive.png',
    'assets/images/bottom_nav_icons/transactions_active.png',
    Colors.teal,
  ),
  DashboardNavBarContent(
    'Help',
    'assets/images/bottom_nav_icons/help_inactive.png',
    'assets/images/bottom_nav_icons/help_active.png',
    Colors.teal,
  ),
  DashboardNavBarContent(
    'Profile',
    'assets/images/bottom_nav_icons/profile_inactive.png',
    'assets/images/bottom_nav_icons/profile_active.png',
    Colors.teal,
  ),
];
