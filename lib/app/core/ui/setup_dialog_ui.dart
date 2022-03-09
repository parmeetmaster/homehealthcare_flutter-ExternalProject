// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_home_care/app/core/ui/input_decorations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import 'enums.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    // DialogType.basic: (context, sheetRequest, completer) =>
    //     _BasicDialog(request: sheetRequest, completer: completer),

    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  TextEditingController identificacionInput = TextEditingController();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            padding: const EdgeInsets.only(
                top: 32.0, left: 16.0, right: 16.0, bottom: 12.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(request.title ?? '', 
                      textAlign: TextAlign.center,
                      style: TextStyle( fontWeight: FontWeight.w500, fontSize: 20.0 ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(request.description ?? '', 
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox( height: 10, ),
                 TextField(
                  controller: identificacionInput,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '000000000',
                      labelText: 'Cédula del Paciente',
                      prefixIcon: Icons.perm_identity),
                ),
                SizedBox(
                  height: 20,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (request.secondaryButtonTitle != null)
                      TextButton(
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text(
                          request.secondaryButtonTitle!,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: Text(
                        request.mainButtonTitle!,
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -28,
            child: CircleAvatar(
              minRadius: 16.0,
              maxRadius: 28.0,
              backgroundColor: Colors.greenAccent,
              child: Icon(
                Icons.verified_user,
                size: 28.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class _BasicDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _BasicDialog({
//     Key? key, 
//     required this.request, 
//     required this.completer
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: /* Build your dialog UI here */
//     );
//   }
// }

