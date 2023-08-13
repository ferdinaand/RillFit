import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({
    required this.height,
    required this.width,
    super.key,
  });
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
