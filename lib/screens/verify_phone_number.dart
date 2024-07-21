import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:circ_scrorer/utils/shared_pref.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/custom_app_button.dart';
import '../utils/keys.dart';
import 'home_screen.dart';

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController optController = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                        controller: optController,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        decoration: inputDecorationPrimary(hintText: otpHintText)),
                    sizedBox(height: Dimensions.height30),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoggedInState) {
                          Navigator.popUntil(context, (route) => route.isFirst);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else if (state is AuthErrorState) {
                          commonScaffold(context: context, message: state.error, bgColor: errorColor);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return loaderWidget();
                        }
                        return ElevatedAppButton(
                          title: verify,
                          onTap: () {
                            BlocProvider.of<AuthCubit>(context).verifyOTP(optController.text);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}