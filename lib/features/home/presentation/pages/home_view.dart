// lib/features/movie/presentation/pages/home_view.dart
import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/presentation/state/movies_list_cubit/movies_list_cubit.dart';
import 'package:dating_app/features/home/domain/use_case/get_movies_list.dart';
import 'package:dating_app/features/home/presentation/widgets/movie_tile.dart';
import 'package:dating_app/locator.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeView extends StatefulWidget implements AutoRouteWrapper {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MoviesListCubit>(
      create: (_) => MoviesListCubit(
        di.getIt<GetMoviesList>(),
      )..fetchMovies(),
      child: this,
    );
  }
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final max = _scrollController.position.maxScrollExtent;
    final cur = _scrollController.position.pixels;
    if (cur >= max * .9) {
      context.read<MoviesListCubit>().fetchMovies();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Future<void> _onRefresh() => context.read<MoviesListCubit>().refresh();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MoviesListCubit, MoviesListState>(
        builder: (ctx, state) {
          if (state is MoviesListLoadInProgress &&
              state is! MoviesListLoadSuccess) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MoviesListLoadFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => ctx
                        .read<MoviesListCubit>()
                        .fetchMovies(isRefresh: true),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          if (state is MoviesListLoadSuccess) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: GridView.builder(
                controller: _scrollController,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260.h,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: state.hasReachedMax
                    ? state.movies.length
                    : state.movies.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.movies.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final movie = state.movies[index];
                  return MovieTile(movie: movie);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
