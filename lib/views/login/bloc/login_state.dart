part of 'login_bloc.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final PostApiStatus postApiSttaus;
  final String message;

  const LoginStates(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.postApiSttaus = PostApiStatus.inital});
  @override
  List<Object?> get props => [email, password, postApiSttaus,message];

  LoginStates copyWith(
      {String? email, String? password, PostApiStatus? postApiStatus,String? message }) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message?? this.message,
        postApiSttaus: postApiStatus ?? postApiSttaus);
  }
}
