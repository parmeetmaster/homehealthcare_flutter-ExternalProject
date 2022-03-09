// ignore_for_file: must_be_immutable

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:health_home_care/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../views.dart';

class UploadResponseView extends StatelessWidget {
  
  UploadResponseView({
    Key? key,
    required this.uploadResponse,
  }) : super(key: key);

  List uploadResponse;

  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder<UploadResponseViewModel>.reactive(
      viewModelBuilder: () => UploadResponseViewModel(uploadResponse),
      builder: (
        BuildContext context,
        UploadResponseViewModel uploadModel,
        Widget? child,
      ) {
    
        final resp = uploadModel.response;

        return Scaffold(
            appBar: AppBar(
                elevation    : 0,
                flexibleSpace: appbarGradientWidget(),
                leadingWidth : 50,
                leading      : const Icon(
                  FontAwesomeIcons.upload,
                  size: 30,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.checkCircle,
                      size: 30.0,
                    ),
                    onPressed: () {
                      uploadModel.navigateToBack();
                    },
                  ),
                ],
                title: const Text(
                  'Respuesta Carga de datos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            drawer: const MenuDrawerWidget(),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                  itemCount: resp.length,
                  itemBuilder: (BuildContext context, int index) => 
                   Container(
                     padding: const EdgeInsets.symmetric(vertical: 3.0),
                     child: Card(
                       color: resp.elementAt(index)['server_respose'] == 400 ? Colors.yellow : Colors.green,
                       elevation: 0,
                       child: ListTile(
                            leading: resp.elementAt(index)['server_respose'] == 400 
                                      ? const Icon(FontAwesomeIcons.exclamationTriangle, size: 33.0,)
                                      : const Icon(FontAwesomeIcons.checkSquare, size: 33.0,),
                            title: Row(
                              children: [
                                const Text(
                                          'Actividad: ', 
                                          style: TextStyle( letterSpacing: 1.5, fontWeight: FontWeight.w500 ),
                                      ),
                                Text(resp.elementAt(index)['actividad'].toString(), style: const TextStyle( fontSize: 18.0 )),
                              ],
                            ),                        
                            subtitle: Row(
                              children: [
                                // const Text('Respuesta: ', style: TextStyle( fontSize: 12.5 , fontStyle: FontStyle.italic, fontWeight: FontWeight.w500) ),
                                Text(resp.elementAt(index)['message'], style: const TextStyle( fontSize: 12.5 )),

                              ],
                            ),                        
                              
                        ),
                     ),
                   )
                      ),
            ),

            floatingActionButton: FloatingActionButton(
              elevation: 0,
              tooltip  : 'Aceptar',
              child    : const Icon( FontAwesomeIcons.check, size: 25.0, ),
              onPressed: ()=> uploadModel.navigateToBack(),
            ),
          );
      },
    );
  }
}
