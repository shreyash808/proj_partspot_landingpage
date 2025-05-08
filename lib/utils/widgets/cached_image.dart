
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:partyspot/utils/utility.dart';

import '../constants/image_consts.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? boxFit;

  const CachedImage({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {

    if (imageUrl == null || imageUrl!.isEmpty || Utility.isVideo(imageUrl!)) {
      return Image.asset(
        AppImages.placeholderImage,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.cover,
      );
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        height: height,
        width: width,
        cacheKey: imageUrl,
        fit: boxFit ?? BoxFit.cover,
        memCacheHeight: height?.toInt(),
        memCacheWidth: width?.toInt(),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
          ),
        ),

        errorWidget: (context, url, error) => Image.asset(
          AppImages.placeholderImage,
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
