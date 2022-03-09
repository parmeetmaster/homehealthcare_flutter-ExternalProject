// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:health_home_care/views/patient_details/widgets/patient_details_card.widget.dart';
import 'package:health_home_care/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

import '../sign/e_sign.dart';
import '../views.dart';
//import 'registro_clinico.viewmodel.dart';

class RegistroClinicoView extends StatelessWidget {
  const RegistroClinicoView({
    Key? key,
    required this.scheduledItem,
    required this.actividadId,
    required this.ordenServicioId,
  }) : super(key: key);

  final ScheduleItem scheduledItem;
  final int actividadId;
  final int ordenServicioId;

  // final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistroClinicoViewModel>.reactive(
      viewModelBuilder: () =>

          /// parametros que viene desde la vista PatientDetailsView,
          /// por la ventana modal al verificar la identificación del paciente.
          RegistroClinicoViewModel(scheduledItem, actividadId, ordenServicioId),
      builder: (
        BuildContext context,
        RegistroClinicoViewModel registroClinicoViewModel,
        Widget? child,
      ) {
        final regCliModel = registroClinicoViewModel;
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              flexibleSpace: appbarGradientWidget(),
              leadingWidth: 40,
              leading: Image(
                image: AssetImage('assets/images/reg-clinico.png'),
              ),
              actions: [
                if (registroClinicoViewModel.isConnected)
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.signOutAlt),
                    onPressed: () async {
                      registroClinicoViewModel.isConnected =
                          await isConnectedToNetwork();
                      if (!registroClinicoViewModel.isConnected) {
                        NotificationProvider.warningMessageBar(
                            title: 'Advertencia',
                            message: 'Trabajando con Datos Offline');
                      } else {
                        registroClinicoViewModel.navigateToLoginView();
                        NotificationProvider.successMessageBar(
                            title: 'Operación Válida',
                            message: '¡Desconectado exitosamente!');
                      }
                    },
                  ),
                if (!registroClinicoViewModel.isConnected)
                  IconButton(
                    icon: const Icon(
                      Icons.wifi_off,
                      color: Colors.red,
                      size: 35.0,
                    ),
                    onPressed: () async {
                      registroClinicoViewModel.isConnected =
                          await isConnectedToNetwork();
                      if (registroClinicoViewModel.isConnected) {
                        NotificationProvider.successMessageBar(
                            title: 'Activación',
                            message: 'Conexión a datos restaurada');
                      }
                    },
                  ),
              ],
              title: Text(
                'Registro de Actividades (${regCliModel.actividadId})',
                style: TextStyle(fontSize: 14.0),
              )),
          drawer: MenuDrawerWidget(),
          body: regCliModel.isBusy
              ? ProcessingDataView(title: '¡Cargando Datos!')
              : regCliModel.forms.item.isNotEmpty
                  ? regCliModel.isSaving
                      ? ProcessingDataView(title: '¡Guardando Datos!')
                      : Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(height: 12),
                            PatientDetailsCardWidget(
                              nombrePaciente:
                                  regCliModel.scheduleItem.paciente.nombre,
                              identificacion: regCliModel
                                  .scheduleItem.paciente.identificacion,
                              fechaNacimiento: regCliModel
                                  .scheduleItem.paciente.fecha_nacimiento,
                              edad: regCliModel.scheduleItem.paciente.edad,
                              telefono:
                                  regCliModel.scheduleItem.paciente.telefono,
                              celular:
                                  regCliModel.scheduleItem.paciente.celular,
                              direccion:
                                  regCliModel.scheduleItem.paciente.direccion,
                              departamento: regCliModel
                                  .scheduleItem.paciente.departamento,
                              municipio:
                                  regCliModel.scheduleItem.paciente.municipio,
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Formularios Registro',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black45,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 15),
                            _FormulariosLista(

                                // formula list
                                registroClinicoViewModel:
                                    registroClinicoViewModel,),
                          ],
                        )
                  : Center(
                      child: Text(
                      'No Hay datos para cargar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2184c3),
                      ),
                    )),
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: Icon(
              FontAwesomeIcons.solidSave,
              size: 25.0,
            ),
            backgroundColor: Color(0xFF1aaf4d),
            tooltip: 'Guardar y Cerrar Actividad',
            onPressed: () async {
              await regCliModel.saveAndCloseActividad(
                  actividadId: registroClinicoViewModel.actividadId);

              /// mensaje respuesta cuando se guarda  el registro en la nube
              final saveAndCloseMsg = regCliModel.saveAndCloseMsg;

              /// mensaje cuando se guarda el registro localmente.
              final saveAndCloseLocalMsg = regCliModel.saveAndCloseLocalMsg;

              if (saveAndCloseMsg.containsKey('errorMsg')) {
                NotificationProvider.errorMessageBar(
                    title: 'Error',
                    message: regCliModel.saveAndCloseMsg['errorMsg']);
              }

              if (saveAndCloseMsg.containsKey('successMsg') ||
                  saveAndCloseLocalMsg) {
                NotificationProvider.successMessageBar(
                    title: 'Operación Válida',
                    message:
                        saveAndCloseMsg['successMsg'] ?? 'Guardado Localmente');

                /// Regresa a PatientDetailsView con los parámetros
                regCliModel.navigateToPatientDetailsView(
                    ordenServicioId: regCliModel.ordenServicioId,
                    scheduledItem: regCliModel.scheduleItem);
              }
            },
          ),
        );
      },
    );
  }
}

class _FormulariosLista extends StatelessWidget {
  _FormulariosLista({Key? key, required this.registroClinicoViewModel})
      : super(key: key);

  RegistroClinicoViewModel registroClinicoViewModel;

  @override
  Widget build(BuildContext context) {
    final registroClinico = registroClinicoViewModel;
    final formulariosServicios = registroClinicoViewModel.forms;

    return Expanded(
      child: ListView.builder(
          itemCount: formulariosServicios.item.length + 1,
          itemBuilder: (BuildContext context, int index) => index <
                  formulariosServicios.item.length
              ? GestureDetector(
                  onTap: () {
                    print('Formulario seleccionado: ');
                    print(
                        formulariosServicios.item.elementAt(index).json_syncro);

                    /// se obtiene el nombre del formulario a mostrar.
                    final formName =
                        formulariosServicios.item.elementAt(index).json_syncro;

                    /// Se navega con el nombre del formulario y el id de la actividad,
                    /// para abrir el formulario correspondiente.
                    registroClinico.navigateToForm(
                        formName: formName,
                        patient: registroClinico.scheduleItem,
                        actId: registroClinico.actividadId);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 3),
                        child: Icon(Icons.format_list_bulleted_sharp,
                            color: Color(0xFF2184c3), size: 32),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xFF1aaf4d),
                      ),
                      title: Text(
                          formulariosServicios.item
                              .elementAt(index)
                              .nombre_actividad,
                          style: TextStyle(fontSize: 17)),
                    ),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey.shade600, width: 0.5)),
                  ),
                )
              : Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => EsignScreen(registroClinico.actividadId.toString())));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Click to add Esign"),
                      decoration: BoxDecoration(color: Colors.green[200]),
                    ),
                  ),
                )),
    );
  }
}
