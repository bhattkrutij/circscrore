import 'package:circ_scrorer/cubits/auth_cubit/auth_state.dart';
import 'package:circ_scrorer/cubits/sign_up/register_cubit.dart';
import 'package:circ_scrorer/cubits/sign_up/register_state.dart';
import 'package:circ_scrorer/utils/custom_app_button.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:circ_scrorer/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../utils/app_constants.dart';
import '../utils/textstyles.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget with Validator {
  final _formKeys = List.generate(5, (_) => GlobalKey<FormState>());
  final TextEditingController _birthdayController = TextEditingController();
  User user;
  late final RegisterCubit? cubit;
  RegisterScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Onboarding'),
        ),
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            print("------------------state${state}");
            if (state is RegisterationCompletedState) {
              toast(state.msg);
              Navigator.popUntil(context, (route) => route.isFirst);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: state.currentStep,
                      children: [
                        _NameForm(formKey: _formKeys[0]),
                        _BirthdayForm(formKey: _formKeys[1], controller: _birthdayController),
                        _EmailForm(formKey: _formKeys[2]),
                        _CityForm(formKey: _formKeys[3]),
                        _GenderForm(formKey: _formKeys[4]),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state.currentStep > 0)
                        ElevatedAppButton(
                          title: 'Previous',
                          onTap: () => context.read<RegisterCubit>().previousStep(),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          print("===========step${state.currentStep}");
                          if (_formKeys[state.currentStep].currentState!.validate()) {
                            if (state.currentStep == 4) {
                              context.read<RegisterCubit>().updatePlayerDetails(user: user);
                            } else {
                              context.read<RegisterCubit>().nextStep();
                            }
                          }
                        },
                        child: Text(state.currentStep == 4 ? 'Finish' : 'Next'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NameForm extends StatelessWidget with Validator {
  final GlobalKey<FormState> formKey;
  _NameForm({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          validator: validateName,
          onChanged: (value) => context.read<RegisterCubit>().updateName(value),
        ),
      ),
    );
  }
}

class _BirthdayForm extends StatelessWidget with Validator {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  _BirthdayForm({required this.formKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Birthday'),
          validator: validateBirthDate,
          //   validator: (value) => validateBirthDate((value != null ? DateTime.tryParse(value) : null) as String?),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              controller.text = DateFormat('yyyy-MM-dd').format(picked); // Format date as yyyy-MM-dd
              context.read<RegisterCubit>().updateBirthday(dateFormatYYYYMMDD.format(picked));
            }
          },
        ),
      ),
    );
  }
}

class _GenderForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  _GenderForm({required this.formKey});

  @override
  State<_GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends State<_GenderForm> with Validator {
  String? selectedValue;
  late final RegisterCubit? cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<RegisterCubit>();
    cubit!.updateGender("Male");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: DropdownButtonFormField<String>(
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(hintText: 'Gender'),
          items: ["Male", "Female", "Other"].map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type, style: AppTextStyles.normalBlack16),
            );
          }).toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
            switch (value) {
              case "Male":
                cubit!.updateGender('Male'); // Set default value for Test Match
                break;
              case "Female":
                cubit!.updateGender('Female'); // Set default value for T 20
                break;
              case "Others":
                cubit!.updateGender('Others'); // Clear value for LimitedOvers
                break;
            }

            cubit!.updateGender(value!);
          },
          validator: validateGender,
        ),
      ),
    );
  }
}

class _EmailForm extends StatelessWidget with Validator {
  final GlobalKey<FormState> formKey;
  _EmailForm({required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          validator: validateEmail,
          onChanged: (value) => context.read<RegisterCubit>().updateEmail(value),
        ),
      ),
    );
  }
}

class _CityForm extends StatelessWidget with Validator {
  final GlobalKey<FormState> formKey;
  _CityForm({required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'City'),
          validator: validateCity,
          onChanged: (value) => context.read<RegisterCubit>().updateCity(value),
        ),
      ),
    );
  }
}