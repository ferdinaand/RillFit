// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

import 'package:BUswift/Models/autocomplete_response.dart';

class PlaceAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? results;
  PlaceAutocompleteResponse({this.status, this.results});

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      results: json['results'] != null
          ? json['results']
              .map<AutocompletePrediction>(
                  (json) => AutocompletePrediction.fromJson(json))
              .toList()
          : null,
    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}

//___________________________________________________________________________
class PlaceAutocompleteResponsePickUp {
  final String? status;
  final List<AutocompletePredictionPickUp>? results;
  PlaceAutocompleteResponsePickUp({this.status, this.results});

  factory PlaceAutocompleteResponsePickUp.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponsePickUp(
      status: json['status'] as String?,
      results: json['results'] != null
          ? json['results']
              .map<AutocompletePredictionPickUp>(
                  (json) => AutocompletePredictionPickUp.fromJson(json))
              .toList()
          : null,
    );
  }

  static PlaceAutocompleteResponsePickUp parseAutocompleteResultPicUp(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return PlaceAutocompleteResponsePickUp.fromJson(parsed);
  }
}

// class dropOffresponse {
//   final String? status;
//   final List<dropOffAdds>? features;
//   dropOffresponse({this.status, this.features});

//   factory dropOffresponse.fromJson(Map<String, dynamic> json) {
//     return dropOffresponse(
//         status: json['status'] as String?,
//         features: json['features'] != null
//             ? json['features']
//                 .map<dropOffAdds>((json) => dropOffAdds.fromJson(json))
//                 .toList()
//             : null);
//   }

//   static dropOffresponse parseDropOffResults(String responseBody) {
//     final parsed = json.decode(responseBody).cast<String, dynamic>();
//     return dropOffresponse.fromJson(parsed);
//   }
// }
