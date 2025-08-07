// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dating_app/features/home/domain/entites/movie.dart' as _i10;
import 'package:dating_app/features/home/presentation/pages/home_view.dart'
    as _i1;
import 'package:dating_app/features/home/presentation/pages/movie_detail_view.dart'
    as _i2;
import 'package:dating_app/features/nav_bar/presentation/nav_bar_view.dart'
    as _i3;
import 'package:dating_app/features/profile/presentation/pages/profile_view.dart'
    as _i5;
import 'package:dating_app/features/splash/presentation/splash_view.dart'
    as _i8;
import 'package:dating_app/features/user/presentation/pages/profile_photo_view.dart'
    as _i4;
import 'package:dating_app/features/user/presentation/pages/register_page.dart'
    as _i6;
import 'package:dating_app/features/user/presentation/pages/sign_in_page.dart'
    as _i7;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i1.HomeView());
    },
  );
}

/// generated route for
/// [_i2.MovieDetailView]
class MovieDetailRoute extends _i9.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required _i10.Movie movie,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            movie: movie,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i2.MovieDetailView(
        movie: args.movie,
        key: args.key,
      );
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    required this.movie,
    this.key,
  });

  final _i10.Movie movie;

  final _i11.Key? key;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movie: $movie, key: $key}';
  }
}

/// generated route for
/// [_i3.NavbarView]
class NavbarRoute extends _i9.PageRouteInfo<void> {
  const NavbarRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavbarView();
    },
  );
}

/// generated route for
/// [_i4.ProfilePhotoView]
class ProfilePhotoRoute extends _i9.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfilePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i4.ProfilePhotoView());
    },
  );
}

/// generated route for
/// [_i5.ProfileView]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileView();
    },
  );
}

/// generated route for
/// [_i6.RegisterView]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i6.RegisterView());
    },
  );
}

/// generated route for
/// [_i7.SignInView]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i7.SignInView());
    },
  );
}

/// generated route for
/// [_i8.SplashView]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashView();
    },
  );
}
