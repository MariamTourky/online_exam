import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_reset_code_state.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeCubit() : super(VerifyResetCodeInitial());
}
