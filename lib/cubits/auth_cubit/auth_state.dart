part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {
  final FirebaseAuthException exceptionCode;
  RegisterFailure({
    required this.exceptionCode,
  });
}

final class LoginFailure extends AuthState {
  final FirebaseAuthException exceptionCode;
  LoginFailure({
    required this.exceptionCode,
  });
}

final class Loading extends AuthState {}
