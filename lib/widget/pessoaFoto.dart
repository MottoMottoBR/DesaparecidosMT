import 'package:flutter/material.dart';

import '../ultis/app_styles.dart';
import '../ultis/strings.dart';

var pessoaFoto = FittedBox(
  fit: BoxFit.contain,
  child: Text(
    StringTxT.textoDesaparecido.toUpperCase(),
    //Style Personalizado
    style: AppStyles.textoDesaparecidoStyle,
  ),
);
