// lib/features/user/presentation/cubit/profile_photo_cubit.dart

import 'dart:io';
import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:dating_app/features/user/domain/use_case/upload_profile_photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_photo_state.dart';

class ProfilePhotoCubit extends Cubit<ProfilePhotoState> {
  ProfilePhotoCubit(this._uploadProfilePhoto) : super(ProfilePhotoInitial());
  final UploadProfilePhoto _uploadProfilePhoto;

  Future<void> uploadPhoto(File imageFile) async {
    emit(ProfilePhotoUploading());
    try {
      final updatedProfile = await _uploadProfilePhoto(imageFile);
      emit(ProfilePhotoSuccess(profile: updatedProfile));
    } catch (e) {
      emit(ProfilePhotoFailure(message: e.toString()));
    }
  }
}
