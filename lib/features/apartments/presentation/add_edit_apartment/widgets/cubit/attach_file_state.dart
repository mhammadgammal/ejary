part of 'attach_file_cubit.dart';

@immutable
sealed class AttachFileState {}

final class AttachFileInitial extends AttachFileState {}

final class FilePickedState extends AttachFileState {
  final String filePath;

  FilePickedState(this.filePath);
}
