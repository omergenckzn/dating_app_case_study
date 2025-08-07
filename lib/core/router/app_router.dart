import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/core/router/guards/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
final class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: SignInRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: ProfilePhotoRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 500,
        ),
        AutoRoute(
          page: NavbarRoute.page,
          initial: true,
          guards: [
            AuthGuard(),
          ],
          children: [
            AutoRoute(
              initial: true,
              guards: [
                AuthGuard(),
              ],
              page: HomeRoute.page,
            ),
            AutoRoute(
              guards: [
                AuthGuard(),
              ],
              page: MovieDetailRoute.page,
            ),
            AutoRoute(
              guards: [
                AuthGuard(),
              ],
              page: ProfileRoute.page,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ];
}
