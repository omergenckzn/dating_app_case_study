// lib/features/movie/presentation/pages/movie_card_detail_view.dart
import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/use_case/toggle_favorite_movie.dart'; // ← import use‐case
import 'package:dating_app/features/profile/presentation/state/favorite_movies_cubit/favorite_movies_cubit.dart';
import 'package:dating_app/locator.dart'; // ← for getIt
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

@RoutePage()
class MovieDetailView extends StatefulWidget {
  const MovieDetailView({required this.movie, super.key});
  final Movie movie;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  late final PageController _pageController;
  late final Timer _timer;
  int _current = 0;

  // local favorite state
  late bool _isFavorite;
  // use-case
  late final ToggleFavoriteMovie _toggleFavorite;

  List<String> get _images => widget.movie.images.isNotEmpty
      ? widget.movie.images
      : [widget.movie.poster];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _isFavorite = widget.movie.isFavorite;
    _toggleFavorite = getIt<ToggleFavoriteMovie>();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_images.length <= 1) return;
      _current = (_current + 1) % _images.length;
      _pageController.animateToPage(
        _current,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onHeartPressed() async {
    try {
      final result = await _toggleFavorite(widget.movie.id);
      setState(() => _isFavorite = result.movie.isFavorite);
      unawaited(context.read<FavoriteMoviesCubit>().fetchFavorites());
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Hata: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (_, i) => Image.network(
              _images[i],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Heart button
          Positioned(
            right: 16.w,
            top: MediaQuery.of(context).size.height / 2 - 24.h,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
              child: IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                icon: Icon(
                  _isFavorite ? IconlyBold.heart : IconlyLight.heart,
                  color: Colors.white,
                ),
                onPressed: _onHeartPressed,
              ),
            ),
          ),

          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
            child: Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    movie.plot,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Daha Fazlası',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
