// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

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

  factory gymDetails.fromJson(dynamic JsonData) => gymDetails(
        id: JsonData['data']['items']['state'] as String?,
      );
}
