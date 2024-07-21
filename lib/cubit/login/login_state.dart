// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginFailureState extends LoginState {
  String? errMessage;
  LoginFailureState({
    this.errMessage,
  });
}
