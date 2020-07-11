import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  // _LoginControllerBase() {
  //   autorun((_) {
  //     print(isFormValid);
  //     // print(password);
  //   });
  // }

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void tooglePassVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    Modular.to.pushReplacementNamed('/list');
    email = '';
    password = '';
  }

  @action
  void logout() {
    Modular.to.pushReplacementNamed('/');
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPassValid => password.length >= 6;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPassValid && !loading) ? login : null;
}
