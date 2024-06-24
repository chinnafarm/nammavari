import 'package:flutter/material.dart';

class TroundedImages extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onpressed;
  final double borderRadius;

  const TroundedImages({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
     this.applyImageRadius= true,
    this.border,
    required this.backgroundColor,
    this.fit,
    this.padding,
     this.isNetworkImage =false,
    this.onpressed, required this.borderRadius,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
            borderRadius: BorderRadius.circular(borderRadius),
            color:backgroundColor),
        child: ClipRRect(
            borderRadius: applyImageRadius? BorderRadius.circular(borderRadius):BorderRadius.zero,
            child:  Image(
              image:isNetworkImage ? NetworkImage(imageUrl):AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
