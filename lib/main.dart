import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:myfluttercrypto/screens/home_screen.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'data/global_data.dart';

void main() async {
  GlobalData.isMobileDevice = Platform.isAndroid;

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = PackageInfo(
      appName: '',
      packageName: '',
      version: '',
      buildNumber: '',
      buildSignature: '',
    );
    final info = await PackageInfo.fromPlatform();
    packageInfo = info;
    GlobalData.nuVersion = packageInfo.version;
  }

  runApp(const MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [Locale('pt', 'BR')],
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    title: ConstantUtil.nmApplication,
  ));

  await _initPackageInfo();
}
