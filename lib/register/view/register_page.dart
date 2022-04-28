import 'package:delivery_small_app/register/bloc/register_bloc.dart';
import 'package:delivery_small_app/register/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_repository/register_repository.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            RegisterRepository test = RepositoryProvider.of<RegisterRepository>(context);
            return RegisterBloc(
                registerRepository:
                    RepositoryProvider.of<RegisterRepository>(context));
          },
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
