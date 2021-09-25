class ResultData {
  String _txt = '';
  bool _hasError = true;

  ResultData(bool hasError, {String txt = ''}) {
    _txt = txt;
    _hasError = hasError;
  }

  resultTxt() {
    return _txt;
  }

  resultHasError() {
    return _hasError;
  }
}
