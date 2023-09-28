// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, avoid_dynamic_calls, sort_constructors_first

class gymDetails {
  gymDetails({
    this.id,
    this.name,
    this.status,
    this.rating,
    this.description,
    this.openingTime,
    this.closingTime,
    this.phoneNumber,
    this.website,
    this.facebook,
    this.instagram,
    this.snapchat,
    this.whatsapp,
    this.address,
    this.country,
    this.city,
    this.state,
    this.thumbnail,
  });

  String? id;
  String? name;
  String? status;
  String? rating;
  String? description;
  String? openingTime;
  String? closingTime;
  String? phoneNumber;
  String? website;
  String? instagram;
  String? facebook;
  String? snapchat;
  String? whatsapp;
  String? address;
  String? country;
  String? state;
  String? city;
  String? thumbnail;

  factory gymDetails.fromJson(dynamic JsonData) => gymDetails(
        openingTime: JsonData['accessPeriod']['time']['start'] as String?,
        closingTime: JsonData['accessPeriod']['time']['end'] as String?,
        id: JsonData['_id'] as String?,
        website: JsonData['website'] as String?,
        description: JsonData['about'] as String?,
        // facebook: JsonData['socialLinks'][0]['facebook'] as String?,
        // snapchat: JsonData['socialLinks'][0]['snapchat'] as String?,
        // instagram: JsonData['socialLinks'][0]['instagram'] as String?,
        name: JsonData['name'] as String?,
        country: JsonData['locations'][0]['country'] as String,
        address: JsonData['locations'][0]['address'] as String?,
        state: JsonData['locations'][0]['state'] as String?,
        city: JsonData['locations'][0]['city'] as String?,
        phoneNumber: JsonData['phone'] as String?,
        thumbnail: JsonData['thumbnail'] as String?,
      );
}
