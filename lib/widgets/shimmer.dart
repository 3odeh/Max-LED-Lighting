import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBuilder extends StatelessWidget {
  final double? height, width;
  final Color baseColor, highlightColor;
  final double? radius;
  final BoxShape shape;

  const ShimmerBuilder({
    super.key,
    this.height,
    this.width,
    this.baseColor = const Color(0xFFE6E6E6),
    this.highlightColor = const Color(0xFF9E9E9E),
    this.radius = 10.0,
  }) : shape = BoxShape.rectangle;

  const ShimmerBuilder.circle({
    super.key,
    required double size,
    this.baseColor = const Color(0xFFE6E6E6),
    this.highlightColor = const Color(0xFF9E9E9E),
  })  : height = size,
        width = size,
        radius = null,
        shape = BoxShape.circle;

  const ShimmerBuilder.square({
    super.key,
    required double size,
    this.radius = 10,
    this.baseColor = const Color(0xFFE6E6E6),
    this.highlightColor = const Color(0xFF9E9E9E),
  })  : height = size,
        width = size,
        shape = BoxShape.rectangle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: baseColor,
          borderRadius: radius == null ? null : BorderRadius.circular(radius!),
        ),
      ),
    );
  }
}
