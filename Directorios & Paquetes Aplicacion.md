# Estructura carpetas del proyecto

**/app** : directorio de la aplicación para inicialización de algunos paquetes.
|---> **/core** : contiene el manejo de inicialización de los sigleton, urls, interfaz del usuario comunes.
|---> **/error** : se creo para le manejo de errores pero actualmente no tiene nada.
|---> **/init** : importante directorio donde se inicializa la BD (sembast), se inicializan las interfaces (repositorios, se comprueba la conectividad inicial.
|---> **/network** : función que permite la verificación, si el dispositivo tiene conección a datos o no.
|---> **/ui** : se configura la barra de mensajes (snackbar), decoración de los inputs (formularios), constantes (enum); sin uso el dialogo setup.
|---> **/utils** : las urls de la aplicación.
  **app.dart** : archivo principal para el manejos de las rutas en la aplicación, generado de los paquetes: Stacked, stack_services.  
  **app.locator.dart** : generado a partir del archivo: app.dart
  **app.router.dart** : generado a partir del archivo: app.dart
  
**/models** : todos los modelos usados en la aplicación, para su creación se utiliza el paquete freezed.

**/providers** : son las implementaciones de los repositorios (interfaces) para gestión de las diferentes vistas.

**/repositories** : interfaces a implementar en providers.

**/view** : son las pantallas o vistas de la aplicación divididas en subdirectorios.

|---> **/home** :  vista inicial luego de hacer el login, muestra la agenda.
|------------> **/widgets** : widgets usados solo para la vista home.
|------------> **home.view.dart** : es la vista reactiva no tiene la lógica del negocio, visualiza los datos.
|------------> **home.viewmodel.dart** :  es la vista modelo donde se lleva la lógica del negocio.

|---> **/login** : pantalla que solicita los datos para conectarse a la aplicación.
|------------> **/widgets** : widgets usados solo para la vista home.
|------------> **login.view.dart** : es la vista reactiva no tiene la lógica del negocio, visualiza los datos.
|------------> **login.viewmodel.dart** :  es la vista modelo donde se lleva la lógica del negocio.

> **NOTA:** las otras carpetas: patient_details, registro_clinico, user_profile tienen la misma estructura que las anteriores. Con la excepción de la carpeta: processing_data se usa para visualizar la espera o loading de la data.

**/Widgets** : Son los widgets comunes en todas las vistas o pantallas de la aplicación.

**main.dart** : Archivo principal para donde se ejecuta e inicializa la aplicación.

# Paquetes usados en la aplicación

  Iconos de font aweson:

- awesome_icons: -> <https://pub.dev/packages/awesome_icons>
  
  Seleccionar de fecha y hora:
- date_time_picker: -> <https://pub.dev/packages/date_time_picker>

  Widget que se emplea en el HomeView para mostrar solo el encabezado de la tarjeta:
- expandable: -> <https://pub.dev/packages/expandable>

  Botón flotante en el ProfileView que desplega los botones de descarga y subida de datos:
- flutter_speed_dial: -> <https://pub.dev/packages/flutter_speed_dial>
  
  Utilizado para generar los modelos:
- freezed: -> <https://pub.dev/packages/freezed>
- freezed_annotation: -> <https://pub.dev/packages/freezed_annotation>
- json_annotation: -> <https://pub.dev/packages/json_annotation>
- json_serializable: -> <https://pub.dev/packages/json_serializable>

  Utilizado para crear el patron MVMV:
- stacked: -> <https://pub.dev/packages/stacked>
- stacked_generator: -> <https://pub.dev/packages/stacked_generator>
- stacked_services: -> <https://pub.dev/packages/stacked_services>

  Utilizado para generar los singleton de los repostitorio y BD:
- get_it: -> <https://pub.dev/packages/get_it>

  Utilizado para generar el código para los modelos, servicios, sigleton del paquete anterior, desde la terminal
- build_runner: -> <https://pub.dev/packages/build_runner>
  command Line: flutter pub run build_runner build --delete-conflicting-outputs

  Para llamadas de los request al servidor:
- http: -> <https://pub.dev/packages/http>
  
  Icono que se muestra cuando se carga o descarga datos:
- loading_animations: -> <https://pub.dev/packages/loading_animations>
  
  modal que se muestro para verificar la identidad del paciente:
- rflutter_alert: -> <https://pub.dev/packages/rflutter_alert>
  
  Base de datos NoSql
- sembast: -> <https://pub.dev/packages/sembast>

# Extensiones o plugins usados en visual code

- Awesome Flutter Snippets by Neevash Ramdial
- Pubspec Assist by Jeroen Meijer
- Stacked by Yazeed AlKhalaf
- Error Lens by Alexander
- Flutter freezed Helpers by Thường Nguyễn
- Flutter by Dart Code
- Dart by Dart code
- dart-import by Luan
- Dart Data Class Generator by BendixMa
- Better Align by wwm
- Highlight Line by Clifford Fajardo
- Semantic highlighting malcolmmielle
- Tema: Tokyo Night by enkia
