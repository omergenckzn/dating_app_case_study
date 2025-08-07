// lib/features/user/presentation/pages/register_view.dart
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/assets/assets.gen.dart';
import 'package:dating_app/core/global_widgets/primary_button.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/core/theme/dating_app_color.dart';
import 'package:dating_app/features/user/domain/use_case/sign_up_user.dart';
import 'package:dating_app/features/user/presentation/state/sign_up_cubit/register_cubit.dart';
import 'package:dating_app/features/user/presentation/widgets/social_button.dart';
import 'package:dating_app/locator.dart' as di;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterView extends StatefulWidget implements AutoRouteWrapper {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => RegisterCubit(di.getIt<SignUpUser>()),
      child: this,
    );
  }
}

class _RegisterViewState extends State<RegisterView> {
  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  final _pass2Ctl = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _nameCtl.dispose();
    _emailCtl.dispose();
    _passCtl.dispose();
    _pass2Ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.datingAppColor;
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (ctx, state) {
        if (state is RegisterSuccess) {
          context.router.push(const ProfilePhotoRoute());
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                32.verticalSpace,
                const Text(
                  'Hoşgeldiniz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.verticalSpace,
                const Text(
                  'Tempus varius a vitae interdum id tortor elementum '
                  'tristique eleifend at.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                40.verticalSpace,

                // Name
                TextField(
                  controller: _nameCtl,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Assets.icons.addUser.svg(),
                    ),
                    hintText: 'Ad Soyad',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                16.verticalSpace,
                TextField(
                  controller: _emailCtl,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Assets.icons.message.svg(),
                    ),
                    hintText: 'E-Posta',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                16.verticalSpace,
                TextField(
                  controller: _passCtl,
                  obscureText: _obscure1,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Assets.icons.unlock.svg(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure1 ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white54,
                      ),
                      onPressed: () => setState(() => _obscure1 = !_obscure1),
                    ),
                    hintText: 'Şifre',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                16.verticalSpace,

                // Confirm Password
                TextField(
                  controller: _pass2Ctl,
                  obscureText: _obscure2,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Assets.icons.unlock.svg(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure2 ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white54,
                      ),
                      onPressed: () => setState(() => _obscure2 = !_obscure2),
                    ),
                    hintText: 'Şifre Tekrar',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                24.verticalSpace,

                // Terms
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    children: [
                      const TextSpan(
                        text: 'Kullanıcı sözleşmesini ',
                      ),
                      TextSpan(
                        text: 'okudum ve kabul ediyorum',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // open terms
                          },
                      ),
                      const TextSpan(
                        text: '. Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,

                // Register Button
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (ctx, state) {
                    final isLoading = state is RegisterLoading;
                    return PrimaryButton(
                      text: 'Şimdi Kaydol',
                      isLoading: isLoading,
                      onPressed: () async {
                        unawaited(ctx.read<RegisterCubit>().register(
                              name: _nameCtl.text.trim(),
                              email: _emailCtl.text.trim(),
                              password: _passCtl.text,
                            ),);
                      },
                    );
                  },
                ),
                24.verticalSpace,

                // Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      icon: Assets.icons.google.svg(),
                      onTap: () {},
                    ),
                    SocialButton(
                      icon: Assets.icons.apple.svg(),
                      onTap: () {},
                    ),
                    SocialButton(
                      icon: Assets.icons.facebook.svg(),
                      onTap: () {},
                    ),
                  ],
                ),
                24.verticalSpace,

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Zaten bir hesabın var mı?',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.replaceAll([const SignInRoute()]);
                      },
                      child: Text(
                        'Giriş Yap!',
                        style: TextStyle(
                          color: colors.antiFlashWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
