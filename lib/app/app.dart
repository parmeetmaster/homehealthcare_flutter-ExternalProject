
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/views.dart';




@StackedApp(
  /// rutas a las diferentes vistas o pantallas de la aplicacion
  routes: [
    MaterialRoute(page: LoginView, initial: true), // vista inicial
    MaterialRoute(page: HomeView,),
    MaterialRoute(page: UserProfileView, ),
    MaterialRoute(page: PatientDetailsView,),
    MaterialRoute(page: RegistroClinicoView, ),
    MaterialRoute(page: UploadResponseView, ),
    /// vistas con el nombre para identificar el formulario a mostrar
    MaterialRoute(page: ValoracionTerapiaFisicaView, name: 'registroclinico_valoracion_terapia_fisica'), 
    MaterialRoute(page: EvolucionTerapiaFisicaView, name: 'registroclinico_evolucion_terapia_fisica'),
    MaterialRoute(page: ValoracionTerapiaRespiratoriaView, name: 'registroclinico_valoracion_terapia_respiratoria'),
    MaterialRoute(page: EvolucionTerapiaRespiratoriaView, name: 'registroclinico_evolucion_terapia_respiratoria'),

  ],

  dependencies: [
    /// carag de los servicios para la navegación y los mensajes en la barra.
    LazySingleton( classType: NavigationService ),  
    LazySingleton( classType: SnackbarService ),
   // LazySingleton( classType: DialogService),
  ],



)
class AppSetUp {}
