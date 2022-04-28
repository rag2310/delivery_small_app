import 'package:formz/formz.dart';

enum UsernameValidationError { empty, maxLength }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        if (value.length < 5) {
          return null;
        } else {
          return UsernameValidationError.maxLength;
        }
      } else {
        return UsernameValidationError.empty;
      }
    } else {
      return null;
    }
  }
}
