import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../views.dart';

class ValoracionTerapiaFisicaView extends StatelessWidget {
  const ValoracionTerapiaFisicaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<ValoracionTerapiaFisicaViewModel>.reactive(
      viewModelBuilder: () => ValoracionTerapiaFisicaViewModel(),
      builder: (
        BuildContext context,
        ValoracionTerapiaFisicaViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
          child: Text(
              'TerapiaFisicaValoracionView',
            ),
          ),
        );
      },
    );
  }
}