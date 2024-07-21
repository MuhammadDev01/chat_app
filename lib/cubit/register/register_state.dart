// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  String? successMessage;
  RegisterSuccessState({
    this.successMessage,
  });
}

class RegisterFailureState extends RegisterState {
  String? errMessage;
  RegisterFailureState({
    this.errMessage,
  });
}

class RegisterLoadingState extends RegisterState {}
