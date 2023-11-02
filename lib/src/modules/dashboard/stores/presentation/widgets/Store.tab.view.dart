// ignore_for_file: non_constant_identifier_names, always_use_package_imports, unused_import

import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/storee.item.shimmer.dart';
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
  late bool _isLoading;
  @override
  void initState() {
    _TrainTabController = TabController(length: 3, vsync: this);
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
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
        Align(
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
            ],
          ),
        ),
        const Gap(40),
        SizedBox(
            height: 500,
            child: Column(
              children: [
                if (_isLoading)
                  Expanded(
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) =>
                          const ItemShimerSkeleton(),
                      itemCount: 4,
                    ),
                  )
                else
                  Expanded(
                    child: TabBarView(
                      controller: _TrainTabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: StoresCardEquipmentsUi(),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: StoresCardSupplementsUi(),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: StoresCardAccessoriesUi(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}

class ItemShimerSkeleton extends StatelessWidget {
  const ItemShimerSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerSkeleton(
              height: 159,
              width: 152,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Gap(10),
                ShimmerSkeleton(
                  height: 14,
                  width: 140,
                ),
                Gap(10),
                ShimmerSkeleton(
                  height: 14,
                  width: 100,
                ),
                Gap(10),
                ShimmerSkeleton(
                  height: 14,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
