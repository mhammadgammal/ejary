import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EjaryObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'onCreate -- ${bloc.runtimeType}'.logger();
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'onChange -- ${bloc.runtimeType}, $change'.logger();
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    'onError -- ${bloc.runtimeType}, $error'.logger();
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    'onClose -- ${bloc.runtimeType}'.logger();
  }
}
