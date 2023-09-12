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
        // openingTime:
        //     JsonData['data']['accessPeriod']['time']['start'] as String?,
        // closingTime: JsonData['data']['accessPeriod']['time']['end'] as String?,
        // id: JsonData['data']['_id'] as String?,
        // website: JsonData['data']['website'] as String?,
        // description: JsonData['data']['about'] as String?,
        // facebook: JsonData['data']['socialLinks']['facebook'] as String?,
        // snapchat: JsonData['data']['socialLinks']['snapchat'] as String?,
        // instagram: JsonData['data']['socialLinks']['instagram'] as String?,
        name: JsonData['name'] as String?,
        country: JsonData['locations'][0]['country'] as String,
        address: JsonData['locations'][0]['address'] as String?,
        // state: JsonData['data']['locations']['state'] as String?,
        // city: JsonData['data']['locations']['city'] as String?,
        // phoneNumber: JsonData['data']['phone'] as String?,
        // thumbnail: JsonData['data']['thumbnail'] as String?,
      );
}
