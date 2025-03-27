import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_properties_state.dart';

class AllPropertiesCubit extends Cubit<AllPropertiesState> {
  int availableProperties = 12;

  AllPropertiesCubit() : super(AllPropertiesInitial());

  static AllPropertiesCubit get(BuildContext context) =>
      BlocProvider.of(context);
}
