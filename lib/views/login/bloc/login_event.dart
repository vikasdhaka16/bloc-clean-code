part of 'login_bloc.dart';

abstract class LoginEvemts extends Equatable {
  const LoginEvemts();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvemts {
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvemts {
  final String password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class EmailUnfocussed extends LoginEvemts {}

class PasswordUnfocussed extends LoginEvemts {}

class SubmitButton extends LoginEvemts {}
