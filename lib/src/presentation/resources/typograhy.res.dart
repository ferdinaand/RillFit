import 'package:flutter/rendering.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

const TextStyle heading1 = TextStyle(
  fontSize: 32,
  fontFamily: 'Nunito',
  color: white,
  fontWeight: semiBoldText,
);

const TextStyle heading2 = TextStyle(
  fontSize: 28,
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: semiBoldText,
  height: 1.35,
);

const TextStyle heading3 = TextStyle(
  fontSize: 24,
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: semiBoldText,
);

const TextStyle heading4 = TextStyle(
  fontSize: 20,
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: boldText,
);

const TextStyle bodyXL = TextStyle(
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: regularText,
  fontSize: 18,
);

const TextStyle bodyL = TextStyle(
  fontFamily: 'Nunito',
  color: primary500,
  fontSize: 16,
  fontWeight: regularText,
);

const TextStyle bodyMed = TextStyle(
  fontFamily: 'Nunito',
  color: primary500,
  fontSize: 14,
  fontWeight: regularText,
);

const TextStyle bodySmall = TextStyle(
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: regularText,
  fontSize: 12,
  height: 1.5,
);

const TextStyle bodyXSmall = TextStyle(
  fontFamily: 'Nunito',
  color: primary500,
  fontWeight: regularText,
  fontSize: 10,
);

final hintTextStyle = bodyMed.copyWith(
  color: grayScale700,
  height: 1.5,
);

final buttonText = bodyL.copyWith(
  color: white,
  height: 1.5,
  fontWeight: semiBoldText,
);
