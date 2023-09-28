import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../routing/app_pages.dart';
import '../../gym_locations/controller/gym_locations_controller.dart';

class GymUi extends GetView<GymLocationsController> {
  const GymUi({
    super.key,
  });

  @override
  GymLocationsController get controller => Get.put(GymLocationsController());

  @override
  Widget build(BuildContext context) {
    // Clear the list before displaying data for a new location

    print(controller.thisGymList.length);

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const MainAppbarUi(
          title: 'Gyms',
        ),
        body: CustomScrollView(
          slivers: [
            // SliverAppBar with search bar
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: false, // Set to true if you want it to appear on scroll
              pinned: true, // Set to true if you want it to remain at the top
              expandedHeight: 100, // Adjust as needed
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: SizedBox(
                  height: 40.h,
                  width: 230.w,
                  child: TextField(
                    // Your search bar widget here
                    decoration: InputDecoration(
                      hintText: 'Search Gyms',
                    ),
                  ),
                ),
              ),
            ),

            // SliverList for the gym list
            Obx(
              () => controller.isGymListLoading.value
                  ? SliverToBoxAdapter(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: primary,
                      )),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final gym = controller.thisGymList[index];

                          return Padding(
                            padding: baseViewPadding,
                            child: GymCardUi(
                              ontap: () async {
                                final box = await Hive.openBox('userData');
                                final token = box.get('token');

                                if (token == null || token == 'null') {
                                  // User is not logged in or token is null, navigate to login screen
                                  Get.toNamed<void>(Routes.login);
                                } else {
                                  // Check if the token is expired
                                  final tokenExpired = controller
                                      .isTokenExpired(token.toString());

                                  if (tokenExpired) {
                                    print('trying to decode token');
                                    // Token is expired, prompt the user to log in
                                    Get.toNamed<void>(Routes.login);
                                  } else {
                                    // Token is not expired, navigate to the dashboard
                                    final gymId = gym.id;
                                    await controller.fetchGymDetails(gymId);
                                    Get.toNamed<void>(Routes.gymDetails);
                                  }
                                }
                              },
                              city: gym.city,
                              address: gym.address,
                              logo: gym.logo,
                              name: gym.name,
                            ),
                          );
                        },
                        childCount: controller.thisGymList.length,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//  SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: Column(
//                       children: [
//                         ...gServices.asMap().entries.map(
//                           (entry) {
//                             final service = entry.value;
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
