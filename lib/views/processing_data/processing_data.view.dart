// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:stacked/stacked.dart';

import '../views.dart';

/// Es la vista que se usa para mostrar cuando se sincroniza la data.
/// Muestra un mensaje específico de carga  y descarga
///  recibe en su contructor: "title"
class ProcessingDataView extends StatelessWidget {
  
  
  const ProcessingDataView({
    Key? key,
    required this.title  
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProcessingDataViewModel>.reactive(
      viewModelBuilder: () => ProcessingDataViewModel( title ),
      builder: (
        BuildContext context,
        ProcessingDataViewModel model,
        Widget? child,
      ) {
        return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              child: LoadingBouncingGrid.square(
                backgroundColor: Color(0xFF2184c3),
              )),
          SizedBox(
            height: 30,
          ),
          Text(model.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Por Favor, espere...',
            style: TextStyle(fontSize: 15, color: Colors.black45),
          )
        ],
      ),
    );
      },
    );
  }
}

// '¡Cargando Datos!'