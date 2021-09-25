import 'package:flutter/material.dart';
import 'package:myfluttercrypto/data/global_data.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _openSite() async {
      if (await canLaunch(ConstantUtil.linkGitHub)) {
        await launch(ConstantUtil.linkGitHub);
        return;
      }

      WdgUtil.buildDialog(context, TypeDialog.error,
          ConstantUtil.errOpenSite + ConstantUtil.linkGitHub);
    }

    Row _rowNameApp = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsTopZero,
        child: RichText(
            textScaleFactor: 1.5,
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: ConstantUtil.nmApplication,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorThemeApp))
            ]))));

    Row _rowLicense = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: ConstantUtil.license,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: ConstantUtil.txtLicense,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowVersion = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: ConstantUtil.version,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: ConstantUtil.twoPoints + GlobalData.nuVersion,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowCopyright = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: ConstantUtil.copyright,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: ConstantUtil.txtCopyright,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowLinkGitHub = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: ConstantUtil.visit,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: ConstantUtil.twoPoints,
                  style: ConstantUtil.textStyleDefault),
              TextSpan(
                  text: ConstantUtil.linkGitHub,
                  recognizer: TapGestureRecognizer()..onTap = _openSite,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      decoration: TextDecoration.underline,
                      color: ConstantUtil.colorTxtUrl))
            ]))));

    return WdgUtil.buildScaffold(
        context, WdgUtil.buildAppBar(context, ConstantUtil.about), <Widget>[
      _rowNameApp,
      _rowVersion,
      _rowCopyright,
      _rowLinkGitHub,
      _rowLicense
    ]);
  }
}
