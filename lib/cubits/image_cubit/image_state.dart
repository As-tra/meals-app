part of 'image_cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageUploadSucceeded extends ImageState {}

final class ImageUploadFailed extends ImageState {}