import 'package:flutter/rendering.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

const TextStyle heading1 = TextStyle(
  fontSize: 32,
  fontFamily: 'Nunito',
  fontWeight: semiBoldText,
);

const TextStyle heading2 = TextStyle(
  fontSize: 28,
  fontFamily: 'Nunito',
  fontWeight: semiBoldText,
  height: 1.35,
);

const TextStyle heading3 = TextStyle(
  fontSize: 24,
  fontFamily: 'Nunito',
  fontWeight: semiBoldText,
);

const TextStyle heading4 = TextStyle(
  fontSize: 20,
  fontFamily: 'Nunito',
  fontWeight: boldText,
);

const TextStyle bodyXL = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: regularText,
  fontSize: 18,
);

const TextStyle bodyL = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 16,
  fontWeight: regularText,
);

const TextStyle bodyMed = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 14,
  fontWeight: regularText,
);

const TextStyle bodySmall = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: regularText,
  fontSize: 12,
  height: 1.5,
);

const TextStyle bodyXSmall = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: regularText,
  fontSize: 10,
);

final hintTextStyle = bodyMed.copyWith(
  height: 1.5,
);

final buttonText = bodyL.copyWith(
  height: 1.5,
  fontWeight: semiBoldText,
);
