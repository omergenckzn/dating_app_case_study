// lib/features/user/presentation/cubit/profile_state.dart

part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({required this.profile});
  final UserProfile profile;
}

class ProfileFailure extends ProfileState {
  ProfileFailure({required this.message});
  final String message;
}
