part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}
final class PopularSuccess extends PopularState {
  PopularModel popularModel;
  PopularSuccess({required this.popularModel});
}
final class PopularFailure extends PopularState {
  String errormessage;
  PopularFailure({required this.errormessage});
}
