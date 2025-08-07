import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/features/user/domain/use_case/get_profile_details.dart';
import 'package:dating_app/features/user/presentation/state/profile_cubit/profile_cubit.dart';

import 'package:dating_app/locator.dart' as di;

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  final ProfileCubit checkUserStatusCubit = ProfileCubit(di.getIt<GetProfileDetails>(),
  );

  @override
  Future<void> onNavigation(
      NavigationResolver resolver,
      StackRouter router,
      ) async {
    final state = checkUserStatusCubit.state;
    if (state is ProfileLoaded) {
      resolver.next();
    } else {
      try {
        await checkUserStatusCubit.fetchProfile();
        if (checkUserStatusCubit.state is ProfileLoaded) {
          resolver.next();
        } else {
          await router.replaceAll([const SignInRoute()]);
        }
      } catch (e) {
        await router.replaceAll([const SignInRoute()]);
      }
    }
  }
}
