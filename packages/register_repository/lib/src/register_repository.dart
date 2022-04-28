import 'dart:async';

enum RegisterStatus { unknown, registered, unregistered }

class RegisterRepository {
  final _controller = StreamController<RegisterStatus>();

  Stream<RegisterStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield RegisterStatus.unregistered;
    yield* _controller.stream;
  }

  Future<void> register(
      {required String username,
      required String password,
      required String email}) async {
    print("register\n");
    await Future.delayed(const Duration(microseconds: 300),
        () => _controller.add(RegisterStatus.registered));
  }

  void dispose() => _controller.close();
}
