// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class CheckingConnectionWidget extends StatelessWidget {
  const CheckingConnectionWidget({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          
          Icon(
           Icons.wifi_calling_3_sharp,
           size: 50.0,
           color: Color(0xFF2184c3),
            ),
          SizedBox(
            height: 30,
          ),
          Text(
            '¡Verificando conexión!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1aaf4d)),
          ),
        ],
      ),
    );
  }
}