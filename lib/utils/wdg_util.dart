import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';

class WdgUtil {
  static buildAppBar(BuildContext context, String title) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ConstantUtil.colorThemeApp,
        title: Text(title));
  }

  static buildScaffold(
      BuildContext context, PreferredSizeWidget appBar, List<Widget> listWdg) {
    return Scaffold(
        appBar: appBar,
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: listWdg)));
  }

  static buildTxtButton(BuildContext context, String nmIcon, dynamic fuction) {}
}
