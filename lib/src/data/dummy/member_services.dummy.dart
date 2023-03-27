import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/routing/app_pages.dart';

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
  const MemberServices(
    name: 'GYM',
    image: gym,
    image2: getFit1,
    route: Routes.gym,
    color: Color(0xff016989),
  ),
  const MemberServices(
    name: 'WORKOUT',
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
    name: 'GYM',
    image: gym,
    image2: getFit1,
    route: Routes.gym,
    color: Color(0xff016989),
  ),
  const GServices(
    name: 'WORKOUT',
    image: workout,
    image2: getFit2,
    route: Routes.train,
    color: Color(0xff8DAB4D),
  ),
  const GServices(
    name: 'SHOP',
    image: store,
    image2: getFit3,
    route: Routes.stores,
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
