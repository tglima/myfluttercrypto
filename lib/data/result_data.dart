class ResultData {
  String _txt = '';
  bool _hasError = true;

  ResultData(bool hasError, {String txt = ''}) {
    this._txt = txt;
    this._hasError = hasError;
  }

  resultTxt() {
    return this._txt;
  }

  resultHasError() {
    return this._hasError;
  }
}
