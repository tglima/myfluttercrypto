import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return WdgUtil.buildScaffold(
        context, WdgUtil.buildAppBar(context, ConstantUtil.settings), []);
  }
}
