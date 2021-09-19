import 'package:myfluttercrypto/data/result_data.dart';

class CryptoUtil {
  ResultData txtDecrypt(String txt) {
    return ResultData(false, txt: txt);
  }

  String txtEncrypt(String txt) {
    return txt;
  }
}
