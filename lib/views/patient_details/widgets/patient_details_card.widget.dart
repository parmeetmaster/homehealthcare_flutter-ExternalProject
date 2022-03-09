import 'package:flutter/material.dart';

class PatientDetailsCardWidget extends StatelessWidget {

 // final AgendaItem patientdetails;

  final String nombrePaciente;
  final String identificacion;
  final String? fechaNacimiento;
  final int? edad;
  final String? telefono;
  final String? celular;
  final String? direccion;
  final String? departamento;
  final String? municipio;
  final int? ordenTrabajo;
  final int? ordenServicio;
  final String? servicio;
  final String? fechaValido;

  const PatientDetailsCardWidget(
    {
      Key? key, 
      //required this.patientdetails
      required this.nombrePaciente,
      required this.identificacion,
      this.fechaNacimiento,
      this.edad,
      this.telefono,

      this.celular,
      this.direccion,
      this.departamento,
      this.municipio,

      this.ordenTrabajo,
      this.ordenServicio,
      this.servicio,
      this.fechaValido
    }
  ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
           margin: EdgeInsets.only(top: 13, bottom: 5),
          width: double.infinity,
          height: 250,
           
          decoration: _cardBorders(),
          child: Stack(
            
            children: [
              Positioned(top: 3, child: _PatientPhoto()),
              _PatientName( 
                    patientName: nombrePaciente, 
                    identificacion: identificacion 
              ),
              Positioned(top: 55, child: _PatientInfo(
                  fechaNacimiento: fechaNacimiento,
                  edad: edad,
                  telefono: telefono,
                  celular: celular,
                  direccion: direccion,
                  departamento: departamento,
                  municipio: municipio,
                  ordenTrabajo: ordenTrabajo ,
                  ordenServicio: ordenServicio,
                  servicio: servicio,
                  fechaValido: fechaValido
              ))
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
          height: 60,
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

class _PatientPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 45,
        height: 45,
        child: Image( image: AssetImage('assets/images/patient-profile.png'), ) 
       
      ),
    );
  }
}

class _PatientInfo extends StatelessWidget {

  const _PatientInfo({
    Key? key, 
    this.fechaNacimiento,
    this.edad,
    this.telefono,

    this.celular,
    this.direccion,
    this.departamento,
    this.municipio,

    this.ordenTrabajo,
    this.ordenServicio,
    this.servicio,
    this.fechaValido
  }) : super(key: key);

  final String? fechaNacimiento;
  final int? edad;
  final String? telefono;

  final String? celular;
  final String? direccion;
  final String? departamento;
  final String? municipio;
  final int? ordenTrabajo;
  final int? ordenServicio;
  final String? servicio;
  final String? fechaValido;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 6),
        width: 350,

//  color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            if (fechaNacimiento != null)                         
              SizedBox( height: 20, ),

            if (fechaNacimiento != null)                         
              Text( 'Fecha de Nacimiento: $fechaNacimiento'),
           
            if (edad != null) 
              Text('Edad: $edad'),
      
            if (telefono != null) 
              Text('Télefonos: $telefono | ${celular == telefono ? '' : celular }'),
      
            if (direccion != null) 
              Text('Dirección:  $direccion'),
      
            if (municipio != null) 
              Text( 'Municipio: $municipio' ),
      
            if (departamento != null) 
              Text( 'Departamento: $departamento' ),
      
            if(ordenTrabajo != null)
            Divider(color: Color(0xFF2184c3) ),
           
            if(ordenTrabajo != null)
              Text( 'Orden de Trabajo: $ordenTrabajo' ),
      
            if(ordenServicio != null)
              Text( 'Orden de Servicio: $ordenServicio'),
      
            if(servicio != null)
              Text( 'Servicio: $servicio'),
      
            if(fechaValido != null)
              Text('Valido hasta: $fechaValido' ),
          ],
        ),
      ),
    );
  }
}
