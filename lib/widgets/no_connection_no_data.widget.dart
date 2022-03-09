// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_home_care/widgets/widgets.dart';



class NoConnectionNoDataWidget extends StatelessWidget {
  const NoConnectionNoDataWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
        appBar: AppBar(
            elevation: 0,
            flexibleSpace: appbarGradientWidget(),
            leadingWidth: 50,
            leading: Icon(
              Icons.wifi_off_sharp,
              size: 35,
            ),
            title: Text(
              'App No Sincronizada...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.wifi_off_sharp,
                  size: 60.0,
                  color: Colors.red[800],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '¡No ha Sincronizado la APP!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Está sin conexión a datos',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.yellow,
                elevation: 0,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Por favor, restablezca su conexión a Internet con datos e intente de nuevo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                        ElevatedButton.icon(	
                          label: Text('ACEPTAR'),                        
                          icon: Icon(Icons.login_outlined),  
                          style: ElevatedButton.styleFrom(	
                            primary: Color(0xFF1aaf4d),
                            textStyle: TextStyle(	
                                color: Colors.black,	
                                fontSize: 20,	
                                fontStyle: FontStyle.italic
                            ),                        
                          ), 
                                               
                          onPressed: () => SystemNavigator.pop(),                        
                        )
                      
                  
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}