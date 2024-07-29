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
  final TournamentFormCubit cubit = TournamentFormCubit();
  final _formKey = GlobalKey<FormState>();
  String selectedType = typeT20;
  @override
  void initState() {
    super.initState();
    context.read<TournamentFormCubit>().updateOvers("20");
    context.read<TournamentFormCubit>().updateType(typeT20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Tournament', style: AppTextStyles.normalBlack18)),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocSelector<TournamentFormCubit, TournamentFormState, AutovalidateMode>(
                bloc: cubit,
                selector: (state) => state.autovalidateMode,
                builder: (context, AutovalidateMode autovalidateMode) {
                  return Expanded(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          children: [
                            TextFormField(
                                validator: validateName,
                                onChanged: (value) => context.read<TournamentFormCubit>().updateName(value),
                                cursorColor: primaryColor,
                                keyboardType: TextInputType.text,
                                decoration: inputDecorationPrimary(hintText: "Name")),
                            sizedBox(height: Dimensions.height10),
                            DropdownButtonFormField<String>(
                              autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecoration(hintText: 'Tournament Type'),
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
                                    cubit.updateOvers('50'); // Set default value for Test Match
                                    break;
                                  case typeT20:
                                    cubit.updateOvers('20'); // Set default value for T 20
                                    break;
                                  case typeLimitedOvers:
                                    cubit.updateOvers(''); // Clear value for LimitedOvers
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
                                    context.read<TournamentFormCubit>().updateOvers(value);
                                  },
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.text,
                                  decoration: inputDecorationPrimary(hintText: "Overs")),
                            sizedBox(height: 10),
                            TextFormField(
                              validator: validateStartDate,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  labelText: 'Start Date', suffixIcon: Icon(Icons.calendar_today)),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (selectedDate != null) {
                                  context
                                      .read<TournamentFormCubit>()
                                      .updateStartDate(DateFormat.yMd().format(selectedDate));
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
                              validator: validateEndDate,
                              readOnly: true,
                              decoration:
                                  const InputDecoration(labelText: 'End Date', suffixIcon: Icon(Icons.calendar_today)),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (selectedDate != null) {
                                  context
                                      .read<TournamentFormCubit>()
                                      .updateEndDate(DateFormat.yMd().format(selectedDate));
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
                                    child: ElevatedAppButton(
                                        title: "Create Tournament ",
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            BlocProvider.of<TournamentFormCubit>(context).addTournament();
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