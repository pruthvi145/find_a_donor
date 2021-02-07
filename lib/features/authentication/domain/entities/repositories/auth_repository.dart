import 'package:dartz/dartz.dart';
import 'package:find_a_donor/core/error/failure.dart';

import '../auth_data.dart';

abstract class AuthRepository {
  AuthData user;

  Future<Either<Failure, AuthData>> sendCode(String countryCode, String number);
  Future<Either<Failure, AuthData>> verifyCode(
    String countryCode,
    String number,
    String code,
  );
  void forgotPassword();
}
