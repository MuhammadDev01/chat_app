import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> registerUser(
      {required String email, required String password}) async {
        emit(RegisterLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState(successMessage: 'Success registeration !'));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(RegisterFailureState(errMessage: 'Weak Password !'));
      } else if (error.code == 'email-already-in-use') {
        emit(RegisterFailureState(errMessage: 'Email already in use !'));
      } else {
        emit(RegisterFailureState(errMessage: 'Something went wrong !'));
      }
    }
  }
}
