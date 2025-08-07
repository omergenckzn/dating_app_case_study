import 'dart:io';

import 'package:dating_app/core/config/api_routes.dart';
import 'package:dating_app/core/network/api_response.dart';
import 'package:dating_app/features/user/data/model/register_request_model.dart';
import 'package:dating_app/features/user/data/model/register_response_model.dart';
import 'package:dating_app/features/user/data/model/user_login_request_model.dart';
import 'package:dating_app/features/user/data/model/user_login_response_model.dart';
import 'package:dating_app/features/user/data/model/user_profile_model.dart';
import 'package:dating_app/services/network_service.dart';
import 'package:dio/dio.dart';

class UserDataSource {
  const UserDataSource({
    required this.manager,
  });
  final NetworkService manager;

  Future<ApiResponse<UserLoginResponseModel>> login(
    UserLoginRequestModel requestModel,
  ) async {
    try {
      final response = await manager.post<Map<String, dynamic>>(
        ApiRoutes.login,
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data!;
        return ApiResponse.fromJson(
          responseData,
          UserLoginResponseModel.fromJson,
        );
      } else {
        final data = response.data!;
        final msg =
            (data['response'] as Map<String, dynamic>)['message'].toString();
        return ApiResponse.error(msg);
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<UserProfileModel>> getProfileDetails() async {
    final response = await manager.get<Map<String, dynamic>>(
      ApiRoutes.profile,
    );
    if (response.statusCode == 200 && response.data != null) {
      return ApiResponse.fromJson(
        response.data!,
        UserProfileModel.fromJson,
      );
    } else {
      return ApiResponse.error(response.data.toString());
    }
  }

  Future<ApiResponse<RegisterResponseModel>> register(
    RegisterRequestModel requestModel,
  ) async {
    final resp = await manager.post<Map<String, dynamic>>(
      ApiRoutes.register,
      data: requestModel.toJson(),
    );
    if (resp.statusCode == 200 && resp.data != null) {
      return ApiResponse.fromJson(
        resp.data!,
        RegisterResponseModel.fromJson,
      );
    } else {
      final msg = (resp.data?['response'] as Map<String, dynamic>)?['message']
              ?.toString() ??
          'Unknown error';
      return ApiResponse.error(msg);
    }
  }

  Future<ApiResponse<UserProfileModel>> uploadProfilePhoto(File file) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    });

    final resp = await manager.post<Map<String, dynamic>>(
      ApiRoutes.uploadPhoto,
      data: form,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    if (resp.statusCode == 200 && resp.data != null) {
      return ApiResponse.fromJson(
        resp.data!,
        UserProfileModel.fromJson,
      );
    } else {
      final msg = (resp.data?['response'] as Map<String, dynamic>?)?['message']
              ?.toString() ??
          'Photo upload failed';
      return ApiResponse.error(msg);
    }
  }
}
