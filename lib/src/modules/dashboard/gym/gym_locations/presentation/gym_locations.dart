import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_locations/presentation/widgets/gym_location_card.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

import '../../../../../presentation/resources/images.res.dart';
import '../../../../../presentation/widgets.dart';
import '../controller/gym_locations_controller.dart';

class SelectLocation extends GetView<GymLocationsController> {
  const SelectLocation({super.key});

  @override
  GymLocationsController get controller => Get.put(GymLocationsController());

  @override
  Widget build(BuildContext context) {
    controller.onInit;

    return
        //  controller.isLoading.value
        //     ? Center(child: CircularProgressIndicator())
        //     :

        Scaffold(
      appBar: MainAppbarUi(
        title: 'Gym Locations',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // ListView.builder(itemBuilder: ())

                LocationCard(location: 'Lekki'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget buildUsers(List<User> users) => ListView.builder(itemBuilder: (context, index){

//  final user = users[index];

// }, itemCount: users.length,);
