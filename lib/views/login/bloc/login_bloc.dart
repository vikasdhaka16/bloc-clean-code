import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/services/session_manager/session_controller.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/auth/login_repository.dart';
import '../../../utils/enums.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvemts, LoginStates> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitButton>(_submitButton);
  }

  FutureOr<void> _onEmailChanged(
      EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _submitButton(
      SubmitButton event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then(
      (value) async {
        if (value.error.isNotEmpty) {
          emit(state.copyWith(
              message: value.error.toString(),
              postApiStatus: PostApiStatus.error));
        } else {
          await SessionController().saveUserInPreference(value);
          await SessionController().getUserFromPrefernce();
          emit(state.copyWith(
              postApiStatus: PostApiStatus.success,
              message: 'Login Successful'));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }
}
