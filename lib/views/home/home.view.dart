// ignore_for_file: prefer_const_constructors
import 'package:awesome_icons/awesome_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:stacked/stacked.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import '../views.dart';


/// Vista Home donde se muestran los items de la agenda (Schedule)
/// validado el usuario carga esta vista.

class HomeView extends StatelessWidget { 

  HomeView({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        context,
        homeViewModel,
        child,
      ) {
        // Obtiene los items de la agenda (schedule), se carga desde la clase HomeViewModel
        final item = homeViewModel.schedule.item;
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              
              // appbarGradientWidget() widget que le da color degradado al header              
              flexibleSpace: appbarGradientWidget(),
              leadingWidth : 40,
              leading      : const Icon(
                Icons.calendar_today_outlined,
                size: 30,
              ),
              actions: [
                if (homeViewModel.isConnected)
                  IconButton(
                    icon     : const Icon(FontAwesomeIcons.signOutAlt),
                    onPressed: () async {
                      // verifica que la aplicación tenga conexión a datos  
                      homeViewModel.isConnected = await isConnectedToNetwork();

                      if (!homeViewModel.isConnected) {
                        NotificationProvider.warningMessageBar(
                            title: 'Advertencia',
                            message: 'Trabajando con Datos Offline');
                      } else {
                        homeViewModel.navigateToLoginView();
                        NotificationProvider.successMessageBar(
                            title: 'Operación Válida',
                            message: '¡Desconectado exitosamente!');
                      }
                    },
                  ),
                if (!homeViewModel.isConnected)
                  IconButton(
                    icon: const Icon(
                      Icons.wifi_off,
                      color: Colors.red,
                      size : 35.0,
                    ),
                    onPressed: () async {
                      homeViewModel.isConnected = await isConnectedToNetwork();
                      if (homeViewModel.isConnected) {
                        NotificationProvider.successMessageBar(
                            title: 'Activación',
                            message: 'Conexión a datos restaurada');
                      }
                    },
                  ),
              ],
              title: Text(
                'Mi Agenda Domiciliaria (${item.length})',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          drawer: const MenuDrawerWidget(),
          body: homeViewModel.isBusy
              ? ProcessingDataView(title: '¡Cargando Datos!')
              : item.isNotEmpty
                  ? ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            margin: EdgeInsets.only( top: 7 ),

                            /// Paquete "expandable" ṕara mostrar la pestaña de la tarteja
                            /// donde se muestra el detalle del paciente.
                            child: ExpandablePanel(
                              theme: const ExpandableThemeData(
                                  headerAlignment: ExpandablePanelHeaderAlignment.bottom,
                                  hasIcon        : false
                              ),

                              /// Encabezado del paquete "expandable"    
                              header: Container(
                                margin: EdgeInsets.only( left: 12, right: 12),
                                decoration: _cardBorders(),
                                child: Stack(
                                  children: [
                                    Positioned(top: 7, child: _PatientPhoto()),
                                    _PatientName(
                                        patientName: item[index].paciente.nombre,
                                        identificacion: item[index].paciente.identificacion,
                                        servicio: item[index].servicio,    
                                    ),
                                        
                                  ],
                                ),
                              ),
                              
                              /// Contenido a mostrar cuando no esta expandido
                              collapsed: Text(''),

                              expanded: GestureDetector(
                                onTap: () {
                                  print('orden de servicio: ');
                                  print(item[index].ordenservicio_id);                                  

                                  /// se navega a la vista PatientDetailsView
                                  /// Parametros: ordenservicio_id, scheduleItem (item de la agenda)
                                  homeViewModel.navigateToPatientDetailsView(
                                    ordenServicioId: item[index].ordenservicio_id,
                                    scheduledItem: item[index],
                                  );
                                },
                                child: Column(
                                  children: [

                                    _PatientInfo(
                                        telefono     : item[index].paciente.telefono,
                                        celular      : item[index].paciente.celular,
                                        direccion    : item[index].paciente.direccion,
                                        departamento : item[index].paciente.departamento,
                                        municipio    : item[index].paciente.municipio,
                                        ordenTrabajo : item[index].ordentrabajo_id,
                                        ordenServicio: item[index].ordenservicio_id,
                                        servicio     : item[index].servicio,
                                        fechaValido  : item[index].ordentrabajo_validahasta
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        _ActividadesAsignadas(
                                            actividadasignada: item[index].actividades_asignadas
                                        ),

                                        SizedBox(
                                          width: 10.0,
                                        ),

                                        _ActividadesRealizadas(
                                            actividadrealizada: item[index].actividades_realizadas
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              
                            ),
                          )
                      )
                  : Center(
                      child: Text(
                      'Sin Pacientes Agendados!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2184c3),
                      ),
                    )),
        );
      },
    );
  }

  BoxDecoration _cardBorders() {
    var boxShadow =
        BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 7);
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [boxShadow]);
  }
}

