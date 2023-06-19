// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:provider/provider.dart';
import 'package:BUswift/Data%20Handler/AppData.dart';

class AutocompletePrediction {
  String? name;
  String? formatted;
  String? placeId;
  double? latitude;
  double? longitude;
  Query? query;

  AutocompletePrediction(
      {this.formatted,
      this.name,
      this.placeId,
      this.latitude,
      this.longitude,
      this.query});
  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      name: json['name'] as String?,
      placeId: json['place_id'] as String?,
      formatted: json['formatted'] as String?,
      latitude: json['lat'] as double?,
      longitude: json['lon'] as double?,
      query: json['query'] != null ? Query.fromJson(json['formatted']) : null,
    );
  }
}

class Query {
  final String? Text;

  Query({this.Text});

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(Text: json['text'] as String?);
  }
}

class AutocompletePredictionPickUp {
  String? name;
  String? formatted;
  String? placeId;
  double? latitude;
  double? longitude;
  Querys? query;

  AutocompletePredictionPickUp(
      {this.formatted,
      this.name,
      this.placeId,
      this.latitude,
      this.longitude,
      this.query});
  factory AutocompletePredictionPickUp.fromJson(Map<String, dynamic> json) {
    return AutocompletePredictionPickUp(
      name: json['name'] as String?,
      placeId: json['place_id'] as String?,
      formatted: json['formatted'] as String?,
      latitude: json['lat'] as double?,
      longitude: json['lon'] as double?,
      query: json['query'] != null ? Querys.fromJson(json['formatted']) : null,
    );
  }
}

class Querys {
  final String? Text;

  Querys({this.Text});

  factory Querys.fromJson(Map<String, dynamic> json) {
    return Querys(Text: json['text'] as String?);
  }
}

// class dropOffAdds {
//   String? name;
//   String? formatted;
//   String? placeId;
//   double? latitude;
//   double? longitude;
//   Geometry? geometry;

//   dropOffAdds(
//       {this.formatted,
//       this.name,
//       this.placeId,
//       this.latitude,
//       this.longitude,
//       this.geometry});
//   factory dropOffAdds.fromJson(Map<String, dynamic> json) {
//     return dropOffAdds(
//       name: json['name'] as String?,
//       placeId: json['place_id'] as String?,
//       formatted: json['formatted'] as String?,
//       latitude: json['lat'] as double?,
//       longitude: json['lon'] as double?,
//       geometry: json['Geometry'] != null
//           ? Geometry.fromJson(json['formatted'])
//           : null,
//     );
//   }
// }

// class Geometry {
//   final String? type;

//   Geometry({this.type});

//   factory Geometry.fromJson(Map<String, dynamic> json) {
//     return Geometry(type: json['type'] as String?);
//   }
// }
