import 'package:flutter/material.dart';
import 'package:myfluttercrypto/screens/home_screen.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'data/global_data.dart';

void main() async {
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
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    title: ConstantUtil.nmApplication,
  ));

  await _initPackageInfo();
}
