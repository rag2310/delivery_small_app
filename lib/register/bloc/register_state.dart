part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  final FormzStatus status;
  final Username username;
  final Email email;
  final Password password;

  RegisterState copyWith(
      {FormzStatus? status,
      Username? username,
      Email? email,
      Password? password}) {
    return RegisterState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email);
  }

  @override
  List<Object?> get props => [status, username, email, password];
}
