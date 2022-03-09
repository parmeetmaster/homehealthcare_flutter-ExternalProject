import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../app/core/ui/enums.dart';

/// Gestion de las notificaciones que se muestran en la barra inferior
class NotificationProvider {

  /// Singleton que se incializa con el paquete Stacked_services
  static final _snackBar = locator<SnackbarService>();

// Mostrar mensaje de exito
  static successMessageBar( { required String message, required String title} ) {
    _snackBar.showCustomSnackBar(
      variant : SnackbarType.success,
      onTap   : ()=>null,
      message : message,
      title   : title,
      duration: const Duration(seconds: 3),
    );
  }

  // mostrar mensaje de error
  static errorMessageBar({ required String message, required String title }) {
    _snackBar.showCustomSnackBar(
      variant : SnackbarType.error,
      onTap   : ()=>null,
      message : message,
      title   : title,
      duration: const Duration(seconds: 3),
    );
  }

  // mostrar mensaje de advertencia
  static warningMessageBar( { required String message, required String title}) {
    _snackBar.showCustomSnackBar(
      variant : SnackbarType.warning,
      onTap   : ()=>null,
      message : message,
      title   : title,
      duration: const Duration(seconds: 3),
    );
  }
}
