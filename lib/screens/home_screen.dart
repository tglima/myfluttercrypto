import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ConstantUtil.colorThemeApp,
            title: Text(ConstantUtil.nmApplication),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: ConstantUtil.settings,
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.info),
                  tooltip: ConstantUtil.about,
                  onPressed: () {})
            ]),
        body: Container());
  }
}
