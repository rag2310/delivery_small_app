import 'package:bloc/bloc.dart';
import 'package:delivery_small_app/register/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:register_repository/register_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository,
        super(const RegisterState()) {
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final RegisterRepository _registerRepository;

  void _onUsernameChanged(
      RegisterUsernameChanged event, Emitter<RegisterState> emit) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
        username: username,
        status: Formz.validate([state.password, state.email, username])));
  }

  void _onPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password,
        status: Formz.validate([state.username, state.email, password])));
  }

  void _onEmailChanged(
      RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
        email: email,
        status: Formz.validate([state.password, state.username, email])));
  }

  void _onSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    print("_onSubmitted\n");
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _registerRepository.register(
            username: state.username.value,
            password: state.password.value,
            email: state.email.value);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
