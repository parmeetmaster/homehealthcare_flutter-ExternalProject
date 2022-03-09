// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:intl/intl.dart';

import '../../../../app/core/ui/input_decorations.dart';
import '../../../views.dart';


class ValoracionTerapiaRespiratoriaFormWidget extends StatefulWidget {
  
  ValoracionTerapiaRespiratoriaFormWidget({
    Key? key, 
    required this.vTerapiaRespiratoriaForm
  }) : super(key: key);

  ValoracionTerapiaRespiratoriaViewModel vTerapiaRespiratoriaForm;

  @override
  State<ValoracionTerapiaRespiratoriaFormWidget> createState() =>  _ValoracionTerapiaRespiratoriaFormWidgetState();
}

class _ValoracionTerapiaRespiratoriaFormWidgetState extends State<ValoracionTerapiaRespiratoriaFormWidget> {
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
    final vTerapiaRespiratoriaForm = widget.vTerapiaRespiratoriaForm;

    return Form(
      key: vTerapiaRespiratoriaForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          DateTimePicker(
            type : DateTimePickerType.dateTimeSeparate,
            style: TextStyle(
              fontSize     : 18.0,
              letterSpacing: 1.0,
            ),
            dateMask: 'yyyy-MM-d',
            controller: _fechaHoraController,
            firstDate: hrs48FromNow,
            lastDate: DateTime.now(),
            icon: Icon(
              Icons.event,
              color: Color(0xFF2184c3),
            ),
            dateLabelText: 'Fecha',
            timeLabelText: 'Hora',
            locale: const Locale('es', 'ES'),
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Fecha - Hora';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: null,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'Ingreso descripción sobre la tos',
                labelText: 'Tos',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.tos = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese una descripción';
            },
            
          ),
          SizedBox(height: 15),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: null,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'Ingrese descripción expectoración',
                labelText: 'Expectoración',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.expectoracion = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese Descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción disnea',
                labelText : 'Disnea',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.disnea = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción SPO',
                labelText : 'SPO',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.spo = value,
            
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción oxigenoterapia',
                labelText : 'Oxigenoterapia',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.oxigenoterapia = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción SDR',
                labelText : 'SDR',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.sdr = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción patrón respiratorio',
                labelText : 'Patrón respiratorio',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.patron_respiratorio = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción tipo torax',
                labelText : 'Tipo Torax',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.tipo_torax = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción expansibilidad toracica',
                labelText : 'Expansibilidad Toracica',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.expansibilidad_toracica = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción distensibilidad toracica',
                labelText : 'Distensibilidad Toracica',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.distensibilidad_toracica = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción auscultacion',
                labelText : 'Auscultacion',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.auscultacion = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
          ),
          SizedBox(height: 15),

          TextFormField(
            autocorrect : false,
            keyboardType: TextInputType.multiline,
            minLines    : 2,
            maxLines    : null,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : 'Ingrese descripción plan de manejo',
                labelText : 'Plan de Manejo',
                prefixIcon: Icons.note_alt_rounded),
            onChanged: (value) => vTerapiaRespiratoriaForm.plandemanejo = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese descripción';
            },
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
                          vTerapiaRespiratoriaForm.isLoading
                              ? 'Espere, Guardando...'
                              : 'GUARDAR',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  onPressed: vTerapiaRespiratoriaForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (!vTerapiaRespiratoriaForm.validationFormPassed()) return;
                          
                          vTerapiaRespiratoriaForm.isLoading = true;
                        
                          await vTerapiaRespiratoriaForm.saveVTerapiaRespiratoriaForm(
                            actividadID             : vTerapiaRespiratoriaForm.actividadId,
                            fechaHora               : vTerapiaRespiratoriaForm.fechaHora = fechaHora + ':00',
                            tos                     : vTerapiaRespiratoriaForm.tos,
                            expectoracion           : vTerapiaRespiratoriaForm.expectoracion,
                            disnea                  : vTerapiaRespiratoriaForm.disnea,
                            spo                     : vTerapiaRespiratoriaForm.spo,
                            oxigenoterapia          : vTerapiaRespiratoriaForm.oxigenoterapia,
                            sdr                     : vTerapiaRespiratoriaForm.sdr,
                            patron_respiratorio     : vTerapiaRespiratoriaForm.patron_respiratorio,
                            tipo_torax              : vTerapiaRespiratoriaForm.tipo_torax,
                            expansibilidad_toracica : vTerapiaRespiratoriaForm.expansibilidad_toracica,
                            distensibilidad_toracica: vTerapiaRespiratoriaForm.distensibilidad_toracica,
                            auscultacion            : vTerapiaRespiratoriaForm.auscultacion,
                            plandemanejo            : vTerapiaRespiratoriaForm.plandemanejo,

                          );

                          final msgLocal  = vTerapiaRespiratoriaForm.savedToLocalMsg;
                          final msgRemote = vTerapiaRespiratoriaForm.savedToRemoteMsg;

                          if ( msgRemote.containsKey('errorMsg') ) {
                            NotificationProvider.warningMessageBar( title: 'Advertencia', message: msgRemote['errorMsg']);                         
                          }
                          if ( msgLocal == 0) {
                            NotificationProvider.warningMessageBar( title: 'Advertencia', message: 'Ya esta guardado Localmente.');
                          }
                          if (msgRemote.containsKey('successMsg') || msgLocal > 0) {
                            NotificationProvider.successMessageBar(
                                title: 'Operación Válida',
                                message: msgRemote['successMsg'] ??
                                    'Guardado Localmente');
                          }
                            vTerapiaRespiratoriaForm.isLoading = false;                            


                          vTerapiaRespiratoriaForm.navigateToBack();
                        }),
            ],
          ),
        ],
      ),
    );
  }
}
