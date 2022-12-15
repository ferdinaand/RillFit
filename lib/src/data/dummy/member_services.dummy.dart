import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class MemberServices {
  const MemberServices({
    required this.name,
    required this.route,
    required this.image,
  });

  final String image;
  final String route;
  final String name;
}

final memberServices = <MemberServices>[
  const MemberServices(
    name: 'Gym',
    image: servicesImage,
    route: Routes.gym,
  ),
  const MemberServices(
    name: 'Train',
    image: servicesImage,
    route: Routes.train,
  ),
  const MemberServices(
    name: 'Stores',
    image: servicesImage,
    route: Routes.stores,
  ),
];
