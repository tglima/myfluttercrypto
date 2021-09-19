import 'package:flutter/material.dart';

class ConstantUtil {
  //Texts
  static final String nmApplication = 'MyFlutterCrypto';
  static final String settings = 'Configurações';
  static final String about = 'Sobre';
  static final String copyright = 'Copyright';
  static final String txtCopyright = ': Copyright © 2021 Thiago Lima de Sousa.';
  static final String visit = 'Visite';
  static final String linkGitHub = 'https://github.com/tglima/myfluttercrypto';
  static final String version = 'Versão';
  static final String license = 'Licença';
  static final String twoPoints = ':';
  static final String txtLicense =
      ': O código fonte desta aplicação está sob Licença MIT, todo o restante deve ser considerado conteúdo registrado dos seus respectivos proprietários e desenvolvedores.';
  static final String txtInfoKeyWord =
      'Abaixo está a palavra chave utilizada para criptografar e descriptograr os textos, ela deve conter no mínimo ${minLengthKeyWord.toString()} carateres e no máximo ${maxLengthKeyWord.toString()}. ';
  static final String txtKeyWordReset =
      'Sempre que o aplicativo é fechado a palavra chave retorna para o seu valor padrão. ';
  static final String txtKeyWordWarning =
      'Sem a palavra chave correta não será possível descriptografar o texto!';
  static final String save = 'Salvar';
  static final String errTxtIsEmpty = 'O texto informado está vazio!';
  static final String errTxtInvalid = 'O texto informado é inválido!';
  static final String inputYourText =
      'Informe um texto abaixo e clique no botão correspondente a sua escolha';
  static final String errDecryptTxt =
      'Ocorreu um erro e não foi possível descriptografar o texto informado!';
  static final String sucKeyWordSaved = 'Nova palavra passe salva com sucesso!';
  static final String errOpenSite =
      'Ocorreu um erro e não foi possível abri o site: ';
  static final String alert = 'Alerta';
  static final String error = 'Erro';
  static final String success = "Sucesso";
  static final String close = "Fechar";
  static final String txtEncrypt = 'Criptografar';
  static final String txtDecrypt = 'Descriptografar';
  static final String titleEncrypt = 'Texto Criptografado';
  static final String titleDecrypt = 'Texto Descriptografado';
  static final String txtResult = 'Resultado';
  static final String copyTxt = 'Copiar Texto';
  static final String txtCopiedSuccessfully = 'Texto copiado com sucesso!';

  //Colors
  static final Color colorThemeApp = Colors.indigo.shade500;
  static final Color colorTxtUrl = Colors.indigo;
  static final Color colorRed = Colors.redAccent.shade700;
  static final Color colorTxtDefault = Colors.black87;
  static final Color colorWhite = Colors.white;
  static final Color colorAlert = Colors.yellow.shade600;
  static final Color colorSuccess = Colors.green.shade800;

  //EdgeInsetsGeometry
  static final EdgeInsetsGeometry edgeInsetsDefault =
      EdgeInsets.fromLTRB(16, 8, 16, 8);

  static final EdgeInsetsGeometry edgeInsetsTopZero =
      EdgeInsets.fromLTRB(16, 0, 16, 8);

  static final EdgeInsetsGeometry padTxtBtnDefault =
      EdgeInsets.fromLTRB(40, 16, 40, 16);

  //Others
  static final double lineHeightDefault = 1.5;
  static final TextStyle textStyleDefault = TextStyle(
      height: ConstantUtil.lineHeightDefault,
      color: ConstantUtil.colorTxtDefault);
  static final double defaultPadTop = 20;
  static final double maxWidthBox = 475;
  static final double maxHeightBox = 350;
  static final int maxLengthKeyWord = 50;
  static final int minLengthKeyWord = 35;
  //Temp
  static final String nuVersion = ': 0.0.0+1';
}
