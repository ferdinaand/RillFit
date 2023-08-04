// ignore_for_file: unused_import, camel_case_types, directives_ordering

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// class Users {
//   String? id;
//   String? email;
//   String? name;
//   dynamic phone;

//   Users({this.id, this.email, this.name, this.phone});

//   Users.fromSnapshot(DataSnapshot dataSnapshot) {
//     Map<dynamic, dynamic> map = dataSnapshot.value! as Map<dynamic, dynamic>;
//     id = dataSnapshot.key;
//     email = map["email"] as String;
//     name = map["firstname"] as String;
//     phone = map["Phone No"] as String;
//   }
// }

// class userSearch {
//   String? id;
//   String? email;
//   String? name;
//   userSearch({this.id, this.email, this.name});

// userSearch.fromSnapshot(DataSnapshot dataSnapshot) {
//   Map<dynamic, dynamic> map = dataSnapshot.value! as Map<dynamic, dynamic>;

//   id = map['user_id'];
// }
// }

class gymOwnerDetails {
  gymOwnerDetails({
    this.gymName,
    this.phoneNumber,
    this.logoImage,
    this.state,
    this.city,
    this.address,
    this.gymOwnerId,
  });

  String? gymName;
  String? phoneNumber;
  String? logoImage;
  String? state;
  String? city;
  String? address;
  String? gymOwnerId;
}
