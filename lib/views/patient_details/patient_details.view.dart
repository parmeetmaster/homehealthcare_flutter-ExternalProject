// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/app/app.locator.dart';
import 'package:health_home_care/app/app.router.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:health_home_care/app/core/ui/input_decorations.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:health_home_care/views/patient_details/widgets/patient_details_card.widget.dart';
import 'package:health_home_care/views/views.dart';
import 'package:health_home_care/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientDetailsView extends StatelessWidget {

  const PatientDetailsView({
      Key? key, 
      required this.ordenServicioId, 
      required this.scheduledItem, 
   }) : super(key: key);

  final int ordenServicioId;
  final ScheduleItem scheduledItem;

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<PatientDetailsViewModel>.reactive(
      viewModelBuilder: () =>
      // Argumentos que recibe en el constructor viene desde HomeView
      PatientDetailsViewModel(ordenServicioId, scheduledItem),
      builder: ( context, patientDetailsModel, child ) =>
          Scaffold(
        appBar: AppBar(
            elevation    : 0,
            flexibleSpace: appbarGradientWidget(),
            leadingWidth : 50,
            leading      : const Icon(
              Icons.calendar_today_outlined,
              size: 35,
            ),
            actions: [

                if( patientDetailsModel.isConnected )
              IconButton(
                icon: 
                  const Icon(FontAwesomeIcons.signOutAlt),
                  onPressed: () async {  

                    patientDetailsModel.isConnected = await isConnectedToNetwork();
                    
                    if ( !patientDetailsModel.isConnected ) {
                      NotificationProvider.warningMessageBar( title: 'Advertencia', message: 'Trabajando con Datos Offline' );
                    } else {
                       patientDetailsModel.navigateToLoginView();
                      NotificationProvider.successMessageBar( title: 'Operación Válida', message: '¡Desconectado exitosamente!' );
                    }
                    
                  },
                ),

             if( !patientDetailsModel.isConnected )
              IconButton(
                icon: 
                  const Icon( Icons.wifi_off , color: Colors.red, size: 35.0,),
                  onPressed: () async {
                    
                      patientDetailsModel.isConnected = await isConnectedToNetwork();
                      

                 
                  },
                ),


            ],
            title: const Text(
              'Detalles del Paciente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        drawer: const MenuDrawerWidget(),
        body: patientDetailsModel.isBusy
            ? const ProcessingDataView( title: '¡Cargando Datos!')
            : patientDetailsModel.activities.item.isNotEmpty
                ? Column(
                    children: [
                      PatientDetailsCardWidget(
                          nombrePaciente: patientDetailsModel.scheduleItem.paciente.nombre,
                          identificacion: patientDetailsModel.scheduleItem.paciente.identificacion,
                          telefono      : patientDetailsModel.scheduleItem.paciente.telefono,
                          celular       : patientDetailsModel.scheduleItem.paciente.celular,
                          direccion     : patientDetailsModel.scheduleItem.paciente.direccion,
                          departamento  : patientDetailsModel.scheduleItem.paciente.departamento,
                          municipio     : patientDetailsModel.scheduleItem.paciente.municipio,
                          ordenTrabajo  : patientDetailsModel.scheduleItem.ordentrabajo_id,
                          ordenServicio : patientDetailsModel.scheduleItem.ordenservicio_id,
                          servicio      : patientDetailsModel.scheduleItem.servicio,
                          fechaValido   : patientDetailsModel.scheduleItem.ordentrabajo_validahasta
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Actividades',
                        style: TextStyle(
                            fontSize     : 22.0,
                            color        : Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight   : FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: _ActivitiesTabs(
                                   patientDetailsModel: patientDetailsModel
                                 )
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                    'Sin detalles del paciente',
                    style: TextStyle(
                      fontSize  : 20,
                      fontWeight: FontWeight.bold,
                      color     : Color(0xFF2184c3),
                    ),
                  )),
      ),
    );
  }
}

class _ActivitiesTabs extends StatefulWidget {

  _ActivitiesTabs({
    Key? key,
    required this.patientDetailsModel,
  }) : super(key: key);

  PatientDetailsViewModel patientDetailsModel;

  @override
  _ActivitiesTabsState createState() => _ActivitiesTabsState();
}

class _ActivitiesTabsState extends State<_ActivitiesTabs> with SingleTickerProviderStateMixin {
  
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    final activitiesDone    = widget.patientDetailsModel.activitiesDone;
    final activitiesPending = widget.patientDetailsModel.activitiesPending;
    final patientSelected   = widget.patientDetailsModel.scheduleItem;
    final patientModel      = widget.patientDetailsModel;


    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height    : 45,
              width     : 330,
              decoration: BoxDecoration(
                color       : Colors.white,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black26,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                labelColor: Colors.white,
                indicator : BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.green,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [Tab(text: 'PENDIENTES'), Tab(text: 'REALIZADAS')],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  /// Actividades Pendientes:
                  Container(
                      child: activitiesPending.isNotEmpty
                          ? ListView.builder(
                              itemCount: activitiesPending.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                    onTap: () async {

                                     final actividadId     = activitiesPending.elementAt(index).id_actividad;
                                     final ordenServicioId = activitiesPending.elementAt(index).id_orden_de_servicio;

                                     /// LLamado del widget modal para verificar la identificación del paciente.
                                      _verificacionPaciente(
                                          context,
                                          patientSelected, 
                                          patientModel, 
                                          actividadId, 
                                          ordenServicioId,
                                        );
                                     
                                    },
                                    child: ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Icon(
                                            Icons.check_box_outline_blank_sharp,
                                            color: Colors.green,
                                            size : 33,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color: Color(0xFF2184c3),
                                        ),
                                        title: Text(
                                            'Ord. Servicio | Actividad | Servicio',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF2184c3),
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                          '${activitiesPending.elementAt(index).id_orden_de_servicio.toString()} | ${activitiesPending.elementAt(index).id_actividad} | ${activitiesPending.elementAt(index).servicioName}',
                                          style: TextStyle(fontSize: 15),
                                        )),
                                  )
                              )
                          : Center(
                              child: Text(
                              '¡No hay Actividades Pendientes!',
                              style: TextStyle(
                                fontSize  : 17,
                                fontWeight: FontWeight.bold,
                                color     : Color(0xFF2184c3),
                              ),
                            ))),

                  // Fin actividades pedientes

                  // Actividades realizadas

                  Container(
                      child: activitiesDone.isNotEmpty
                          ? ListView.builder(
                              itemCount: activitiesDone.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Icon(
                                        Icons.check_box_sharp,
                                        color: Colors.green,
                                        size : 33,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xFF2184c3),
                                    ),
                                    title: Text(
                                        'Ord. Servicio | Actividad | Servicio',
                                        style: TextStyle(
                                            fontSize  : 12,
                                            color     : Color(0xFF2184c3),
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${activitiesDone.elementAt(index).id_orden_de_servicio.toString()} | ${activitiesDone.elementAt(index).id_actividad} | ${activitiesDone.elementAt(index).servicioName}',
                                        style: TextStyle(fontSize: 15)));
                              })
                          : Center(
                              child: Text(
                              '¡No hay Actividades Realizadas!',
                              style: TextStyle(
                                fontSize  : 17,
                                fontWeight: FontWeight.bold,
                                color     : Color(0xFF2184c3),
                              ),
                            ))),

                  // Fin actividades realizadas
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alert Verificación del Paciente
_verificacionPaciente(context, selected, patientModel, actividadId, ordenServicioId) {

  final patientSelected = selected;
  final nombrePaciente  = selected.paciente.nombre;
  final cedulaPaciente  = selected.paciente.identificacion;
  final model           = patientModel;


  TextEditingController identificacionInput = TextEditingController();

  var alertStyle = AlertStyle(
      animationType      : AnimationType.fromBottom,
      isCloseButton      : true,
      isOverlayTapDismiss: false,
      descStyle          : TextStyle(fontWeight: FontWeight.bold),
      animationDuration  : Duration(milliseconds: 500),
      alertBorder        : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side        : BorderSide(
          // color: Color(0xFF2184c3),
          color: Colors.grey.shade400,
          width: 3,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
      ),
      constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor  : Color(0x10000000),
      alertElevation: 0,
      alertAlignment: Alignment.center);

  Alert(
      context        : context,
      style          : alertStyle,
      onWillPopActive: true,
      title          : '$nombrePaciente ($cedulaPaciente)',
      desc           : '¿Es el paciente a atender?',
      content        : Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller  : identificacionInput,
            autocorrect : false,
            keyboardType: TextInputType.number,
            decoration  : InputDecorations.authInputDecoration(
                hintText  : '000000000',
                labelText : 'Cédula del Paciente',
                prefixIcon: Icons.perm_identity),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {

            if (identificacionInput.text.isEmpty) {
              NotificationProvider.errorMessageBar(
                  title  : 'Error',
                  message: 'Debe ingresar la cédula del paciente');
            } else if (identificacionInput.text == cedulaPaciente) {

                  model.identificacionInput.text = '';
                  // La sig linea ciera el dialogo de verificación de paciente.
                  Navigator.of(context, rootNavigator: true).pop();

                  /// Navegar a  RegistroClinicoView con los parametros que se indican 
                  /// en arguments
                  locator<NavigationService>().navigateTo(
                               Routes.registroClinicoView,  
                               arguments: RegistroClinicoViewArguments(
                                             scheduledItem  : patientSelected,
                                             actividadId    : actividadId,
                                             ordenServicioId: ordenServicioId,                                             
                                          )
                  );
             
              
            } else {
              NotificationProvider.errorMessageBar(
                  title: 'Error', message: '¡Cédula Ingresada No Coincide!');
            }
          },
          child: Text(
            "VERIFICAR",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
