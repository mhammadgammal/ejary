import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'attach_file_state.dart';

class AttachFileCubit extends Cubit<AttachFileState> {
  AttachFileCubit() : super(AttachFileInitial());

  static AttachFileCubit get(context) => BlocProvider.of(context);

  String filePath = '';
  String fileName = '';

  Future<FilePickerResult?> _openPicker() async => await FilePicker.platform
      .pickFiles(allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png']);

  bool showContract = false;

  Future<void> pickProfilePic() async {
    final result = await _openPicker();
    if (result != null) {
      filePath = result.files.single.path!;
      fileName = result.files.single.name;
      'AddEmployeeCubit: pickProfilePic: $filePath'.logger();
      emit(FilePickedState(filePath));
    }
  }

  void changeContractVisibility() {
    showContract = !showContract;
    emit(ChangeContractVisibilityState());
  }
}
