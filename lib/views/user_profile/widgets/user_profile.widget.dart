
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_home_care/models/models.dart';

class UserProfileWidget extends StatelessWidget {
  final User user;

  const UserProfileWidget({
      Key? key, 
      required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              gradient: LinearGradient(colors: [
                Color.fromRGBO(33, 132, 195, 1), // #2184c3
                Color.fromRGBO(26, 175, 77, 1), // #1aaf4d
              ]),
            ),
            
            child: Container(
              width : double.infinity,
              height: 200,
              child : Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(                  
                  backgroundColor: Colors.grey[50],
                  backgroundImage: AssetImage('assets/images/users.png'),
                  radius         : 70.0,
                ),
              ),
            ),
          ),
          SizedBox( height: 60 ),
          Text(
            user.nombre,
            style: TextStyle(
                fontSize     : 25.0,
                color        : Color(0xFF1aaf4d),
                letterSpacing: 2.0,
                fontWeight   : FontWeight.bold),
          ),

          SizedBox( height: 3 ),
          /// Llamado del widget privado.
          _listOfProfiles(),

          SizedBox( height: 10 ),
          Text(
            '${user.municipio}, ${user.departamento}',
            style: TextStyle(
                fontSize     : 15.0,
                color        : Colors.black45,
                letterSpacing: 2.0,
                fontWeight   : FontWeight.w300),
          ),
          SizedBox( height: 30 ),
          Text(
            "Actividades:",
            style: TextStyle(
                fontSize     : 18.0,
                color        : Colors.black45,
                letterSpacing: 2.0,
                fontWeight   : FontWeight.w300),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Asignadas",
                          style: TextStyle(
                              color     : Color(0xFF2184c3),
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          user.actividades_asignadas,
                          style: TextStyle(
                              color     : Colors.black,
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Realizadas",
                          style: TextStyle(
                              color     : Color(0xFF2184c3),
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          user.actividades_realizadas,
                          style: TextStyle(
                              color     : Colors.black,
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox( height: 20 ),
          Text(
            "Ordenes:",
            style: TextStyle(
                fontSize     : 18.0,
                color        : Colors.black45,
                letterSpacing: 2.0,
                fontWeight   : FontWeight.w300),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Asignadas",
                          style: TextStyle(
                              color     : Color(0xFF2184c3),
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          user.ordenes_asignadas.toString(),
                          style: TextStyle(
                              color     : Colors.black,
                              fontSize  : 18.0,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _listOfProfiles() {
    List<Widget> list = [];

    for (var profile in user.perfiles) {
      list.add(
        Center(
          child: Text(
              profile.nombre,
              style: TextStyle(
                  fontSize     : 18.0,
                  color        : Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight   : FontWeight.w300
              ),
            ),
        ),
      );
    }

    return Wrap(
        spacing: 5.0, 
        runSpacing: 2.0, 
        children: list);
  }
}
