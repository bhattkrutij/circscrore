import 'package:circ_scrorer/screens/sign_in_screen.dart';
import 'package:circ_scrorer/screens/splash_screen.dart';
import 'package:circ_scrorer/screens/verify_phone_number.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_constants.dart';
import 'package:circ_scrorer/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/auth_cubit/auth_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: firebaseApiKey,
    appId: firebaseAppId,
    messagingSenderId: firebaseMessagingSenderId,
    projectId: firebaseProjectId,
    storageBucket: firebaseStorageBucket,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) {
            return previous is AuthInitianState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return const SplashScreen();
            } else if (state is AuthLoggedOutState) {
              return const SignInScreen();
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}