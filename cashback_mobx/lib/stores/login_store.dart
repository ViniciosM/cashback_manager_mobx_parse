import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  

  @observable
  String? username;

  @observable
  String? password;

  @observable
  bool visiblePassword = true;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void changeVisiblePassword() => visiblePassword = !visiblePassword;

  @action
  bool enableLogin() => username != null && password != null;


}