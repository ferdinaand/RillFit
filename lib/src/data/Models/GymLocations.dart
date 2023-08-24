// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

// List<GymLocations> gymLocationsFromJson(String str) => List<GymLocations>.from(
//       json.decode(str) as Iterable<dynamic>,
//     );

class GymLocations {
  GymLocations({
    required this.state,
    required this.city,
  });

  String? state;
  String? city;

  factory GymLocations.fromJson(dynamic JsonData) => GymLocations(
        state: JsonData['data']['items']['state'] as String?,
        city: JsonData['data']['items']['city'] as String?,
      );
}
