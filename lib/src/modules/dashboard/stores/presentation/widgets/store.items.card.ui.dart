// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/stores/controller/stores.Controller.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../data/dummy/member_services.dummy.dart';
import '../../../../../utils/config.dart';

class StoresCardEquipmentsUi extends GetView<StoresController> {
  const StoresCardEquipmentsUi({super.key});

  @override
  StoresController get controller => Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
              mainAxisExtent: 250),
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  ClipRect(
                    child: Image.asset(
                        "${storeEquipmentMap.elementAt(index)['image']}"),
                  ),
                  Row(
                    children: [
                      TextUi.heading4(
                        "${storeEquipmentMap.elementAt(index)['name']}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextUi.bodyMed(
                          "${storeEquipmentMap.elementAt(index)['role']}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUi.bodyMed(
                          "${storeEquipmentMap.elementAt(index)['price']}"),
                      SizedBox(
                        height: 34,
                        width: 34,
                        child: FloatingActionButton(
                          heroTag: 'btn1',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {},
                          backgroundColor: primary,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: storeEquipmentMap.length,
        ));
  }
}

class StoresCardSupplementsUi extends GetView<StoresController> {
  const StoresCardSupplementsUi({super.key});

  @override
  StoresController get controller => Get.put(StoresController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
              mainAxisExtent: 250),
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      
                      
                    },
                    child: ClipRect(
                      child: Image.asset(
                          "${storeSupplementsMap.elementAt(index)['image']}"),
                    ),
                  ),
                  Row(
                    children: [
                      TextUi.heading4(
                        "${storeSupplementsMap.elementAt(index)['name']}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextUi.bodyMed(
                          "${storeSupplementsMap.elementAt(index)['role']}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUi.bodyMed(
                          "${storeSupplementsMap.elementAt(index)['price']}"),
                      SizedBox(
                        height: 34,
                        width: 34,
                        child: FloatingActionButton(
                          heroTag: 'btn1',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {},
                          backgroundColor: primary,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: storeSupplementsMap.length,
        ));
  }
}

class StoresCardAccessoriesUi extends GetView<StoresController> {
  const StoresCardAccessoriesUi({super.key});

  @override
  StoresController get controller => Get.put(StoresController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
              mainAxisExtent: 250),
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  ClipRect(
                    child: Image.asset(
                        "${storeAccessoriesMap.elementAt(index)['image']}"),
                  ),
                  Row(
                    children: [
                      TextUi.heading4(
                        "${storeAccessoriesMap.elementAt(index)['name']}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextUi.bodyMed(
                          "${storeAccessoriesMap.elementAt(index)['role']}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUi.bodyMed(
                          "${storeAccessoriesMap.elementAt(index)['price']}"),
                      SizedBox(
                        height: 34,
                        width: 34,
                        child: FloatingActionButton(
                          heroTag: 'btn1',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {},
                          backgroundColor: primary,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: storeAccessoriesMap.length,
        ));
  }
}
