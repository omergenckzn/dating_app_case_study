// lib/features/user/domain/use_case/sign_up_user.dart
import 'package:dating_app/features/user/domain/params/sign_up_params.dart';
import 'package:dating_app/locator.dart' as di;
import 'package:dating_app/services/token_service.dart';
import 'package:dating_app/features/user/domain/entities/register_result.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';

class SignUpUser {
  SignUpUser(this.authRepository);

  final AuthRepository authRepository;
  final TokenService _tokenService = di.getIt<TokenService>();

  Future<RegisterResult> execute(
    UserSignUpParams params, {
    bool rememberMe = true,
  }) async {
    await _tokenService.clearAccessToken();
    final res = await authRepository.register(params);
    await _tokenService.saveAccessToken(res.token, rememberMe: rememberMe);
    return res;
  }
}
