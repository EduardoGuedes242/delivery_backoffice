import '../../models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> Login(String email, String password);
}
