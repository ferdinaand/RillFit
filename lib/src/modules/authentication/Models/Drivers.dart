// ignore_for_file: non_constant_identifier_names

import 'package:firebase_database/firebase_database.dart';

class Drivers {
  String? name;
  String? phone;
  String? email;
  String? id;
  String? car_color;
  String? car_model;
  String? car_number;

  Drivers(
      {this.name,
      this.phone,
      this.email,
      this.id,
      this.car_model,
      this.car_color,
      this.car_number});

  Drivers.fromSnapshot(DataSnapshot snapshot) {
    Map<dynamic, dynamic> map = snapshot.value! as Map<dynamic, dynamic>;
    if (snapshot.exists) {
      id = snapshot.key;
      phone = map['Phone No'];
      name = map['firstname'];
      email = map['email'];
      car_color = map['car details']['car color'];
      car_model = map['car details']['car model'];
      car_number = map['car details'][' plate number'];
    }
  }
}
