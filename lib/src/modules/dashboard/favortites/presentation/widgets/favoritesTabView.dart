import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';

import '../../../../../presentation/global_widgets/gap.ui.dart';
import '../../../../../presentation/resources/res.dart';
import '../../../gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'favorites.cardui.dart';

class FavoriteTabBar extends StatefulWidget {
  const FavoriteTabBar({super.key});

  @override
  State<FavoriteTabBar> createState() => _FavoriteTabBarState();
}

class _FavoriteTabBarState extends State<FavoriteTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _controller,
                  indicatorColor: primary,
                  indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                  indicatorWeight: 5,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextUi.heading4(
                          'Gym',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextUi.heading4('Products'),
                      ],
                    ),
                  ]),
            ),
          ),
          Gap(23),
          Container(
            height: 550.h,
            child: TabBarView(
              controller: _controller,
              children: [
                SingleChildScrollView(
                  child: Expanded(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: baseViewPadding,
                      separatorBuilder: (_, __) => const Gap(16),
                      itemCount: 3,
                      itemBuilder: (_, i) {
                        const isFavorite = true;
                        final isClosed = i.isOdd;
                        return FavoriteCardUi(
                          isFavorite: isFavorite,
                          isClosed: isClosed,
                        );
                      },
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
