// lib/features/movie/domain/entities/pagination.dart
class Pagination {
  const Pagination({
    required this.totalCount,
    required this.perPage,
    required this.maxPage,
    required this.currentPage,
  });
  final int totalCount;
  final int perPage;
  final int maxPage;
  final int currentPage;
}
