// lib/features/authentication/domain/usecases/sign_in_user.dart
import 'package:dating_app/features/user/domain/entities/auth_result.dart';
import 'package:dating_app/features/user/domain/params/user_sign_in_params.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';
import 'package:dating_app/locator.dart' as di;
import 'package:dating_app/services/token_service.dart';

class SignInUser {
  SignInUser(this.authRepository);

  final AuthRepository authRepository;
  final TokenService _tokenService = di.getIt<TokenService>();

  /// Clears any existing token, then attempts sign-in.
  /// On success, saves the new token (persisted if rememberMe).
  Future<AuthResult> execute(
    UserSignInParams params, {
    bool rememberMe = false,
  }) async {
    await _tokenService.clearAccessToken();
    final result = await authRepository.signIn(params);

    print(result.runtimeType);

    if (result is SuccessAuthResult) {
      print('save access token');
      await _tokenService.saveAccessToken(
        result.token,
        rememberMe: rememberMe,
      );
    }
    return result;
  }
}
