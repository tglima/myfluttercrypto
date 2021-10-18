import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:myfluttercrypto/screens/home_screen.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'data/global_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:desktop_window/desktop_window.dart';

void main() async {
  GlobalData.isMobileDevice = Platform.isAndroid;

  Future _setMinWindowSize() async {
    if (!GlobalData.isMobileDevice) {
      await DesktopWindow.setMinWindowSize(ConstantUtil.minWindowSize);
    }
  }

  runApp(const MaterialApp(
    supportedLocales: [
      ConstantUtil.americanEnglish,
      ConstantUtil.brazilianPortuguese,
      ConstantUtil.spanishDefault,
      ConstantUtil.italianDefault
    ],
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    title: ConstantUtil.nmApplication,
  ));

  await _setMinWindowSize();
}