class _PatientPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Container(
          width: 65,
          height: 65,
          // color: Colors.blue,
          child: Image(
            image: AssetImage('assets/images/patient-profile.png'),
          )

          // SvgPicture.asset(
          //   'assets/images/patient.png',
          //   placeholderBuilder: (context) => CircularProgressIndicator(),
          // ),
          ),
    );
  }
}

class _PatientName extends StatelessWidget {
  final String patientName;
  final String identificacion;
  final String servicio;


  const _PatientName(
      {Key? key, required this.patientName, required this.identificacion, required this.servicio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 85,
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    '$patientName',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'Identificación: $identificacion',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                   Text(
                    'Servicio: $servicio',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  )
                ],
              ),
            ],
          )
          //overflow: TextOverflow.ellipsis,

          ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color(0xFF2184c3),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17), topRight: Radius.circular(17)));
}

class _PatientInfo extends StatelessWidget {
  final String telefono;
  final String celular;
  final String direccion;
  final String departamento;
  final String municipio;
  final int ordenTrabajo;
  final int ordenServicio;
  final String servicio;
  final String fechaValido;

  const _PatientInfo(
      {Key? key,
      required this.telefono,
      required this.celular,
      required this.direccion,
      required this.departamento,
      required this.municipio,
      required this.ordenTrabajo,
      required this.ordenServicio,
      required this.servicio,
      required this.fechaValido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: 260,
        width: 360,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Télefonos: $telefono | ${celular == telefono ? '' : celular}'),

            SizedBox(height: 5),
            Text('Dirección:  $direccion'),

            SizedBox(height: 5),
            Text('Municipio:  $municipio'),
            SizedBox(height: 5),
            Text('Departamento:  $departamento'),

            Divider(color: Color(0xFF2184c3)),
            // Text('Administrativo'),

            SizedBox(height: 5),
            Text('Orden de Trabajo:  $ordenTrabajo'),

            SizedBox(height: 5),
            Text('Orden de Servicio: $ordenServicio'),

            SizedBox(height: 5),
            Text('Servicio: $servicio'),

            SizedBox(height: 5),
            Text('Valido hasta: $fechaValido'),
          ],
        ),
      ),
    );
  }
}

class _ActividadesAsignadas extends StatelessWidget {
  final int actividadasignada;

  const _ActividadesAsignadas({Key? key, required this.actividadasignada})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 38,
          // width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              Text(
                'Actividades Asignadas: $actividadasignada',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
          //overflow: TextOverflow.ellipsis,

          ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      // color: Color(0xFF2184c3),
      color: Colors.yellow[500],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17), topRight: Radius.circular(17)));
}

class _ActividadesRealizadas extends StatelessWidget {
  final int actividadrealizada;
  const _ActividadesRealizadas({Key? key, required this.actividadrealizada})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 38,
          // width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              Text(
                'Actividades Realizadas: $actividadrealizada',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
          //overflow: TextOverflow.ellipsis,

          ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      // color: Color(0xFF2184c3),
      color: Color(0xFF1aaf4d),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17), topRight: Radius.circular(17)));
}
