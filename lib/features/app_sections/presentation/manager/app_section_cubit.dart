import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'app_section_states.dart';

@injectable
class AppSectionCubit extends Cubit<AppSectionStates> {
  AppSectionCubit() : super(AppSectionStates(selectedIndex: 0));

  void updateIndex(int index) {
    emit(AppSectionStates(selectedIndex: index));
  }
}
