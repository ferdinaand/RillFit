import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
  });

  final String icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        icon,
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}
