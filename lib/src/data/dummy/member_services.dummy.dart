import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/utils/config.dart';

class MemberServices {
  const MemberServices({
    required this.name,
    required this.route,
    required this.image,
    required this.color,
    required this.image2,
  });

  final String image;
  final String route;
  final String name;
  final Color color;
  final String image2;
}

final memberServices = <MemberServices>[
  MemberServices(
    name: 'GYM',
    image: gym,
    image2: getFit1,
    route: isLoggedIn ? Routes.selectLocation : Routes.register,
    color: Color(0xff016989),
  ),
  const MemberServices(
    name: 'DREAMBODY',
    image: workout,
    image2: getFit2,
    route: Routes.train,
    color: Color(0xff8DAB4D),
  ),
  const MemberServices(
    name: 'SHOP',
    image: store,
    image2: getFit3,
    route: Routes.stores,
    color: Color(0xff904E55),
  ),
];

class GServices {
  const GServices({
    required this.name,
    required this.route,
    required this.image,
    required this.color,
    required this.image2,
  });

  final String image;
  final String route;
  final String name;
  final Color color;
  final String image2;
}

final gServices = <GServices>[
  const GServices(
    name: 'Rillfit',
    image: gym,
    image2: 'assets/png/Rectangle1.png',
    route: Routes.gymDetails,
    color: Color(0xff016989),
  ),
  const GServices(
    name: 'feddy gym',
    image: workout,
    image2: 'assets/png/Rectangle2.png',
    route: Routes.gymDetails,
    color: Color(0xff8DAB4D),
  ),
  const GServices(
    name: 'bennys place',
    image: store,
    image2: 'assets/png/Rectangle3.png',
    route: Routes.gymDetails,
    color: Color(0xff904E55),
  ),
];

class Trainers {
  const Trainers({
    required this.name,
    required this.route,
    required this.image,
  });

  final String image;
  final String route;
  final String name;
}

final trainers = <Trainers>[
  const Trainers(
    name: 'Adebayo Samuel',
    image: trainer1,
    route: Routes.trainersDetails,
  ),
  const Trainers(
    name: 'Matthew jackson',
    image: trainer2,
    route: Routes.trainersDetails,
  ),
  const Trainers(
    name: 'Ene Henry',
    image: trainer3,
    route: Routes.trainersDetails,
  ),
  const Trainers(
    name: 'Ferdinand Ekpo',
    image: trainer4,
    route: Routes.trainersDetails,
  ),
];

//trainers grid List
final List<Map<String, dynamic>> trainersMap = [
  {
    'name': 'Adebayo Samuel',
    'role': 'Strength trainer',
    'image': trainer1,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Matthew jackson',
    'role': 'core trainer',
    'image': trainer2,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Ene Henry',
    'role': 'endurance trainer',
    'image': trainer3,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Ferdinand Ekpo',
    'role': 'weight trainer',
    'image': trainer4,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Azeez Abdul-Qahhar',
    'role': 'weight trainer',
    'image': trainer3,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Damilare Adewusi',
    'role': 'weight trainer',
    'image': trainer2,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Damilola Obembe',
    'role': 'weight trainer',
    'image': trainer1,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Mark duke',
    'role': 'weight trainer',
    'image': trainer3,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'sunday okon',
    'role': 'weight trainer',
    'image': trainer1,
    'route': Routes.trainersDetails,
  },
  {
    'name': 'oluwaleye Tomi',
    'role': 'weight trainer',
    'image': trainer4,
    'route': Routes.trainersDetails,
  },
];
final List<Map<String, dynamic>> storeEquipmentMap = [
  // ignore: inference_failure_on_collection_literal

  {
    'name': 'Adjustable kettlebell',
    'role': '10 - 50 kg',
    'image': 'assets/png/store1.png',
    'price': '15000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Dumb-bell',
    'role': '10 - 50kg',
    'image': 'assets/png/store2.png',
    'price': '25000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Adjustable bench',
    'role': '45 to 180 degrees',
    'image': 'assets/png/store3.png',
    'price': '10000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Bar-bell',
    'role': '10-50kg',
    'price': '15000',
    'image': 'assets/png/store4.png',
    'route': Routes.trainersDetails,
  },
];

final List<Map<String, dynamic>> storeSupplementsMap = [
  // ignore: inference_failure_on_collection_literal

  {
    'name': 'Whey protein',
    'role': '500g',
    'image': 'assets/png/store10.png',
    'price': '40000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'HBBA Amino acids',
    'role': '500g',
    'image': 'assets/png/store11.png',
    'price': '15000',
    'route': Routes.trainersDetails,
  },
];

final List<Map<String, dynamic>> storeAccessoriesMap = [
  // ignore: inference_failure_on_collection_literal

  {
    'name': 'muscle scrub',
    'role': '12hr battery life',
    'image': 'assets/png/store5.png',
    'price': '20000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'clamp',
    'role': '20 degrees',
    'image': 'assets/png/store6.png',
    'price': '30000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'string set',
    'role': '20m each',
    'image': 'assets/png/store7.png',
    'price': '20000',
    'route': Routes.trainersDetails,
  },
  {
    'name': 'Skipping rope',
    'role': '50m',
    'image': 'assets/png/store8.png',
    'price': '15000',
    'route': Routes.trainersDetails,
  },
];
