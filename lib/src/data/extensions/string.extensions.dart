import 'package:riilfit/src/presentation/resources/strings.res.dart';

extension StringsUtils on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }

    return '${substring(0, 1).toUpperCase()}${substring(1)}';
  }

  String get removeCountryCode {
    if (isEmpty) {
      return this;
    }

    if (startsWith(countryCodeWithPlus)) {
      //Phone number starts with +234, remove the countryCode
      return '0${substring(4)}';
    } else if (startsWith(countryCode)) {
      //Phone number starts with 234, remove that mofo
      return '0${substring(3)}';
    } else {
      return this;
    }
  }

  String get obscurePhoneNumber {
    if (isEmpty) {
      return this;
    }

    return '${substring(0, 8)} *** ** ${substring(12)}';
  }

  String get addCountryCode {
    if (isEmpty) {
      return this;
    } else if (startsWith('0')) {
      //Phone number starts with 0, remove the 0 and add countryCode
      return '$countryCodeWithPlus${substring(1)}';
    } else {
      return this;
    }
  }
}
