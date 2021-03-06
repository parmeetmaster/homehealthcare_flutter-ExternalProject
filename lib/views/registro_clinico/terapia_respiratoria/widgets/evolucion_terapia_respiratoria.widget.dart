// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:intl/intl.dart';

import '../../../../app/core/ui/input_decorations.dart';
import '../../../views.dart';
//import 'package:provider/provider.dart';

class EvolucionTerapiaRespiratoriaFormWidget extends StatefulWidget {
  
  EvolucionTerapiaRespiratoriaFormWidget({
    Key? key, 
    required this.eTerapiaRespiratoriaForm
  }) : super(key: key);

  EvolucionTerapiaRespiratoriaViewModel eTerapiaRespiratoriaForm;

  @override
  State<EvolucionTerapiaRespiratoriaFormWidget> createState() => _EvolucionTerapiaRespiratoriaFormWidgetState();
}

class _EvolucionTerapiaRespiratoriaFormWidgetState extends State<EvolucionTerapiaRespiratoriaFormWidget> {

  late TextEditingController _fechaHoraController;
  String fechaHora = DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _fechaHoraController = TextEditingController(text: DateTime.now().toString());
    _fechaHoraController.addListener(_horaFechaToSave);
  }

  @override
  void dispose() {
    _fechaHoraController.dispose();
    super.dispose();
  }

  void _horaFechaToSave() {
    fechaHora = _fechaHoraController.text;
  }

  @override
  Widget build(BuildContext context) {

    final _myBlueColor             = Color(0xFF2184c3);
    var   now                      = DateTime.now();
    var   hrs48FromNow             = now.subtract(const Duration(days: 2));
    final eTerapiaRespiratoriaForm = widget.eTerapiaRespiratoriaForm;

    return Form(
      key: eTerapiaRespiratoriaForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            style: TextStyle(
              fontSize     : 18.0,
              letterSpacing: 1.0,
            ),

            dateMask  : 'yyyy-MM-d',
            controller: _fechaHoraController,
            firstDate : hrs48FromNow,
            lastDate  : DateTime.now(),
            icon      : Icon(
              Icons.event,
              color: Color(0xFF2184c3),
            ),
            dateLabelText: 'Fecha',
            timeLabelText: 'Hora',
            locale       : const Locale('es', 'ES'),
            validator    : (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Fecha - Hora';
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingreso el Objetivo',
                labelText : 'Objetivo',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => eTerapiaRespiratoriaForm.objetivo = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Objetivo';
            },
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 15),
          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese el tratamiento',
                labelText : 'Tratamiento',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => eTerapiaRespiratoriaForm.tratamiento = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Tratamiento';
            },
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 15),
          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese la respuesta',
                labelText : 'Respuesta',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => eTerapiaRespiratoriaForm.respuesta = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Respuesta';
            },
            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 15),
          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese la observaci??n',
                labelText : 'Observaci??n',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => eTerapiaRespiratoriaForm.observacion = value,
            
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: _myBlueColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: Center(
                      child: Text(
                          eTerapiaRespiratoriaForm.isLoading
                              ? 'Espere, Guardando...'
                              : 'GUARDAR',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  onPressed: eTerapiaRespiratoriaForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (!eTerapiaRespiratoriaForm.validationFormPassed()) return;
                          
                          eTerapiaRespiratoriaForm.isLoading = true;
                        
                          await eTerapiaRespiratoriaForm.saveETerapiaRespiratoriaForm(
                            actividadID: eTerapiaRespiratoriaForm.actividadId,
                            fechaHora  : eTerapiaRespiratoriaForm.fechaHora = fechaHora + ':00',
                            tratamiento: eTerapiaRespiratoriaForm.tratamiento,
                            respuesta  : eTerapiaRespiratoriaForm.respuesta,
                            objetivo   : eTerapiaRespiratoriaForm.objetivo,
                            observacion: eTerapiaRespiratoriaForm.observacion,
                          );

                          final msgLocal  = eTerapiaRespiratoriaForm.savedToLocalMsg;
                          final msgRemote = eTerapiaRespiratoriaForm.savedToRemoteMsg;

                          if ( msgRemote.containsKey('errorMsg') ) {
                            NotificationProvider.warningMessageBar( title: 'Advertencia', message: msgRemote['errorMsg']);                         
                          }
                          if ( msgLocal == 0) {
                            NotificationProvider.warningMessageBar( title: 'Advertencia', message: 'Ya esta guardado Localmente.');
                          }
                          if (msgRemote.containsKey('successMsg') || msgLocal > 0) {
                            NotificationProvider.successMessageBar(
                                title: 'Operaci??n V??lida',
                                message: msgRemote['successMsg'] ??
                                    'Guardado Localmente');
                          }
                            eTerapiaRespiratoriaForm.isLoading = false;  

                          eTerapiaRespiratoriaForm.navigateToBack();
                        }),
            ],
          ),
        ],
      ),
    );
  }
}
