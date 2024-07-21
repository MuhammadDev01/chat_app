import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/login/login_cubit.dart';
import 'package:flutter_application_1/cubit/register/register_cubit.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.ID: (context) => LoginPage(),
          RegisterPage.ID: (context) => RegisterPage(),
          ChatPage.ID: (context) => ChatPage(),
        },
        initialRoute: LoginPage.ID,
      ),
    );
  }
}
