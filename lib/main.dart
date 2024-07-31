import 'package:circ_scrorer/screens/sign_in_screen.dart';
import 'package:circ_scrorer/screens/splash_screen.dart';
import 'package:circ_scrorer/screens/verify_phone_number.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_constants.dart';
import 'package:circ_scrorer/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/auth_cubit/auth_state.dart';

late SharedPreferences sharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor, statusBarIconBrightness: Brightness.light // Set the desired color for this screen
      ));
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: firebaseApiKey,
    appId: firebaseAppId,
    messagingSenderId: firebaseMessagingSenderId,
    projectId: firebaseProjectId,
    storageBucket: firebaseStorageBucket,
  ));
  sharedPreferences = await SharedPreferences.getInstance();
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
            return previous is AuthInitialState;
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