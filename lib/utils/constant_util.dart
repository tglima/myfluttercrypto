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
      'Abaixo está a palavra chave utilizada para criptografar e descriptograr os textos, ela deve conter no mínimo 35 carateres e no máximo 50. ';
  static final String txtKeyWordReset =
      'Sempre que o aplicativo é fechado a palavra chave retorna para o seu valor padrão. ';
  static final String txtKeyWordWarning =
      'Sem a palavra chave correta não será possível descriptografar o texto!';

  //Colors
  static final colorThemeApp = Colors.indigo[500];
  static final colorTxtUrl = Colors.indigo;
  static final colorTxtRed = Colors.redAccent[700];
  static final Color colorTxtDefault = Colors.black87;

  //EdgeInsetsGeometry
  static final EdgeInsetsGeometry edgeInsetsDefault =
      EdgeInsets.fromLTRB(16, 8, 16, 8);

  static final EdgeInsetsGeometry edgeInsetsTopZero =
      EdgeInsets.fromLTRB(16, 0, 16, 8);

  //Others
  static final double lineHeightDefault = 1.5;
  static final TextStyle textStyleDefault = TextStyle(
      height: ConstantUtil.lineHeightDefault,
      color: ConstantUtil.colorTxtDefault);

  //Temp
  static final String nuVersion = ': 0.0.0+1';
}
