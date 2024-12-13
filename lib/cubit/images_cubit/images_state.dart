part of 'images_cubit.dart';

@immutable
sealed class ImagesState {}

final class ImagesInitial extends ImagesState {}

final class ImagesLoading extends ImagesState {}

final class ImagesSuccess extends ImagesState {
  ImagesModel imagesModel;
  ImagesSuccess({required this.imagesModel});
}

final class ImagesFailure extends ImagesState {}
