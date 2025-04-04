import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/sign_in/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> getUserData() async {
    try {
      final userResponse = await DbHelper.getAll(TableName.userTable);
      userModel = UserModel.fromJson(userResponse.first);
      phoneNumberController.text = userModel!.phoneNumber;
      currentPasswordController.text = userModel!.password;
      confirmPasswordController.text = userModel!.password;
      emit(GetUserDataSuccessState());
    } catch (e) {
      emit(GetUserDataErrorState(e.toString()));
    }
  }

  Future<void> updateUserData() async {
    final tmpUser = UserModel(
      id: userModel!.id,
      name: userModel!.name,
      email: userModel!.email,
      phoneNumber: phoneNumberController.text,
      password: currentPasswordController.text,
      profilePicturePath: userModel!.profilePicturePath,
    );
    try {
      await DbHelper.updateData(
        TableName.userTable,
        tmpUser.toJson(),
        'id = ?',
        [tmpUser.id],
      );
      getUserData();
      emit(UpdateUserDataSuccessState());
    } catch (e) {
      emit(GetUserDataErrorState(e.toString()));
    }
  }
}
