import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errMessage: 'user not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(errMessage: 'worng Password'));
      } else {
        emit(LoginFailureState(errMessage: 'something went wrong !'));
      }
    }
  }
}
