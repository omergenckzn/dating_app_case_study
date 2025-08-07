

part of 'sign_in_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess({required this.token});
  final String token;
}

class SignInFailure extends SignInState {
   SignInFailure({required this.message});
  final String message;
}
