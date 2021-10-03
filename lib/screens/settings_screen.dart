import 'package:flutter/material.dart';
import 'package:myfluttercrypto/data/global_data.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _controllerTxtInput = TextEditingController();

  @override
  initState() {
    super.initState();
    setState(() {
      _controllerTxtInput.text = GlobalData.keyWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    _saveSettings() {
      if (_controllerTxtInput.text.trim().length < ConstantUtil.lengthKeyWord) {
        WdgUtil.buildDialog(context, TypeDialog.error,
            AppLocalizations.of(context)!.errTxtInvalid);
        return;
      }

      WdgUtil.buildDialog(context, TypeDialog.success,
          AppLocalizations.of(context)!.sucKeyWordSaved);

      setState(() {
        GlobalData.keyWord = _controllerTxtInput.text;
      });
    }

    Row _rowTxtInfo = WdgUtil.buildRow(Container(
        padding: ConstantUtil.edgeInsetsTopZero,
        child: RichText(
            textAlign: TextAlign.justify,
            textScaleFactor: 1.2,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)!
                          .txtInfoKeyWord(ConstantUtil.lengthKeyWord) +
                      AppLocalizations.of(context)!.txtKeyWordReset,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      color: ConstantUtil.colorTxtDefault)),
              TextSpan(
                  text: AppLocalizations.of(context)!.txtKeyWordWarning,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorRed))
            ]))));

    Flexible _flexInputText = Flexible(
        flex: 0,
        fit: FlexFit.tight,
        child: Container(
            constraints:
                BoxConstraints(maxWidth: ConstantUtil.maxWidthBox(context)),
            padding: EdgeInsets.only(top: ConstantUtil.defaultPadTop()),
            child: TextField(
              controller: _controllerTxtInput,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              maxLength: ConstantUtil.lengthKeyWord,
              maxLines: 1,
              toolbarOptions:
                  const ToolbarOptions(copy: false, selectAll: false),
            )));

    Row _rowTxtBtnSave = WdgUtil.buildRow(
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
      WdgUtil.buildTxtButton(
          context, AppLocalizations.of(context)!.save, _saveSettings)
    ]));

    return WdgUtil.buildScaffold(
        context,
        WdgUtil.buildAppBar(context, AppLocalizations.of(context)!.settings),
        <Widget>[_rowTxtInfo, _flexInputText, _rowTxtBtnSave]);
  }
}
