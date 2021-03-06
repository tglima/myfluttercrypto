import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myfluttercrypto/data/global_data.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WdgUtil {
  static buildAppBar(BuildContext context, String title) {
    return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ConstantUtil.colorThemeApp,
        title: Text(title));
  }

  static buildScaffold(
      BuildContext context, PreferredSizeWidget appBar, List<Widget> listWdg) {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: appBar,
        body: Container(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: listWdg,
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: appBar,
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: listWdg)));
  }

  static buildTxtButton(BuildContext context, String nmIcon, dynamic function,
      {Color bkgColorBtn = Colors.transparent,
      Color txtColorBtn = Colors.transparent}) {
    if (bkgColorBtn == Colors.transparent) {
      bkgColorBtn = ConstantUtil.colorThemeApp;
    }

    if (txtColorBtn == Colors.transparent) {
      txtColorBtn = ConstantUtil.colorWhite;
    }

    if (GlobalData.isMobileDevice) {
      return TextButton(
        onPressed: function,
        child: Text(
          nmIcon,
          style: TextStyle(color: txtColorBtn),
        ),
        style: TextButton.styleFrom(
            backgroundColor: bkgColorBtn,
            padding: ConstantUtil.padTxtBtnDefault(),
            minimumSize: const Size(140, 40),
            maximumSize: const Size(200, 80)),
      );
    }

    return TextButton(
      onPressed: function,
      child: Text(
        nmIcon,
        style: TextStyle(color: txtColorBtn),
      ),
      style: TextButton.styleFrom(
        backgroundColor: bkgColorBtn,
        padding: ConstantUtil.padTxtBtnDefault(),
      ),
    );
  }

  static buildRow(Widget child) {
    return Row(children: [Expanded(child: child)]);
  }

  static void buildDialog(
      BuildContext context, TypeDialog typeDialog, String txtContent,
      {String txtTitle = '',
      String txtButton = '',
      Color colorBkgTitle = Colors.transparent,
      bool showIcon = true}) {
    txtButton =
        txtButton.isEmpty ? AppLocalizations.of(context)!.close : txtButton;
    IconData iconDisplay = Icons.sentiment_satisfied_alt_outlined;
    Color iconColor = ConstantUtil.colorWhite;
    double iconSize = showIcon ? 90.0 : 0;
    double maxHeightDialog = GlobalData.isMobileDevice
        ? (MediaQuery.of(context).size.height * 0.50)
        : ConstantUtil.maxHeightBox(context);
    colorBkgTitle = colorBkgTitle == Colors.transparent
        ? ConstantUtil.colorThemeApp
        : colorBkgTitle;
    txtButton =
        txtButton == '' ? AppLocalizations.of(context)!.close : txtButton;

    switch (typeDialog) {
      case TypeDialog.alert:
        {
          txtTitle =
              txtTitle.isEmpty ? AppLocalizations.of(context)!.alert : txtTitle;
          iconDisplay = Icons.error_rounded;
          iconColor = ConstantUtil.colorAlert;
        }
        break;

      case TypeDialog.error:
        {
          txtTitle =
              txtTitle.isEmpty ? AppLocalizations.of(context)!.error : txtTitle;
          iconDisplay = Icons.cancel_rounded;
          iconColor = ConstantUtil.colorRed;
        }
        break;

      case TypeDialog.success:
        {
          txtTitle = txtTitle.isEmpty
              ? AppLocalizations.of(context)!.success
              : txtTitle;
          iconDisplay = Icons.check_circle_outlined;
          iconColor = ConstantUtil.colorSuccess;
        }
        break;

      case TypeDialog.exception:
        {
          txtTitle =
              txtTitle.isEmpty ? AppLocalizations.of(context)!.error : txtTitle;
          iconDisplay = Icons.error_sharp;
          colorBkgTitle = ConstantUtil.colorRed;
          iconColor = ConstantUtil.colorRed;
        }
        break;
    }

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: ConstantUtil.maxWidthBox(context),
                  maxHeight: maxHeightDialog),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: colorBkgTitle,
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(txtTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ConstantUtil.colorWhite,
                              fontSize: 20)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: ConstantUtil.colorWhite,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(children: <Widget>[
                          Icon(iconDisplay, color: iconColor, size: iconSize),
                          Text(txtContent, textAlign: TextAlign.center),
                        ])),
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ConstantUtil.colorWhite,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            ConstantUtil.colorThemeApp,
                                        padding:
                                            ConstantUtil.padTxtBtnDefault()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(txtButton,
                                        style: TextStyle(
                                            color: ConstantUtil.colorWhite)))
                              ])))
                ],
              ),
            ),
          );
        });
  }

  static void goToScreen(
      {@required dynamic context, @required dynamic screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
