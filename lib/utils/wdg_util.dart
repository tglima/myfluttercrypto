import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';

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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: listWdg,
              ),
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

    return TextButton(
      onPressed: function,
      child: Text(
        nmIcon,
        style: TextStyle(color: txtColorBtn),
      ),
      style: TextButton.styleFrom(
        backgroundColor: bkgColorBtn,
        padding: ConstantUtil.padTxtBtnDefault,
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
    txtButton = txtButton.isEmpty ? ConstantUtil.close : txtButton;
    IconData iconDisplay = Icons.sentiment_satisfied_alt_outlined;
    Color iconColor = ConstantUtil.colorWhite;
    double iconSize = showIcon ? 90.0 : 0;

    colorBkgTitle = colorBkgTitle == Colors.transparent
        ? ConstantUtil.colorThemeApp
        : colorBkgTitle;
    txtButton = txtButton == '' ? ConstantUtil.close : txtButton;

    switch (typeDialog) {
      case TypeDialog.alert:
        {
          txtTitle = txtTitle.isEmpty ? ConstantUtil.alert : txtTitle;
          iconDisplay = Icons.error_rounded;
          iconColor = ConstantUtil.colorAlert;
        }
        break;

      case TypeDialog.error:
        {
          txtTitle = txtTitle.isEmpty ? ConstantUtil.error : txtTitle;
          iconDisplay = Icons.cancel_rounded;
          iconColor = ConstantUtil.colorRed;
        }
        break;

      case TypeDialog.success:
        {
          txtTitle = txtTitle.isEmpty ? ConstantUtil.success : txtTitle;
          iconDisplay = Icons.check_circle_outlined;
          iconColor = ConstantUtil.colorSuccess;
        }
        break;

      case TypeDialog.exception:
        {
          txtTitle = txtTitle.isEmpty ? ConstantUtil.error : txtTitle;
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
              constraints: const BoxConstraints(
                  maxWidth: ConstantUtil.maxWidthBox,
                  maxHeight: ConstantUtil.maxHeightBox),
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
                                        padding: ConstantUtil.padTxtBtnDefault),
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
