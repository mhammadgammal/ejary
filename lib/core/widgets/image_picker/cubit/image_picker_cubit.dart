import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());

  static ImagePickerCubit get(context) => BlocProvider.of(context);

  String imagePath = '';
  String imageName = '';

  Future<FilePickerResult?> _openPicker() async =>
      await FilePicker.platform.pickFiles();

  Future<void> pickProfilePic() async {
    final result = await _openPicker();
    if (result != null) {
      imagePath = result.files.single.path!;
      imageName = result.files.single.name;
      'AddEmployeeCubit: pickProfilePic: $imagePath'.logger();
      emit(ImagePickedState(imagePath));
    }
  }
}
