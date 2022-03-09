// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/models/models.dart';
import 'package:stacked/stacked.dart';

import '../../../../widgets/widgets.dart';
import '../../../views.dart';
import '../widgets/evolucion_terapia_fisica.widget.dart';

class EvolucionTerapiaFisicaView extends StatelessWidget {
  EvolucionTerapiaFisicaView({
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
    return ViewModelBuilder<EvolucionTerapiaFisicaViewModel>.reactive(
      viewModelBuilder: () =>
          EvolucionTerapiaFisicaViewModel(patient, actividadId, jsonSyncro),
      builder: (
        BuildContext context,
        EvolucionTerapiaFisicaViewModel evolucionTerapiaFisicaModel,
        Widget? child,
      ) {
        final paciente = evolucionTerapiaFisicaModel.patient.paciente;        

        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: appbarGradientWidget(),
              leadingWidth: 40,
              leading: Image(
                image: AssetImage('assets/images/reg-clinico.png'),
              ),
              actions: [
                
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.angleLeft, size: 30.0,),
                    onPressed: () {
                      evolucionTerapiaFisicaModel.navigateToBack();
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
                  'Evolución Terapia Física',
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
                        EvolucionTerapiaFisicaFormWidget(
                            eTerapiaFisicaForm: evolucionTerapiaFisicaModel)
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
