import 'package:fake_api_shop/app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get primaryText => GoogleFonts.lato();
  TextStyle get primaryTextTitle =>
      GoogleFonts.lato().copyWith(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle get primaryTextBody =>
      GoogleFonts.lato().copyWith(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle get primaryTextComment =>
      GoogleFonts.lato().copyWith(fontSize: 16, color: Colors.grey.shade500);
  TextStyle get primaryTextPrice => GoogleFonts.lato().copyWith(
      fontSize: 16, fontWeight: FontWeight.bold, color: kPrimaryColor);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
