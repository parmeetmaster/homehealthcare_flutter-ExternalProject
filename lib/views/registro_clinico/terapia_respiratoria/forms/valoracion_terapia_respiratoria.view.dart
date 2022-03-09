// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/views/registro_clinico/terapia_respiratoria/widgets/valoracion_terapia_respiratoria.widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../widgets/widgets.dart';
import '../../../views.dart';

class ValoracionTerapiaRespiratoriaView extends StatelessWidget {
  ValoracionTerapiaRespiratoriaView({
        Key? key, 
        required this.patient, 
        required this.actividadId,
        required this.jsonSyncro
  }) : super(key: key);

  ScheduleItem patient;
  int actividadId;
  String jsonSyncro;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ValoracionTerapiaRespiratoriaViewModel>.reactive(
      viewModelBuilder: () =>
          ValoracionTerapiaRespiratoriaViewModel(patient, actividadId, jsonSyncro),
      builder: (
        BuildContext context,
        ValoracionTerapiaRespiratoriaViewModel valoracionTerapiaRespiratoriaModel,
        Widget? child,
      ) {
        final paciente = valoracionTerapiaRespiratoriaModel.patient.paciente;
        
        return Scaffold(
            appBar: AppBar(
              elevation    : 0,
              flexibleSpace: appbarGradientWidget(),
              leadingWidth : 40,
              leading      : Image(
                image: AssetImage('assets/images/reg-clinico.png'),
              ),
              actions: [
                
                  IconButton(
                    icon     : const Icon(FontAwesomeIcons.angleLeft, size: 30.0,),
                    onPressed: () {
                      valoracionTerapiaRespiratoriaModel.navigateToBack();
                    },
                  ),
               
              ],
              title: Text(
                '${paciente.primer_nombre} ${paciente.primer_apellido} (${paciente.identificacion})',
                style: TextStyle(fontSize: 14),
              ),
            ),
            drawer: MenuDrawerWidget(),
            body: Column(
              children: [
                SizedBox(height: 15.0),
                Text(
                  'Valoracion Terapia Respiratoria',
                  style: TextStyle(
                      fontSize     : 18.5,
                      color        : Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight   : FontWeight.w400),
                ),
                SizedBox(height: 15.0),

                Expanded(
                  child: FormContainerWidget(
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        ValoracionTerapiaRespiratoriaFormWidget(
                            vTerapiaRespiratoriaForm: valoracionTerapiaRespiratoriaModel)
                      ],
                    )),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
