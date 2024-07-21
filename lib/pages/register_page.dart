import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_textFormField.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/cubit/register/register_cubit.dart';
import 'package:flutter_application_1/helper/show_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static String ID = 'RegisterPage';

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        } else if (state is RegisterSuccessState) {
          showSnackBar(context, state.successMessage!);
          isLoading = false;
        } else if (state is RegisterFailureState) {
          showSnackBar(context, state.errMessage!);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                    'REGISTER',
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
                  ),
                  CustomButton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context)
                            .registerUser(email: email!, password: password!);
                      }
                    },
                    textbutton: 'REGISTER',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have account ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '  LOGIN',
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
      ),
    );
  }
}
