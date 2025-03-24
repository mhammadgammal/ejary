import 'package:flutter/material.dart';
import 'package:ejary/core/widgets/shimmer_loading.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(this.imageUrl, {super.key, this.width, this.height});

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width ?? 100,
      height: height ?? 100,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return ShimmerLoading(
          width: width ?? 100,
          height: height ?? 100,
        );
      },
    );
  }
}
