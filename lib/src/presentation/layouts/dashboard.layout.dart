import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/views.dart';

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
                const HomeUi(),
                Container(),
                Container(),
                const ProfileUi(),
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
                fontWeight: mediumText,
              ),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: controller.currentIndex,
              onTap: (i) => controller.currentIndex = i,
              items: allDestinations.asMap().entries.map((entry) {
                final destination = entry.value;
                final index = entry.key;
                final isActive = controller.currentIndex == index;
                return BottomNavigationBarItem(
                  icon: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 250),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeOut,
                    crossFadeState: isActive
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: renderIcon(destination.activeIcon, primary),
                    secondChild: renderIcon(destination.icon, grayScale500),
                  ),
                  label: destination.title,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderIcon(String icon, Color color) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: 24,
      width: 24,
    ).marginOnly(bottom: 6);
  }
}

class DashboardLayoutController extends BaseController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int i) => _currentIndex.value = i;
}

class DashboardNavBarContent {
  const DashboardNavBarContent({
    required this.title,
    required this.icon,
    this.activeIcon = '',
  });
  final String title;
  final String icon;
  final String activeIcon;
}

const List<DashboardNavBarContent> allDestinations = <DashboardNavBarContent>[
  DashboardNavBarContent(
    title: 'Home',
    icon: homeIcon,
    activeIcon: homeActiveIcon,
  ),
  DashboardNavBarContent(
    title: 'Payments',
    icon: walletIcon,
    activeIcon: walletIcon,
  ),
  DashboardNavBarContent(
    title: 'Activity',
    icon: targetIcon,
    activeIcon: targetActiveIcon,
  ),
  DashboardNavBarContent(
    title: 'Profile',
    icon: userIcon,
    activeIcon: userActiveIcon,
  ),
];
