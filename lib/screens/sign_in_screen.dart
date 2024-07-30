import 'package:circ_scrorer/screens/register_screen.dart';
import 'package:circ_scrorer/screens/verify_phone_number.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../utils/app_strings.dart';
import '../utils/custom_app_button.dart';
import '../utils/diamentions.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    sizedBox(height: Dimensions.height100),
                    TextFormField(
                      controller: phoneController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(phoneNumberMaxLength), // Limit input to 10 characters
                        FilteringTextInputFormatter.digitsOnly // Allow only digits
                      ],
                      decoration: inputDecorationPrimary(hintText: hintMobileNumber),
                    ),
                    const SizedBox(height: Dimensions.height30),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthErrorState) {
                          toast(state.error);
                        }
                        print("-----------auth state${state}");
                        if (state is AuthCompleteUserProfileState) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(user: state.firebaseUser),
                            ),
                          );
                        }
                        if (state is AuthCodeSentState) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifyPhoneNumber(),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return loaderWidget();
                        }
                        return ElevatedAppButton(
                          title: signInButtonText,
                          onTap: () {
                            String phoneNumber = "$countryCode${phoneController.text}";
                            if (phoneController.text.isNotEmpty) {
                              BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                            } else {
                              toast("invalid phone number");
                            }
                          },
                        );
                      },
                    ),
                    sizedBox(height: Dimensions.height30)
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