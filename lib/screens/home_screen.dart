import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfluttercrypto/data/result_data.dart';
import 'package:myfluttercrypto/screens/result_screen.dart';
import 'package:myfluttercrypto/screens/settings_screen.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/crypto_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controllerTxtInput = TextEditingController();
  final CryptoUtil _cryptoUtil = CryptoUtil();
  @override
  Widget build(BuildContext context) {
    void _goToSettings() {
      WdgUtil.goToScreen(context: context, screen: const SettingsScreen());
    }

    void _goToAbout() {
      WdgUtil.goToScreen(context: context, screen: const AboutScreen());
    }

    bool _valTxtIsEmpty() {
      if (_controllerTxtInput.text.isEmpty) {
        WdgUtil.buildDialog(context, TypeDialog.error,
            AppLocalizations.of(context)!.errTxtIsEmpty);
        return false;
      }
      return true;
    }

    void _encryptText() {
      if (!_valTxtIsEmpty()) {
        return;
      }

      WdgUtil.goToScreen(
          context: context,
          screen: ResultScreen(AppLocalizations.of(context)!.titleEncrypt,
              _cryptoUtil.txtEncrypt(_controllerTxtInput.text)));
    }

    void _decryptText() {
      if (!_valTxtIsEmpty()) {
        return;
      }

      ResultData resultData =
          _cryptoUtil.txtDecrypt(_controllerTxtInput.text.trim());
      if (resultData.resultHasError()) {
        WdgUtil.buildDialog(context, TypeDialog.error,
            AppLocalizations.of(context)!.errDecryptTxt);
        return;
      }

      WdgUtil.goToScreen(
          context: context,
          screen: ResultScreen(AppLocalizations.of(context)!.titleDecrypt,
              resultData.resultTxt()));
    }

    void _clearInputText() {
      setState(() {
        _controllerTxtInput.text = '';
      });
    }

    Row _rowTxtInfoInput = WdgUtil.buildRow(RichText(
        textAlign: TextAlign.center,
        textScaleFactor: 1.2,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: AppLocalizations.of(context)!.inputYourText,
              style: TextStyle(
                  height: ConstantUtil.lineHeightDefault,
                  color: ConstantUtil.colorTxtDefault))
        ])));

    Flexible _flexInputTxt = Flexible(
        flex: 0,
        fit: FlexFit.tight,
        child: Container(
            constraints:
                BoxConstraints(maxWidth: ConstantUtil.maxWidthBox(context)),
            padding: EdgeInsets.only(top: ConstantUtil.defaultPadTop()),
            child: TextField(
              controller: _controllerTxtInput,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              minLines: 8,
              maxLines: 16,
              toolbarOptions: const ToolbarOptions(copy: false, paste: true),
            )));

    Row _rowTxtBtns = WdgUtil.buildRow(ButtonBar(
        buttonPadding: const EdgeInsets.all(16),
        overflowButtonSpacing: 16,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          WdgUtil.buildTxtButton(
              context, AppLocalizations.of(context)!.txtEncrypt, _encryptText),
          WdgUtil.buildTxtButton(
              context, AppLocalizations.of(context)!.clearTxt, _clearInputText,
              bkgColorBtn: ConstantUtil.colorSilver),
          WdgUtil.buildTxtButton(
              context, AppLocalizations.of(context)!.txtDecrypt, _decryptText,
              bkgColorBtn: ConstantUtil.colorAlert,
              txtColorBtn: ConstantUtil.colorTxtDefault)
        ]));

    AppBar _buildAppBar = AppBar(
        backgroundColor: ConstantUtil.colorThemeApp,
        title: const Text(ConstantUtil.nmApplication),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings),
              tooltip: AppLocalizations.of(context)?.settings,
              onPressed: _goToSettings),
          IconButton(
              icon: const Icon(Icons.info),
              tooltip: AppLocalizations.of(context)?.about,
              onPressed: _goToAbout)
        ]);

    return WdgUtil.buildScaffold(
        context, _buildAppBar, [_rowTxtInfoInput, _flexInputTxt, _rowTxtBtns]);
  }
}
