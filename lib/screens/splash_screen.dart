import 'package:circ_scrorer/screens/home_screen.dart';
import 'package:circ_scrorer/screens/sign_in_screen.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_strings.dart';
import 'package:circ_scrorer/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../utils/keys.dart';
import '../utils/textstyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    final authCubit = BlocProvider.of<AuthCubit>(context);
    if (getBoolAsync(isUserLoggedIn)) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          appName,
          style: AppTextStyles.boldPrimary30,
        ),
      ),
    );
  }
}