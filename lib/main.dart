// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'app/core/init/init.dart';
import 'app/core/ui/setup_snackbar_ui.dart';
import 'image_upload/hive_model/image_record_model.dart';
import 'widgets/widgets.dart';

 ///  Se Inicializa las claseas creadas en el archivo /app/app.dar
 ///  setupLocator(): inicializa el servicio de Navegación, y la barra de mensajes
 ///  setupSnackbarUi() : inicializa la configuración de la barra de mensajes.  

void main() async {  
  setupLocator();
  setupSnackbarUi();
  Hive.initFlutter();
  Hive.registerAdapter(ImageRecordModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Init.initialize() inicializa las interfaces, este método se ubica en la carpeta: /app/core/init/init.dart
  // _initFuture se usa en el constructor del FutureBuilder

  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          // snapshot.connectionState == ConnectionState.waiting
          // snapshot.connectionState == ConnectionState.done
          // snapshot.hasData
          // snapshot.data
          // snapshot.hasError

          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: CheckingConnectionWidget(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data == true) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // ignore: prefer_const_literals_to_create_immutables
                localizationsDelegates: [GlobalMaterialLocalizations.delegate],
                // ignore: prefer_const_literals_to_create_immutables
                supportedLocales: [ const Locale('es')  ],
                title: 'Home Health Care',
                navigatorKey: StackedService.navigatorKey,
                onGenerateRoute: StackedRouter().onGenerateRoute,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
              );
            } else {

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // ignore: prefer_const_literals_to_create_immutables
                localizationsDelegates: [GlobalMaterialLocalizations.delegate],
                // ignore: prefer_const_literals_to_create_immutables
                supportedLocales: [
                  const Locale('es'),
                  // const Locale('en')
                ],
                title: 'Home Health Care',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                
                /// se utiliza el servicio de routers propocionado por el paquete stack_services 
                /// se configura como la vista inicial Routes.homeViews, una vez autenticado el usuario; 
                /// este se configura en el archivo: /app/app.dart
                
                builder: ExtendedNavigator(
                  router: StackedRouter() ,
                  initialRoute: Routes.homeView,
                  navigatorKey: StackedService.navigatorKey,
                ),
              );


/*

builder: ExtendedNavigator(
        router: router.Router(),
        initialRoute: router.Routes.startupView,
        navigatorKey: StackedService.navigatorKey,
     ),




*/
              // return MaterialApp(
              //   debugShowCheckedModeBanner: false,
              //   home: Scaffold(
              //     body: HomeView(isConnected: false,  ),
              //   ),
              // );

              // return const MaterialApp(
              //   debugShowCheckedModeBanner: false,
              //   home: NoConnectionNoDataWidget(),
              // );
            }
          } else {
            return const Text('Ha Ocurrido un error');
          }
        });
  }
}
