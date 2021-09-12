import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen();

  @override
  Widget build(BuildContext context) {
    _openSite() {
      print('Opened site');
    }

    Row _rowNameApp = Row(children: [
      Padding(
          padding: ConstantUtil.edgeInsetsTopZero,
          child: RichText(
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: ConstantUtil.nmApplication,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstantUtil.colorThemeApp))
              ])))
    ]);

    Row _rowLicense = Row(children: [
      Padding(
          padding: ConstantUtil.edgeInsetsDefault,
          child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: ConstantUtil.license,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstantUtil.colorTxtDefault)),
                TextSpan(
                    text: ConstantUtil.txtLicense,
                    style: TextStyle(color: ConstantUtil.colorTxtDefault))
              ])))
    ]);

    Row _rowVersion = Row(children: [
      Padding(
          padding: ConstantUtil.edgeInsetsDefault,
          child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: ConstantUtil.version,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstantUtil.colorTxtDefault)),
                TextSpan(
                    text: ConstantUtil.nuVersion,
                    style: TextStyle(color: ConstantUtil.colorTxtDefault))
              ])))
    ]);

    Row _rowCopyright = Row(children: [
      Padding(
          padding: ConstantUtil.edgeInsetsDefault,
          child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: ConstantUtil.copyright,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstantUtil.colorTxtDefault)),
                TextSpan(
                    text: ConstantUtil.txtCopyright,
                    style: TextStyle(color: ConstantUtil.colorTxtDefault))
              ])))
    ]);

    GestureDetector _gesDetRowLinkGitHub = GestureDetector(
        onTap: _openSite,
        child: Row(children: [
          Padding(
              padding: ConstantUtil.edgeInsetsDefault,
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: ConstantUtil.visit,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ConstantUtil.colorTxtDefault)),
                    TextSpan(
                        text: ConstantUtil.twoPoints + ' ',
                        style: TextStyle(color: ConstantUtil.colorTxtDefault)),
                    TextSpan(
                        text: ConstantUtil.linkGitHub,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ConstantUtil.colorTxtUrl))
                  ])))
        ]));

    List<Widget> _wdgsAboutScreen = <Widget>[
      _rowNameApp,
      _rowVersion,
      _rowCopyright,
      _gesDetRowLinkGitHub,
      _rowLicense
    ];

    return WdgUtil.buildScaffold(context,
        WdgUtil.buildAppBar(context, ConstantUtil.about), _wdgsAboutScreen);
  }
}
