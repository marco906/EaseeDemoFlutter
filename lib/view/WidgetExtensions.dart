import 'package:flutter/cupertino.dart';

// SwiftUI Style view modifiers for better reading and less nested code
extension WidgetModifier on Widget {
  Widget padding({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? leading,
    double? trailing,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          top: top ?? vertical ?? all ?? 0.0,
          bottom: bottom ?? vertical ?? all ?? 0.0,
          left: leading ?? horizontal ?? all ?? 0.0,
          right: trailing ?? horizontal ?? all ?? 0.0,
        ),
        child: this,
      );

  Widget alignment({
    Key? key,
    required AlignmentGeometry alignment,
  }) =>
      Align(
        key: key,
        alignment: alignment,
        child: this,
      );

  Widget opacity({
    Key? key,
    required double value,
  }) =>
      Opacity(
        key: key,
        opacity: value,
        child: this,
      );


  Widget frame({
    Key? key,
    double? width,
    double? height,
  }) =>
      SizedBox(
        key: key,
        width: width,
        height: height,
        child: this,
      );
}


