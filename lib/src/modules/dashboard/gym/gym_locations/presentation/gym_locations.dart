// ignore_for_file: prefer_final_locals, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/Models/GymLocations.dart';
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
    final List<GymLocations> locationList = controller.locationList;

    return Scaffold(
      appBar: MainAppbarUi(
        iconColor: primary,
        title: 'Gym Locations',
      ),
      body: Obx(
        () => controller.isLocationLoading.value
            ? Center(
                child: CircularProgressIndicator(
                color: primary,
              ))
            : ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (_, index) {
                  // print(locationList[index].state);
                  String? state = locationList[index].state;
                  String? city = locationList[index].city;
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: LocationCard(
                      ontap: () {
                        print(city);
                        controller
                          ..setSelectedCity(city)
                          ..fetchGymList()
                          ..gymsInLocation();
                      },
                      location: state!,
                      city: city!,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

// Widget buildUsers(List<User> users) => ListView.builder(itemBuilder: (context, index){

//  final user = users[index];

// }, itemCount: users.length,);
