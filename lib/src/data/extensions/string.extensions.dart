extension StringsUtils on String {
  String get capitalizeFirstLetter {
    if (isEmpty) return '';
    return '${substring(0, 1).toUpperCase()}${substring(1)}';
  }

  String removeCountryCode() {
    const countryCodeWithPlus = '+234';
    const countryCode = '234';
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

  String get addCountryCode {
    const countryCodeWithPlus = '+234';
    if (startsWith('0')) {
      //Phone number starts with 0, remove the 0 and add countryCode
      return '$countryCodeWithPlus${substring(1)}';
    } else {
      return this;
    }
  }
}
