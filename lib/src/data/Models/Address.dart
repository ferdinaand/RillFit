// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

class Address {
  String? PlaceName;
  String? PlaceId;
  var Latitude;
  var Longitude;

  Address({this.PlaceName, this.Latitude, this.Longitude, this.PlaceId});
}

class dropoffAds {
  String? name;
  String? placeId;
  String? formatted;
  var latitude;
  var longitude;
  dropoffAds(
      {this.name, this.placeId, this.formatted, this.latitude, this.longitude});
}

class PickUpAds {
  String? PlaceName;
  String? PlaceId;
  var Latitude;
  var Longitude;
  String? formatted;

  PickUpAds(
      {this.PlaceName,
      this.Latitude,
      this.Longitude,
      this.PlaceId,
      this.formatted});
}
