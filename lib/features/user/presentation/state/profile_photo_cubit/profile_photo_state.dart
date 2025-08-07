// lib/features/user/presentation/cubit/profile_photo_state.dart

part of 'profile_photo_cubit.dart';

abstract class ProfilePhotoState {}

class ProfilePhotoInitial extends ProfilePhotoState {}

class ProfilePhotoUploading extends ProfilePhotoState {}

class ProfilePhotoSuccess extends ProfilePhotoState {
  ProfilePhotoSuccess({required this.profile});
  final UserProfile profile;
}

class ProfilePhotoFailure extends ProfilePhotoState {
  ProfilePhotoFailure({required this.message});
  final String message;
}
