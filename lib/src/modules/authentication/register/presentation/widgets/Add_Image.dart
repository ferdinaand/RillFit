import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riilfit/src/presentation/global_widgets/gap.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:riilfit/src/presentation/global_widgets/button.ui.dart';
import '../../../../../presentation/global_widgets/text.ui.dart';
import '../../controller/Gym_Owner_Register_controller.dart';

class AddImage extends GetView<GymOwnerRegisterController> {
  const AddImage({super.key});

  @override
  GymOwnerRegisterController get controller =>
      Get.put(GymOwnerRegisterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextUi.bodySmall(
          'Add your logo below',
          fontWeight: FontWeight.w600,
        ),
        Gap(20),
        Container(
          height: 278.h,
          width: 330.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: primary,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(
                        Icons.image,
                        size: 100,
                      ),
                    ),
                    Positioned(
                        bottom: -10,
                        right: -39,
                        child: RawMaterialButton(
                          onPressed: controller.selectImage,
                          elevation: 2.0,
                          fillColor: Colors.transparent,
                          child: Icon(Icons.edit),
                          padding: EdgeInsets.all(2.0),
                          shape: CircleBorder(),
                        )),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 289,
              //   height: 47,
              //   child: PrimaryButtonUi(
              //     text: 'Upload',
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
