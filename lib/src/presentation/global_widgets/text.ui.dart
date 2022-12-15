import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class TextUi extends StatelessWidget {
  const TextUi(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodyMed,
  });

  const TextUi.heading1(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.decoration,
    this.textAlign = TextAlign.center,
    this.style = heading1,
    this.isSelectable = false,
    this.height,
  });

  const TextUi.heading2(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = heading2,
  });

  const TextUi.heading3(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = heading3,
  });

  const TextUi.heading4(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = heading4,
  });

  const TextUi.bodyXL(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodyXL,
  });

  const TextUi.bodyLarge(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodyL,
  });

  const TextUi.bodyMed(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodyMed,
  });

  const TextUi.bodySmall(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodySmall,
  });

  const TextUi.bodyXSmall(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.decoration,
    this.style = bodyXSmall,
  });

  final String data;
  final TextStyle style;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool isSelectable;
  final double? height;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    if (isSelectable) {
      return SelectableText(
        data,
        textAlign: textAlign,
        style: style.copyWith(
          color: color,
          fontSize: fontSize?.sp,
          fontWeight: fontWeight,
          height: height,
        ),
        maxLines: maxLines,
      );
    }

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.visible,
      softWrap: true,
      style: style.copyWith(
        color: color,
        decoration: decoration,
        fontSize: fontSize?.sp,
        height: height ?? 1.5,
        fontWeight: fontWeight,
      ),
    );
  }
}
