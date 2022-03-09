import 'package:health_home_care/app/app.locator.dart';
import 'package:health_home_care/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ValoracionTerapiaFisicaViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  

  // Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
      _navigationService.clearStackAndShow(Routes.loginView);
  }
}

