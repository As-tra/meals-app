import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(Loading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(exceptionCode: e as FirebaseAuthException));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(Loading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(exceptionCode: e as FirebaseAuthException));
    }
  }
}
