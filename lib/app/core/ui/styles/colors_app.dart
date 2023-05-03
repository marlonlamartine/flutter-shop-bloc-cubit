import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  //Color get primary => const Color(0XFFF8F8FF); //Colors.white;
  Color get fillColor => const Color(0XFFf2efef);
  Color get primaryColor => const Color(0XFFFF794F);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
