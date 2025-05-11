import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyspot/utils/constants/image_consts.dart';

class CustomSvgPicture extends StatelessWidget {
  final String? iconPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Function()? onTap;
  const CustomSvgPicture(
      {super.key, this.iconPath, this.height, this.color, this.width,this.fit,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: iconPath?.isNotEmpty ?? false || (iconPath?.contains('.svg') ?? false)
          ? SvgPicture.asset(
              iconPath ?? '',
              height: height,
              width: width,
              fit: fit ?? BoxFit.none,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            )
          : Image.asset(
              AppImages.placeholderImage,
              width: width,
              height: height,
            ),
    );
  }
}
