import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/Trainers.card.ui.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/workout.category.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';

import '../../../../../presentation/global_widgets/gap.ui.dart';
import '../../../../../presentation/resources/res.dart';
import '../../../gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'store.items.card.ui.dart';

class StoreTabBar extends StatefulWidget {
  const StoreTabBar({super.key});

  @override
  State<StoreTabBar> createState() => _StoreTabBarState();
}

class _StoreTabBarState extends State<StoreTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _TrainTabController;
  @override
  void initState() {
    _TrainTabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _TrainTabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: _TrainTabController,
                indicatorColor: primary,
                // labelColor: dark,
                isScrollable: true,
                indicatorWeight: 5,
                indicatorPadding: const EdgeInsets.only(left: 34, right: 34),
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle: bodyMed.copyWith(
                  fontWeight: semiBoldText,
                ),
                unselectedLabelStyle: bodyMed.copyWith(),
                tabs: [
                  Row(
                    children: const [
                      TextUi.heading4(
                        'Equipments',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      TextUi.heading4(
                        'Supplements',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      TextUi.heading4(
                        'Accessories',
                        fontSize: 16,
                      ),
                    ],
                  )
                ]),
          ),
        ),
        const Gap(40),
        Container(
          height: 500,
          child: TabBarView(
            controller: _TrainTabController,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: StoresCardEquipmentsUi(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: StoresCardSupplementsUi(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: StoresCardAccessoriesUi(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
