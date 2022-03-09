
class AppUrls {
 static const String baseUrl     = 'http://159.223.115.64:8000';

 // static const String baseUrl     = 'http://190.145.48.90:8087';http://159.223.115.64:8000
 // static final String baseUrl = 'http://10.0.1.108:8087';
  //static final String baseUrl     = 'http://159.223.115.64:8000';
  final String login                            = baseUrl + '/api/auth/login';
  final String schedule                         = baseUrl + '/api/v1/AgendaDomiciliaria';
  final String actividades                      = baseUrl + '/api/v1/OrdendeServicio';
  final String patientDetails                   = baseUrl + '/api/v1/Paciente';
  final String usuario                          = baseUrl + '/api/v1/User';
  final String getformularios                   = baseUrl + '/api/v1/RegistrosClinicos/master/registrosControl';
  final String registroClinico                  = baseUrl + '/api/v1/RegistroClinico';
  final String registrosClinicos                = baseUrl + '/api/v1/RegistrosClinicos';
  final String uploadSignature                  = baseUrl + '/api/v1/RegistrosClinicos';
  //

// /api/v1/RegistroClinico/{id_actividad}/saveandclose

  final String syncHccData                      = baseUrl + '/api/v1/Sincronizacion/download';
  final String syncHccUploadData                = baseUrl + '/api/v1/Sincronizacion/upload';


}