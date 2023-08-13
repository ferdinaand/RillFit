class GymLocations {
  GymLocations({
    required this.state,
    required this.city,
  });

  String? state;
  String? city;

  factory GymLocations.fromJson(Map<String, dynamic> JsonData) => GymLocations(
        state: JsonData['data']['items']['state'] as String?,
        city: JsonData['data']['items']['city'] as String?,
      );
}
