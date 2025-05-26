import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/image_consts.dart';

class CustomImageAsset extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  const CustomImageAsset({super.key, this.image, this.height, this.width,this.borderRadius,this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: image?.isNotEmpty ?? false ?  Image.asset(image ?? '', height: height, width: width,fit: fit,
          errorBuilder: (context, _, __) {
        return Image.asset(
          AppImages.placeholderImage,
          width: width,
          height: height,
          fit: fit,
        );
      }) : Image.asset(
        AppImages.placeholderImage,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
