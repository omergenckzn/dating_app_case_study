// lib/features/user/presentation/state/register_cubit/register_state.dart

part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterSuccess({required this.result});
  final RegisterResult result;
}

class RegisterFailure extends RegisterState {
  RegisterFailure({required this.message});
  final String message;
}
