// lib/features/user/presentation/pages/profile_photo_view.dart
import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/global_widgets/custom_app_bar.dart';
import 'package:dating_app/core/global_widgets/primary_button.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/features/user/domain/use_case/upload_profile_photo.dart';
import 'package:dating_app/features/user/presentation/state/profile_photo_cubit/profile_photo_cubit.dart';
import 'package:dating_app/locator.dart' as di;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ProfilePhotoView extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePhotoView({super.key});

  @override
  State<ProfilePhotoView> createState() => _ProfilePhotoViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfilePhotoCubit>(
      create: (_) => ProfilePhotoCubit(di.getIt<UploadProfilePhoto>()),
      child: this,
    );
  }
}

class _ProfilePhotoViewState extends State<ProfilePhotoView> {
  File? _imageFile;
  final _picker = ImagePicker();

  Future<void> _showPickOptions() async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (_) => CupertinoActionSheet(
          title: const Text('Fotoğraf Kaynağı'),
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Kamera'),
              onPressed: () {
                Navigator.of(context).pop();
                _pick(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Galeri'),
              onPressed: () {
                Navigator.of(context).pop();
                _pick(ImageSource.gallery);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('İptal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      );
    } else {
      await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        builder: (_) => SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pick(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('İptal'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> _pick(ImageSource src) async {
    final picked = await _picker.pickImage(
      source: src, maxWidth: 800,
      maxHeight: 800, // or 800px tall
      imageQuality: 50,
    );
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfilePhotoCubit, ProfilePhotoState>(
      listener: (ctx, state) {
        if (state is ProfilePhotoSuccess) {
          context.router.replaceAll([const NavbarRoute()]);
        } else if (state is ProfilePhotoFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(title: 'Profil Detayı'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              46.verticalSpace,
              Text(
                'Fotoğraflarınızı Yükleyin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.verticalSpace,
              Text(
                'Resources out incentivize relaxation floor loss cc.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.verticalSpace,
              Center(
                child: GestureDetector(
                  onTap: _showPickOptions,
                  child: Container(
                    width: 140.w,
                    height: 140.w,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(24),
                        border: BoxBorder.all(
                          color: Colors.white.withValues(
                            alpha: 0.1,
                          ),
                        )),
                    child: _imageFile == null
                        ? const Icon(Icons.add, size: 48, color: Colors.white70)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.file(_imageFile!, fit: BoxFit.cover),
                          ),
                  ),
                ),
              ),
              const Spacer(),
              BlocBuilder<ProfilePhotoCubit, ProfilePhotoState>(
                builder: (ctx, state) {
                  final isLoading = state is ProfilePhotoUploading;
                  return PrimaryButton(
                    text: 'Devam Et',
                    isLoading: isLoading,
                    onPressed: (_imageFile != null && !isLoading)
                        ? () async {
                            unawaited(
                              ctx
                                  .read<ProfilePhotoCubit>()
                                  .uploadPhoto(_imageFile!),
                            );
                          }
                        : () async {
                            unawaited(
                              context.router.replaceAll([const NavbarRoute()]),
                            );
                          },
                  );
                },
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
