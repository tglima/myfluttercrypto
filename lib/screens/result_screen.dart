import 'package:flutter/material.dart';
import 'package:myfluttercrypto/utils/constant_util.dart';
import 'package:myfluttercrypto/utils/enum_util.dart';
import 'package:myfluttercrypto/utils/wdg_util.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatelessWidget {
  final String txtResult;
  final String txtTitle;
  const ResultScreen(this.txtTitle, this.txtResult, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _copyToClipboard() async {
      await Clipboard.setData(ClipboardData(text: txtResult));

      WdgUtil.buildDialog(
          context, TypeDialog.success, ConstantUtil.txtCopiedSuccessfully);
    }

    Flexible _flexResultInputTxt = Flexible(
        child: Container(
            constraints:
                const BoxConstraints(maxWidth: ConstantUtil.maxWidthBox),
            padding: const EdgeInsets.only(top: ConstantUtil.defaultPadTop),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(text: txtResult),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              minLines: 8,
              maxLines: 16,
              toolbarOptions:
                  const ToolbarOptions(copy: false, selectAll: false),
            )));

    Row _rowTitle = WdgUtil.buildRow(Padding(
        padding: ConstantUtil.edgeInsetsTopZero,
        child: RichText(
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: txtTitle,
                  style: TextStyle(
                      height: ConstantUtil.lineHeightDefault,
                      fontWeight: FontWeight.bold,
                      color: ConstantUtil.colorThemeApp))
            ]))));

    Row _rowTxtBtnCopy = WdgUtil.buildRow(ButtonBar(
        buttonPadding: const EdgeInsets.all(16),
        overflowButtonSpacing: 16,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          WdgUtil.buildTxtButton(
              context, ConstantUtil.copyTxt, _copyToClipboard)
        ]));

    return WdgUtil.buildScaffold(
        context,
        WdgUtil.buildAppBar(context, ConstantUtil.txtResult),
        <Widget>[_rowTitle, _flexResultInputTxt, _rowTxtBtnCopy]);
  }
}
