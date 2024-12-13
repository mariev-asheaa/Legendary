part of 'detailes_cubit.dart';

@immutable
sealed class DetailesState {}

final class DetailesInitial extends DetailesState {}

final class DetailesLoading extends DetailesState {}
final class DetailesSucces extends DetailesState {
  DetailesModel detailesModel;
  DetailesSucces({required this.detailesModel});
}
final class DetailesFailure extends DetailesState {}
