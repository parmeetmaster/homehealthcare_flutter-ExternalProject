import 'package:flutter/material.dart';
import 'package:health_home_care/models/models.dart';


class ScheduleListCard extends StatelessWidget {

  final ScheduleItem item;

  const ScheduleListCard({Key? key, required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 5),
          width: double.infinity,
          height: 320,//195,
          decoration: _cardBorders(),
          child: Stack(
            
            children: [
              Positioned(top:3, child: _PatientPhoto()),
              _PatientName( 
                     patientName: item.paciente.nombre, 
                     identificacion: item.paciente.identificacion 
                    
              ),
              Positioned(
                top: 55, 
                child: _PatientInfo(
                  telefono: item.paciente.telefono,
                  celular: item.paciente.celular,
                  direccion: item.paciente.direccion,
                  departamento: item.paciente.departamento,
                  municipio: item.paciente.municipio,
                  ordenTrabajo: item.ordentrabajo_id ,
                  ordenServicio: item.ordenservicio_id,
                  servicio: item.servicio,
                  fechaValido: item.ordentrabajo_validahasta
                )
              ),
              Positioned(
                bottom: 0,
                left: 6,
                child: _ActividadesAsignadas(
                  actividadasignada: item.actividades_asignadas
                )
              ),
              Positioned(
                bottom: 0,
                right: 150,
                child: _ActividadesRealizadas(
                  actividadrealizada: item.actividades_realizadas

                )
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: _GeoLocalizacion(
                  // actividadrealizada: item.actividadesRealizadas

                )
              ),

            ],
          )),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

class _PatientName extends StatelessWidget {

  final String patientName;
  final String identificacion;

  const _PatientName({
    Key? key, 
    required this.patientName,
    required this.identificacion 
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 65),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 58,
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              Text( '$patientName, ($identificacion)',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
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

  const _PatientInfo({
    Key? key, 
    required this.telefono,
    required this.celular,
    required this.direccion,
    required this.departamento,
    required this.municipio,

    required this.ordenTrabajo,
    required this.ordenServicio,
    required this.servicio,
    required this.fechaValido
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 6),
        // height: 230,
        height: 250,
        width: 350,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Télefonos: $telefono | ${celular == telefono ? '' : celular }'),

            SizedBox(height: 5),
            Text('Dirección:  $direccion'),

            SizedBox(height: 5),
            Text('Municipio:  $municipio'),
            SizedBox(height: 5),
            Text('Departamento:  $departamento'),

            Divider(color: Color(0xFF2184c3) ),
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

class _PatientPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 45,
        height: 45,
        // color: Colors.blue,
        child: Image( image: AssetImage('assets/images/patient-profile.png'), ) 
        
        // SvgPicture.asset(
        //   'assets/images/patient.png',
        //   placeholderBuilder: (context) => CircularProgressIndicator(),
        // ),
      ),
    );
  }
}

class _ActividadesAsignadas extends StatelessWidget {

  final int actividadasignada;

  const _ActividadesAsignadas({
    Key? key,
    required this.actividadasignada
  }) : super(key: key);

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
              Text('Act. Asig.: $actividadasignada',
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
  const _ActividadesRealizadas({
    Key? key,
    required this.actividadrealizada
  }) : super(key: key);

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
              Text('Act. Real.: $actividadrealizada',
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


class _GeoLocalizacion extends StatelessWidget {

  // final int actividadrealizada;
  const _GeoLocalizacion({
    Key? key,
    // required this.actividadrealizada
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
          height: 50,
          
          child: Column(
            children: [
              IconButton(
                iconSize: 34,
                color: Colors.red,
                icon: const Icon(Icons.location_on),
                tooltip: 'Ubicación del Paciente',
                onPressed: () {
                  print('Abriendo Mapa....');
                },
              ),
            ],
          )
          
          ),
    );
  }

  
  
}
