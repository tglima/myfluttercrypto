import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _openSite() async {
      String? linkWiki = AppLocalizations.of(context)?.linkWiki.toString();

      linkWiki = linkWiki!.isEmpty ? ConstantUtil.linkGitHub : linkWiki;

      try {
        await launch(linkWiki);
      } catch (err) {
        String? messageError =
            AppLocalizations.of(context)!.errOpenSite + linkWiki;

        messageError += '\n \n Exception message: ${err.toString()}';

        WdgUtil.buildDialog(context, TypeDialog.error, messageError);
      }
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
                  text: AppLocalizations.of(context)!.license,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.txtLicense,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowVersion = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)!.version,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.twoPoints +
                      ConstantUtil.nuVersion,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowCopyright = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)!.copyright,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.txtCopyright,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    Row _rowLinkGitHub = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)!.visit,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.twoPoints,
                  style: ConstantUtil.textStyleDefault),
              TextSpan(
                  text: AppLocalizations.of(context)!.linkGitHub,
                  recognizer: TapGestureRecognizer()..onTap = _openSite,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      decoration: TextDecoration.underline,
                      color: ConstantUtil.colorTxtUrl))
            ]))));

    Row _rowTranslators = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsDefault,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)!.labelTranslators,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.nameTranslators,
                  style: ConstantUtil.textStyleDefault)
            ]))));

    return WdgUtil.buildScaffold(
        context,
        WdgUtil.buildAppBar(context, AppLocalizations.of(context)!.about),
        <Widget>[
          _rowNameApp,
          _rowVersion,
          _rowCopyright,
          _rowLinkGitHub,
          _rowLicense,
          _rowTranslators
        ]);
  }
}
