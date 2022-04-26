import 'package:flutter/cupertino.dart';

// Apple San Francisco font sizes
class SFFontSize {
  static double get largeTitle => 34;
  static double get title => 28;
  static double get title2 => 22;
  static double get title3 => 20;
  static double get body => 17;
  static double get callout => 16;
  static double get subheadline => 15;
  static double get footnote => 13;
  static double get caption => 12;
}

// Apple San Francisco font weights
extension SFFontWeight on FontWeight {
  static FontWeight get black => FontWeight.w900;
  static FontWeight get heavy => FontWeight.w800;
  static FontWeight get bold => FontWeight.w700;
  static FontWeight get semibold => FontWeight.w600;
  static FontWeight get medium => FontWeight.w500;
  static FontWeight get regular => FontWeight.w400;
  static FontWeight get light => FontWeight.w300;
  static FontWeight get thin => FontWeight.w200;
  static FontWeight get ultraThin => FontWeight.w100;
}

// TextStyle shortcuts
class SFTextStyle {
  static TextStyle get largeTitle => TextStyle(fontSize: SFFontSize.largeTitle);
  static TextStyle get title => TextStyle(fontSize: SFFontSize.title);
  static TextStyle get title2 => TextStyle(fontSize: SFFontSize.title2);
  static TextStyle get title3 => TextStyle(fontSize: SFFontSize.title3);
  static TextStyle get headline => TextStyle(fontSize: SFFontSize.body).w(SFFontWeight.semibold);
  static TextStyle get body => TextStyle(fontSize: SFFontSize.body);
  static TextStyle get subheadline => TextStyle(fontSize: SFFontSize.subheadline);
  static TextStyle get callout => TextStyle(fontSize: SFFontSize.callout);
  static TextStyle get footnote => TextStyle(fontSize: SFFontSize.footnote);
  static TextStyle get caption => TextStyle(fontSize: SFFontSize.caption);
}

extension TextStyleExtend on TextStyle {
  TextStyle w(FontWeight value) => copyWith(fontWeight: value);
  TextStyle c(Color value) => copyWith(color: value);
}

