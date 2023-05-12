import 'dart:developer';
import 'package:mobx/mobx.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../services/auth/login_service.dart';
part 'login_controller.g.dart';

enum LoginStateStatus {
  initial,
  loading,
  success,
  error,
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginService _loginService;

  @readonly
  var _loginStatus = LoginStateStatus.initial;
  String? errorMessage;

  LoginControllerBase(this._loginService);

  Future<void> login(String email, String password) async {
    try {
      _loginStatus = LoginStateStatus.loading;

      await _loginService.execute(email, password);
      _loginStatus = LoginStateStatus.success;
    } on UnauthorizedException {
      errorMessage = 'Logim ou senha Inavalidos';
      _loginStatus = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _loginStatus = LoginStateStatus.error;
    }
  }
}
