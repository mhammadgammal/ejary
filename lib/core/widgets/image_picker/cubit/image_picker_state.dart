part of 'image_picker_cubit.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ImagePickedState extends ImagePickerState {
  final String imagePath;

  ImagePickedState(this.imagePath);
}
