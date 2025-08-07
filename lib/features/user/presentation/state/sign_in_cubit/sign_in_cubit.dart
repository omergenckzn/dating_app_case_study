import 'package:dating_app/features/user/domain/entities/auth_result.dart';
import 'package:dating_app/features/user/domain/params/user_sign_in_params.dart';
import 'package:dating_app/features/user/domain/use_case/sign_in_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUser) : super(SignInInitial());
  final SignInUser _signInUser;

  Future<void> signIn({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    emit(SignInLoading());
    final params = UserSignInParams(email: email, password: password);
    final result = await _signInUser.execute(params, rememberMe: rememberMe);

    if (result is SuccessAuthResult) {
      emit(SignInSuccess(token: result.token));
    } else if (result is FailureAuthResult) {
      emit(SignInFailure(message: result.message));
    } else {
      emit(SignInFailure(message: 'Unexpected error'));
    }
  }
}
