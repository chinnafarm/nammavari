import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  final double width, height;
  final double radius, padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  const TCircularContainer({
    super.key,
    required this.width,
    required this.height,
     this.radius=16,
     this.padding= 8,
    this.child,
    required this.backgroundColor,  this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
width: width,
height: height,
margin: margin,
padding: EdgeInsets.all(padding),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(radius),
  color: backgroundColor
),
child: child,

    );
  }
}
