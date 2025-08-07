// lib/features/user/presentation/cubit/profile_cubit.dart

import 'package:dating_app/features/user/domain/use_case/get_profile_details.dart';
import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit(this._getProfileDetails) : super(ProfileInitial());
  final GetProfileDetails _getProfileDetails;

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final  profile = await _getProfileDetails();
      emit(ProfileLoaded(profile: profile));
    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }
}
