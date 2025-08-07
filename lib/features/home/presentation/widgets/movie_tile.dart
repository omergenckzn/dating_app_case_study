import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final radius = 16.r;
    return GestureDetector(
      onTap: () => context.router.push(MovieDetailRoute(movie: movie)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster image
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                movie.images.isNotEmpty ? movie.images[0] : movie.poster,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            movie.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            movie.director,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
