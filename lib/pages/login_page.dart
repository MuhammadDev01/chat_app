import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_textFormField.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/cubit/login/login_cubit.dart';
import 'package:flutter_application_1/helper/show_snack_bar.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String? email;
  static String ID = 'LoginPage';
  String? password;

  bool isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          Navigator.pushNamed(context, ChatPage.ID);
          isLoading = false;
        } else if (state is LoginFailureState) {
          showSnackBar(context, state.errMessage!);

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 75,
                          ),
                          Image.asset(
                            Klogo,
                          ),
                          const Text(
                            'Scholar Chat',
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.white,
                              fontFamily: 'pacifico',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hinttext: 'Email',
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hinttext: 'Password',
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                      obscureText: true,
                    ),
                    CustomButton(
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .loginUser(email: email!, password: password!);
                        }
                      },
                      textbutton: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have account ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterPage.ID);
                          },
                          child: const Text(
                            '  REGISTER',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
