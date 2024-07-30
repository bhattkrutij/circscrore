import 'package:circ_scrorer/cubits/auth_cubit/auth_cubit.dart';
import 'package:circ_scrorer/cubits/auth_cubit/auth_state.dart';
import 'package:circ_scrorer/screens/sign_in_screen.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/textstyles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthCubit authCubit = AuthCubit();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedOutState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return InkWell(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).logOut();
            },
            child: Container(
              width: Dimensions.width100,
              height: Dimensions.height50,
              child: Text(
                "Log out",
                style: AppTextStyles.boldBlack30,
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}