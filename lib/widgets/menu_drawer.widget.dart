import 'package:flutter/material.dart';
import '../providers/providers.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../app/app.router.dart';



class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    //final authservice = Provider.of<AuthService>(context);

    return Drawer(
        child: ListView(
          padding:EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/terapias.jpg'),
                      fit: BoxFit.cover)
              ),
            ),
            ListTile(
                leading: const Icon( Icons.calendar_today_outlined, size: 30, color: Color(0xFF2184c3), ),
                title: const Text('Mi Agenda Domiciliaria'),
                onTap: ()=> locator
                              .get<NavigationService>()
                              .navigateTo(Routes.homeView),                 
                
            ),

            ListTile(
                leading:const  Icon( Icons.manage_accounts, size: 30, color: Color(0xFF2184c3) ),
                title: const Text('Mi Perfil'),
                onTap: ()=> locator
                              .get<NavigationService>()
                              .navigateTo(Routes.userProfileView),                 
                 
            ),

            const SizedBox( height: 50, ),
            const Divider(thickness: 2, color: Color(0xFF2184c3)),

            ListTile(
                leading: const Icon( Icons.login_outlined, size: 30, color: Color(0xFF2184c3) ),
                title: const Text('Desconectarse'),
                onTap: (){

                 //  authservice.logout();
                 locator.get<NavigationService>().clearStackAndShow(Routes.loginView);
                 NotificationProvider.successMessageBar( title: 'Operación Válida', message: '¡Desconectado exitosamente!' );
                 
                },
            ),

            //     ListTile(
            //     leading: Icon( Icons.settings, color: Color(0xFF2184c3) ),
            //     title: Text('Settings'),                  
            //     onTap: () => {},
            // // Navigator.pop(context);
            // // Navigator.pushNamed(context, SettingsPage.routeName);

            //   ),

          

          ],
    )
    );
  }
}