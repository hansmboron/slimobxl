import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';
import 'widgets/custom-text-field.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  // @override
  // void didChangeDependencies() {
  //   autorun((_) {
  //     if (controller.loggedIn) {
  //       Modular.to.pushNamed("/list");
  //     }
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(30),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Observer(builder: (_) {
                  return CustomTextField(
                    hint: "Email",
                    prefix: Icon(Icons.account_circle),
                    textInputType: TextInputType.emailAddress,
                    enabled: !controller.loading,
                    onChanged: controller.setEmail,
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return CustomTextField(
                    hint: "Senha",
                    prefix: Icon(Icons.lock),
                    obscure: !controller.passwordVisible,
                    enabled: !controller.loading,
                    onChanged: controller.setPassword,
                    sufix: IconButton(
                      icon: Icon(controller.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.tooglePassVisibility,
                    ),
                  );
                }),
                const SizedBox(height: 24),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 50,
                    // width: controller.loading ? 50 : null,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: controller.loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(" Login "),
                      color: Theme.of(context).primaryColor,
                      disabledColor:
                          Theme.of(context).primaryColor.withAlpha(100),
                      textColor: Colors.white,
                      onPressed: controller.loginPressed,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
