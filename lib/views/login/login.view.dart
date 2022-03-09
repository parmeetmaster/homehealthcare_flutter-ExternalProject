// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:health_home_care/app/core/ui/input_decorations.dart';
import 'package:health_home_care/providers/notifications.provider.dart';
import 'package:health_home_care/views/login/widgets/login.widgets.dart';
import 'package:health_home_care/views/views.dart';
import 'package:health_home_care/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

/// Vista Login
/// Se muestra el formulario para de conección
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myGreenColor = Color(0xFF1aaf4d);
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => model.isConnected(),
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        /// Verifica si hay conexión a datos o no.
        /// Se verifica si hay datos en la Base de datos.
        return Scaffold(
            body: model.isBusy
                ? CheckingConnectionWidget()
                : !model.connected && (model.storesExits <= 0)
                    ? NoConnectionNoDataWidget()
                    : !model.connected && (model.storesExits > 0)
                        ? HomeView()
                        : LoginBackgroundWidget(
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                SizedBox(height: 250),
                                CardContainer(
                                    child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Iniciar Sesión',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: _myGreenColor)),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    /// Se hace llamado al widget del formulario del login
                                    _LoginForm(loginForm: model),
                                  ],
                                )),
                                SizedBox(height: 50),
                              ],
                            )),
                          ));
      },
    );
  }
}

/// Widget para el formulario del login
class _LoginForm extends StatelessWidget {
  final LoginViewModel loginForm;

  const _LoginForm({Key? key, required this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myBlueColor = Color(0xFF2184c3);

    return Form(
      key: loginForm.loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: '000000000',
                labelText: 'Identificación',
                prefixIcon: Icons.perm_identity),
            onChanged: (value) => loginForm.identifier = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'Ingrese su número de Identificación';
            },
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_open),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La Contraseña debe tener 6 carácteres';
            },
          ),
          SizedBox(height: 30),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: _myBlueColor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Text(
                    loginForm.isLoading ? 'Por favor, espere...' : 'Conectarse',
                    //'Por favor, espere... Conectarse',
                    style: TextStyle(color: Colors.white)),
              ),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      /// Validación de los campos del formulario login
                      if (!loginForm.validationFormPassed()) return;

                      loginForm.isLoading = true;

                      final isConnected = await loginForm.isConnected();

                      if (isConnected) {
                        final resp = await loginForm.getToken(
                            loginForm.identifier, loginForm.password);

                        String msgError = resp['message'];

                        print('token: ');
                        print(resp['token']['expiresAt']);

                        print('Message: ');
                        print(resp['message']);

                        if (msgError == '') {
                          /// Inserta el token en el store, BD local.
                          final id = await loginForm.insertToken(resp['token']);
                          print("Id del Token creado: ");
                          print(id);

                          /// Se navega a la vista HomeView
                          loginForm.navigateToHomeView();

                          /// Muestra mensaje en la barra de mensajes.
                          NotificationProvider.successMessageBar(
                              title: 'Operación Válida',
                              message: '¡Conectado exitosamente!');

                          loginForm.isLoading = false;
                        } else {
                          /// Muestra mensaje en la barra de mensajes.
                          NotificationProvider.errorMessageBar(
                              title: '¡Error!',
                              message: 'Credenciales Invalidas');
                          loginForm.isLoading = false;
                        }
                      }
                    })
        ],
      ),
    );
  }
}
