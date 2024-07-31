import 'package:circ_scrorer/cubits/tournament_cubit/tournament_form_cubit.dart';
import 'package:circ_scrorer/utils/app_constants.dart';
import 'package:circ_scrorer/utils/custom_app_button.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:circ_scrorer/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/common.dart';
import '../utils/textstyles.dart';
import '../utils/widgets.dart';

class CreateTournament extends StatelessWidget {
  const CreateTournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TournamentFormCubit(),
      child: const CreateTournamentView(),
    );
  }
}

class CreateTournamentView extends StatefulWidget {
  const CreateTournamentView({super.key});

  @override
  State<CreateTournamentView> createState() => _CreateTournamentViewState();
}

class _CreateTournamentViewState extends State<CreateTournamentView> with Validator {
  final _formKey = GlobalKey<FormState>();
  late final TournamentFormCubit? cubit;
  String selectedType = typeT20;
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  void initState() {
    super.initState();
    cubit = context.read<TournamentFormCubit>();
    cubit!.updateOvers(twentyOvers);
    cubit!.updateType(typeT20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(createTournament, style: AppTextStyles.normalBlack18)),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocSelector<TournamentFormCubit, TournamentFormState, bool>(
                // bloc: cubit,
                selector: (state) => state.isLoading,
                builder: (context, isLoading) {
                  print("====================isloading${isLoading}");
                  return Expanded(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: context.select((TournamentFormCubit cubit) => cubit.state.autovalidateMode),
                        child: Column(
                          children: [
                            TextFormField(
                                validator: validateName,
                                onChanged: (value) => context.read<TournamentFormCubit>().updateName(value),
                                cursorColor: primaryColor,
                                keyboardType: TextInputType.text,
                                decoration: inputDecorationPrimary(hintText: name)),
                            sizedBox(height: Dimensions.height10),
                            DropdownButtonFormField<String>(
                              autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecoration(hintText: tournamentType),
                              items: [typeTest, typeT20, typeLimitedOvers].map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type, style: AppTextStyles.normalBlack16),
                                );
                              }).toList(),
                              value: selectedType,
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value!;
                                });
                                switch (value) {
                                  case typeTest:
                                    cubit!.updateOvers(fiftyOvers); // Set default value for Test Match
                                    break;
                                  case typeT20:
                                    cubit!.updateOvers(twentyOvers); // Set default value for T 20
                                    break;
                                  case typeLimitedOvers:
                                    cubit!.updateOvers(''); // Clear value for LimitedOvers
                                    break;
                                }

                                context.read<TournamentFormCubit>().updateType(value);
                              },
                              validator: validateType,
                            ),
                            sizedBox(height: 10),
                            if (selectedType == typeLimitedOvers)
                              TextFormField(
                                  validator: validateOvers,
                                  onChanged: (value) {
                                    cubit!.updateOvers(value);
                                  },
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.text,
                                  decoration: inputDecorationPrimary(hintText: overs)),
                            sizedBox(height: 10),
                            TextFormField(
                              validator: validateStartDate,
                              readOnly: true,
                              decoration:
                                  const InputDecoration(labelText: startDate, suffixIcon: Icon(Icons.calendar_today)),
                              onTap: () async {
                                _startDate = await showDatePicker(
                                    context: context,
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: commonAppThemeForCalender(),
                                        child: child ?? Text(""),
                                      );
                                    },
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101));
                                if (_startDate != null) {
                                  cubit!.updateStartDate(DateFormat.yMd().format(_startDate!));
                                }
                              },
                              controller: TextEditingController(
                                text: context.select(
                                  (TournamentFormCubit cubit) =>
                                      cubit.state.startDate.isEmpty ? '' : cubit.state.startDate,
                                ),
                              ),
                            ),
                            sizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                return validateEndDate(value, _startDate);
                              },
                              readOnly: true,
                              decoration:
                                  const InputDecoration(labelText: endDate, suffixIcon: Icon(Icons.calendar_today)),
                              onTap: () async {
                                _endDate = await showDatePicker(
                                    context: context,
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: commonAppThemeForCalender(),
                                        child: child ?? Text(""),
                                      );
                                    },
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101));
                                if (_endDate != null) {
                                  cubit!.updateEndDate(DateFormat.yMd().format(_endDate!));
                                }
                              },
                              controller: TextEditingController(
                                text: context.select((TournamentFormCubit cubit) =>
                                    cubit.state.endDate.isEmpty ? '' : cubit.state.endDate),
                              ),
                            ),
                            sizedBox(height: 10),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    child: isLoading
                                        ? loaderWidget()
                                        : ElevatedAppButton(
                                            title: createTournament,
                                            onTap: () {
                                              if (_formKey.currentState!.validate()) {
                                                cubit!.addTournament();
                                              }
                                            })),
                              ),
                            )
                          ],
                        )),
                  );
                })
          ],
        ),
      ),
    );
  }
}