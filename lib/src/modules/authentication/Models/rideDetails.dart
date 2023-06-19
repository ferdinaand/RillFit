// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:google_maps_flutter/google_maps_flutter.dart';

class rideDetails {
  String? pickup_address;
  String? dropoff_address;
  LatLng? pickup;
  LatLng? dropoff;
  String? ride_request_id;
  String? payment_method;
  String? rider_name;
  String? rider_phone;

  rideDetails(
      {this.pickup_address,
      this.dropoff_address,
      this.pickup,
      this.dropoff,
      this.ride_request_id,
      this.payment_method,
      this.rider_name,
      this.rider_phone});
}
