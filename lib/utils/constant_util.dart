import 'package:flutter/material.dart';
import 'package:myfluttercrypto/data/global_data.dart';

class ConstantUtil {
  //Texts
  static const String nuVersion = '1.0.20211003';
  static const String nmApplication = "MyFlutterCrypto";
  static const String linkGitHub = 'https://github.com/tglima/myfluttercrypto';
  //Colors
  static final Color colorThemeApp = Colors.indigo.shade500;
  static final Color colorTxtUrl = Colors.indigo;
  static final Color colorRed = Colors.redAccent.shade700;
  static final Color colorTxtDefault = Colors.black87;
  static final Color colorWhite = Colors.white;
  static final Color colorAlert = Colors.yellow.shade600;
  static final Color colorSuccess = Colors.green.shade800;
  static final Color colorSilver = Colors.grey.shade600;

  //EdgeInsetsGeometry
  static const EdgeInsetsGeometry edgeInsetsDefault =
      EdgeInsets.fromLTRB(16, 8, 16, 8);

  static const EdgeInsetsGeometry edgeInsetsTopZero =
      EdgeInsets.fromLTRB(16, 0, 16, 8);

  static EdgeInsetsGeometry padTxtBtnDefault() {
    return GlobalData.isMobileDevice
        ? const EdgeInsets.fromLTRB(20, 16, 20, 16)
        : const EdgeInsets.fromLTRB(40, 16, 40, 16);
  }

  //Others
  static const double lineHeightDefault = 1.5;
  static final TextStyle textStyleDefault = TextStyle(
      height: ConstantUtil.lineHeightDefault,
      color: ConstantUtil.colorTxtDefault);
  static double defaultPadTop() {
    return GlobalData.isMobileDevice ? 12 : 20;
  }

  static double maxWidthBox(context) {
    return GlobalData.isMobileDevice
        ? (MediaQuery.of(context).size.width - 56)
        : 475;
  }

  static double maxHeightBox(context) {
    return GlobalData.isMobileDevice
        ? (MediaQuery.of(context).size.height * 0.25)
        : 350;
  }

  static const int lengthKeyWord = 20;

  static const Locale brazilianPortuguese = Locale('pt', 'BR');
  static const Locale americanEnglish = Locale('en', 'US');
}
