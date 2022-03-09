import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import 'enums.dart';


void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      icon: const Icon( FontAwesomeIcons.timesCircle, color: Colors.white, ),
      backgroundColor: Colors.red,
      textColor: Colors.white,
      messageColor: Colors.white,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      icon: const Icon( FontAwesomeIcons.infoCircle, color: Colors.white, ),
      backgroundColor: Colors.green,
      textColor: Colors.white,
      messageColor: Colors.white,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.warning,
    config: SnackbarConfig(
      icon: const Icon( FontAwesomeIcons.exclamationCircle, color: Colors.black, ),
      backgroundColor: Colors.yellow.shade300,
      textColor: Colors.black,
      messageColor: Colors.black,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
    ),
  );


}
