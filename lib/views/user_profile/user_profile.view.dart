// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:health_home_care/views/user_profile/widgets/user_profile.widget.dart';
import 'package:health_home_care/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../image_upload/image_upload_repository/image_upload_repo.dart';
import '../views.dart';

class UserProfileView extends StatelessWidget {  

  /// Configuración del boton flotante en el perfil
  var renderOverlay       = true;
  var visible             = true;
  var switchLabelPosition = false;
  var extend              = false;
  var rmicons             = false;
  var customDialRoot      = false;
  var closeManually       = false;
  var useRAnimation       = true;
  var isDialOpen          = ValueNotifier<bool>(false);
  var speedDialDirection  = SpeedDialDirection.up;
  var buttonSize          = const Size(56.0, 56.0);
  var childrenButtonSize  = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked; 


  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(   ),
      builder: (
        BuildContext context,
        UserProfileViewModel userProfile,
        Widget? child,
      ) {
        
          return Scaffold(
       appBar:  AppBar(
            elevation: 0,
            flexibleSpace: appbarGradientWidget(),
            leadingWidth: 50, 
            leading: Icon(FontAwesomeIcons.idBadge, size: 35,),
            actions: [

                if (userProfile.isConnected)
                IconButton(
                  icon: const Icon(FontAwesomeIcons.signOutAlt),
                  onPressed: () async {
                    userProfile.isConnected = await isConnectedToNetwork();

                    if (!userProfile.isConnected) {
                      NotificationProvider.warningMessageBar(
                          title: 'Advertencia',
                          message: 'Trabajando con Datos Offline');
                    } else {
                      userProfile.navigateToLoginView();
                      NotificationProvider.successMessageBar(
                          title: 'Operación Válida',
                          message: '¡Desconectado exitosamente!');
                    }
                  },
                ),
              if (!userProfile.isConnected)
                IconButton(
                  icon: const Icon(
                    Icons.wifi_off,
                    color: Colors.red,
                    size: 35.0,
                  ),
                  onPressed: () async {
                    userProfile.isConnected = await isConnectedToNetwork();
                    if ( userProfile.isConnected ) {
                         NotificationProvider.successMessageBar(
                            title: 'Activación',
                            message: 'Conexión a datos restaurada');
                        
                      }
                  },
                ),



            ], 
            
            title: Text('Mi Perfil')
        ),
        drawer: MenuDrawerWidget(),
        body: userProfile.isBusy
        ? ProcessingDataView( title: '¡Cargando Datos!')
        
        : userProfile.isSynchronizing
          ? ProcessingDataView( title: '¡Sincronizando Datos!')
          :  UserProfileWidget( user: userProfile.userData),
          
        floatingActionButton: SpeedDial(
          
          icon                : FontAwesomeIcons.syncAlt,
          backgroundColor     : Colors.yellow[600],
          foregroundColor     : Colors.black45,
          activeIcon          : Icons.close,
          spacing             : 3,
          openCloseDial       : isDialOpen,
          childPadding        : const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          buttonSize          : buttonSize,
          label               : extend
              ? const Text("Abrir")
              : null, // The label of the main button.
          activeLabel: extend ? const Text("Cerrar") : null,

          childrenButtonSize : childrenButtonSize,
          visible            : !userProfile.isBusy,
          direction          : speedDialDirection,
          switchLabelPosition: switchLabelPosition,
          
          closeManually: closeManually,         
          renderOverlay: renderOverlay,
          
          useRotationAnimation: useRAnimation,
          tooltip             : 'Sincronizar Datos',
          heroTag             : 'speed-dial-hero-tag',
          elevation           : 0,
          isOpenOnStart       : false,
          animationSpeed      : 200,
          shape               : const StadiumBorder(),
          
          children: [
            SpeedDialChild(
              child          : const Icon( FontAwesomeIcons.download, size: 20.0, ),
              backgroundColor: Color(0xFF1aaf4d),
              foregroundColor: Colors.white,
              label          : 'Descargar Datos',
              onTap          : () async {
                    await userProfile.syncDownloadDataHttp();


                    if ( userProfile.downloadedDone && userProfile.doDownloadSync ) {
                      NotificationProvider.successMessageBar(
                          title: 'Operación Valida',
                          message: 'Se han descargados los datos exitosamente');

                        print('Id formularios creados en la Store');
                        print(userProfile.formsIds);

                        print('Id del Usuario creados en la Store');
                        print(userProfile.userId);
                
                        print('Ids Pacientes creados en la Store');
                        print(userProfile.pacientsIds);
                
                        print('Ids Agenda creados en la Store');
                        print(userProfile.scheduleIds);

                        print('Ids Actividades creados en la Store');
                        print(userProfile.activityIds ); 

                    }

                    if ( !userProfile.doDownloadSync ) {                      
                      NotificationProvider.warningMessageBar(
                          title: 'Advertencia',
                          message: 'Existen datos que no han sido subido. Por favor, sincronice:  "Subir Datos". ');
                    }  

                   
              },
            ),
            SpeedDialChild(
              child          : const Icon(FontAwesomeIcons.upload),
              backgroundColor: Color(0xFF2184c3),
              foregroundColor: Colors.white,
              label          : 'Subir Datos',
              visible        : true,
              onTap          : () async {

                 List uploadResponse = await userProfile.syncUploadDataHttp();               

                if( uploadResponse.isEmpty && userProfile.isConnected ){                  

                  userProfile.isSynchronizing = false;      
                  userProfile.navigateToUserProfile();

                  NotificationProvider.warningMessageBar(
                          title  : 'Advertencia',
                          message: 'No hay Datos para sincronizar'
                  );
                }else{
                   userProfile.navigateToUploadResponseView( uploadResponse: uploadResponse );
                }

                 if ( !userProfile.isConnected ) {
                   userProfile.navigateToUserProfile();
                   NotificationProvider.warningMessageBar(
                          title  : 'Advertencia',
                          message: 'No tiene conexión a Datos'
                  );
                  
                }

              await   ImageUploadViewModel().uploadPendingRequest(context);
                
              },
              // onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),           
         

    );

      },
    );
  }
}
