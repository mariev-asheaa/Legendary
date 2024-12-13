part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final PopularModel popularModel;

  SearchSuccess(this.popularModel);
}

final class SearchFauilre extends SearchState {
  final String errorMessage;
  SearchFauilre(this.errorMessage);
}
