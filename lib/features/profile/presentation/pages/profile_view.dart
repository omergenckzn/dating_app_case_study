import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/assets/assets.gen.dart';
import 'package:dating_app/core/global_widgets/custom_app_bar.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/core/theme/dating_app_color.dart';
import 'package:dating_app/features/home/presentation/widgets/movie_tile.dart';
import 'package:dating_app/features/profile/presentation/state/favorite_movies_cubit/favorite_movies_cubit.dart';
import 'package:dating_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:dating_app/features/profile/presentation/widgets/token_offer_sheet.dart';
import 'package:dating_app/features/user/presentation/state/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void showTokenOfferSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: TokenOfferContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'Profil Detayı',
        action: InkWell(
          onTap: () {
            showTokenOfferSheet(context);
          },
          child: Container(
            height: 33,
            decoration: BoxDecoration(
              color: context.datingAppColor.primaryBrandColor,
              borderRadius: BorderRadius.circular(53),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.gemSvg.svg(height: 18),
                  4.horizontalSpace,
                  Text(
                    'Sınırlı Teklif',
                    style: TextStyle(
                      color: context.datingAppColor.antiFlashWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  final data = state.profile;
                  return ProfileHeader(
                    name: state.profile.name,
                    id: data.id,
                    photoUrl: data.photoUrl,
                    onAddPhoto: () async {
                      await context.router.push(const ProfilePhotoRoute());
                      unawaited(context.read<ProfileCubit>().fetchProfile());
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            24.verticalSpace,
            Text(
              'Beğendiğim Filmler',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: context.datingAppColor.antiFlashWhite,
              ),
            ),
            18.verticalSpace,
            Expanded(
              child: BlocBuilder<FavoriteMoviesCubit, FavoriteMoviesState>(
                builder: (_, state) {
                  if (state is FavoriteMoviesLoaded) {
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 260.h,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (_, index) {
                        final movie = state.movies[index];
                        return MovieTile(movie: movie);
                      },
                    );
                  }
                  if (state is FavoriteMoviesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FavoriteMoviesFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
