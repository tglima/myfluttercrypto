import 'package:flutter/material.dart';
import 'package:myfluttercrypto/data/global_data.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTxtInput = TextEditingController();
    setState(() {
      _controllerTxtInput.text = GlobalData.keyWord;
    });

    _saveSettings() {
      if (_controllerTxtInput.text.trim().length == 0) {
        print(ConstantUtil.errTxtIsEmpty);
        return;
      }

      if (_controllerTxtInput.text.trim().length < 35) {
        print(ConstantUtil.errTxtInvalid);
        return;
      }

      print(_controllerTxtInput.text + ' ' + ConstantUtil.sucKeyWordSaved);
    }

    Row _rowTxtInfo = WdgUtil.buildRow(RichText(
        textAlign: TextAlign.justify,
        textScaleFactor: 1.2,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: ConstantUtil.txtInfoKeyWord + ConstantUtil.txtKeyWordReset,
              style: TextStyle(
                  height: ConstantUtil.lineHeightDefault,
                  color: ConstantUtil.colorTxtDefault)),
          TextSpan(
              text: ConstantUtil.txtKeyWordWarning,
              style: TextStyle(
                  height: ConstantUtil.lineHeightDefault,
                  fontWeight: FontWeight.bold,
                  color: ConstantUtil.colorTxtRed))
        ])));

    Flexible _flexInputText = Flexible(
        child: Container(
            constraints: BoxConstraints(maxWidth: 550),
            padding: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _controllerTxtInput,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              maxLength: 50,
              maxLines: 1,
              toolbarOptions: ToolbarOptions(copy: false, selectAll: false),
            )));

    Row _rowTxtBtnSave = WdgUtil.buildRow(ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          WdgUtil.buildTxtButton(context, ConstantUtil.save, _saveSettings)
        ]));

    List<Widget> _wdgsSettingsScreen = <Widget>[
      _rowTxtInfo,
      _flexInputText,
      _rowTxtBtnSave
    ];

    return WdgUtil.buildScaffold(
        context,
        WdgUtil.buildAppBar(context, ConstantUtil.settings),
        _wdgsSettingsScreen);
  }
}
