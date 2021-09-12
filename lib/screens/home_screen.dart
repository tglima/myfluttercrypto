import 'package:flutter/material.dart';
import 'package:myfluttercrypto/screens/settings_sreen.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';

import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void goToSettings() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()));
    }

    void goToAbout() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AboutScreen()));
    }

    AppBar _buildAppBar = AppBar(
        backgroundColor: ConstantUtil.colorThemeApp,
        title: Text(ConstantUtil.nmApplication),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings),
              tooltip: ConstantUtil.settings,
              onPressed: goToSettings),
          IconButton(
              icon: const Icon(Icons.info),
              tooltip: ConstantUtil.about,
              onPressed: goToAbout)
        ]);

    return WdgUtil.buildScaffold(context, _buildAppBar, []);
  }
}
