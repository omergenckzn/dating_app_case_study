// lib/features/user/presentation/state/register_cubit/register_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/user/domain/params/sign_up_params.dart';
import 'package:meta/meta.dart';
import 'package:dating_app/features/user/domain/entities/register_result.dart';
import 'package:dating_app/features/user/domain/use_case/sign_up_user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._signUpUser) : super(RegisterInitial());
  final SignUpUser _signUpUser;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    emit(RegisterLoading());
    try {
      final params = UserSignUpParams(
        name: name,
        email: email,
        password: password,
      );
      final result = await _signUpUser.execute(params, rememberMe: rememberMe);
      emit(RegisterSuccess(result: result));
    } catch (e) {
      emit(RegisterFailure(message: e.toString()));
    }
  }
}
