// lib/features/movie/data/models/pagination_model.dart
import 'package:dating_app/features/home/domain/entites/pagination.dart';

class PaginationModel extends Pagination {
  const PaginationModel({
    required super.totalCount,
    required super.perPage,
    required super.maxPage,
    required super.currentPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      totalCount: json['totalCount'] as int,
      perPage: json['perPage'] as int,
      maxPage: json['maxPage'] as int,
      currentPage: json['currentPage'] as int,
    );
  }
}
