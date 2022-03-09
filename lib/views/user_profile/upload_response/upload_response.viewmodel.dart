import 'package:health_home_care/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadResponseViewModel extends BaseViewModel {

  UploadResponseViewModel( this.response );

  List response;
 

  final _navigationService = locator<NavigationService>();

  void navigateToBack() {
    _navigationService.back();
  }



}