import 'package:myfluttercrypto/data/global_data.dart';
import 'package:myfluttercrypto/data/result_data.dart';
import 'package:encrypt/encrypt.dart';

class CryptoUtil {
  final iv = IV.fromLength(16);
  final String endKey = '__JesusS4lv@';
  dynamic key, encrypter;

  CryptoUtil() {
    key = Key.fromUtf8(GlobalData.keyWord + endKey);
    encrypter = Encrypter(AES(key, mode: AESMode.ofb64Gctr));
  }

  String txtEncrypt(String txt) {
    return encrypter.encrypt(txt, iv: iv).base64;
  }

  ResultData txtDecrypt(String txt) {
    ResultData result;
    try {
      result = ResultData(false,
          txt: encrypter.decrypt(Encrypted.from64(txt), iv: iv));
    } catch (ex) {
      print('Exception: ${ex.toString()}');
      result = ResultData(false);
    }
    return result;
  }
}
