class GymList {
  GymList({
    required this.id,
    required this.name,
    required this.logo,
    required this.city,
    required this.address,
  });

  String id;
  String name;
  String logo;
  String address;
  String city;

  factory GymList.fromJson(dynamic JsonData) => GymList(
        id: JsonData['data']['items']['id'] as String,
        name: JsonData['data']['items']['name'] as String,
        city: JsonData['data']['items']['locations']['city'] as String,
        logo: JsonData['data']['items']['thumbnail'] as String,
        address: JsonData['data']['items']['locations']['address'] as String,
      );
}
