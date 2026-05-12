import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'app_section_states.dart';

@injectable
class AppSectionCubit extends Cubit<AppSectionStates> {
  final SharedPrefsService sharedPrefsService;

  AppSectionCubit(this.sharedPrefsService)
    : super(AppSectionStates(selectedIndex: 0));

  void updateIndex(int index) async {
    final token = await sharedPrefsService.getToken();
    if (token == null) {
      emit(AppSectionStates(selectedIndex: 0));
    } else {
      emit(AppSectionStates(selectedIndex: index));
    }
  }
}
