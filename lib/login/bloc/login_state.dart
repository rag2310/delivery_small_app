part of 'login_bloc.dart';

enum NavigationStatus { quiet, navigateToRegister }

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.navigationStatus = NavigationStatus.quiet});

  final FormzStatus status;
  final NavigationStatus navigationStatus;
  final Username username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    NavigationStatus? navigationStatus,
  }) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        navigationStatus: navigationStatus ?? this.navigationStatus);
  }

  @override
  List<Object> get props => [status, username, password, navigationStatus];
}
