import 'package:flutter/material.dart';

class ConstantUtil {
  //Texts
  static const String nmApplication = 'MyFlutterCrypto';
  static const String settings = 'Configurações';
  static const String about = 'Sobre';
  static const String copyright = 'Copyright';
  static const String txtCopyright = ': Copyright © 2021 Thiago Lima de Sousa.';
  static const String visit = 'Visite';
  static const String linkGitHub = 'https://github.com/tglima/myfluttercrypto';
  static const String version = 'Versão';
  static const String license = 'Licença';
  static const String twoPoints = ': ';
  static const String txtLicense =
      ': O código fonte desta aplicação está sob Licença MIT, todo o restante deve ser considerado conteúdo registrado dos seus respectivos proprietários e desenvolvedores.';
  static final String txtInfoKeyWord =
      'Abaixo está a palavra chave utilizada para criptografar e descriptograr os textos, ela deve conter ${lengthKeyWord.toString()} carateres. Quanto mais complexa ela for, melhor será! ';
  static const String txtKeyWordReset =
      'Sempre que o aplicativo é fechado a palavra chave retorna para o seu valor padrão. ';
  static const String txtKeyWordWarning =
      'Sem a palavra chave correta não será possível descriptografar o texto!';
  static const String save = 'Salvar';
  static const String errTxtIsEmpty = 'O texto informado está vazio!';
  static const String errTxtInvalid = 'O texto informado é inválido!';
  static const String inputYourText =
      'Informe um texto abaixo e clique no botão correspondente a sua escolha';
  static const String errDecryptTxt =
      'Ocorreu um erro e não foi possível descriptografar o texto informado!';
  static const String sucKeyWordSaved = 'Nova palavra passe salva com sucesso!';
  static const String errOpenSite =
      'Ocorreu um erro e não foi possível abri o site: ';
  static const String alert = 'Alerta';
  static const String error = 'Erro';
  static const String success = "Sucesso";
  static const String close = "Fechar";
  static const String txtEncrypt = 'Criptografar';
  static const String txtDecrypt = 'Descriptografar';
  static const String titleEncrypt = 'Texto Criptografado';
  static const String titleDecrypt = 'Texto Descriptografado';
  static const String txtResult = 'Resultado';
  static const String copyTxt = 'Copiar Texto';
  static const String clearTxt = 'Limpar Texto';
  static const String txtCopiedSuccessfully = 'Texto copiado com sucesso!';

  //Colors
  static final Color colorThemeApp = Colors.indigo.shade500;
  static final Color colorTxtUrl = Colors.indigo;
  static final Color colorRed = Colors.redAccent.shade700;
  static final Color colorTxtDefault = Colors.black87;
  static final Color colorWhite = Colors.white;
  static final Color colorAlert = Colors.yellow.shade600;
  static final Color colorSuccess = Colors.green.shade800;
  static final Color colorSilver = Colors.grey.shade600;

  //EdgeInsetsGeometry
  static const EdgeInsetsGeometry edgeInsetsDefault =
      EdgeInsets.fromLTRB(16, 8, 16, 8);

  static const EdgeInsetsGeometry edgeInsetsTopZero =
      EdgeInsets.fromLTRB(16, 0, 16, 8);

  static const EdgeInsetsGeometry padTxtBtnDefault =
      EdgeInsets.fromLTRB(40, 16, 40, 16);

  //Others
  static const double lineHeightDefault = 1.5;
  static final TextStyle textStyleDefault = TextStyle(
      height: ConstantUtil.lineHeightDefault,
      color: ConstantUtil.colorTxtDefault);
  static const double defaultPadTop = 20;
  static const double maxWidthBox = 475;
  static const double maxHeightBox = 350;
  static const int lengthKeyWord = 20;
}
