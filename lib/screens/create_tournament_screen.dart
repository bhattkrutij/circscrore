import 'package:circ_scrorer/cubits/tournament_cubit/tournament_form_cubit.dart';
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

class CreateTorunament extends StatelessWidget {
  const CreateTorunament({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Tournament', style: AppTextStyles.normalBlack18),
      ),
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
                              onChanged: cubit.updateName,
                              cursorColor: primaryColor,
                              keyboardType: TextInputType.text,
                              decoration: inputDecorationPrimary(hintText: "Name"),
                            ),
                            sizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(labelText: 'Tournament Type'),
                              items: ['Test Match', 'LimitedOvers', 'T 20'].map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: AppTextStyles.normalBlack16,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) => context.read<TournamentFormCubit>().updateType(value!),
                            ),
                            sizedBox(height: 10),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Start Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (selectedDate != null) {
                                  context
                                      .read<TournamentFormCubit>()
                                      .updateStartDate(DateFormat.yMd().format(selectedDate));
                                }
                              },
                              controller: TextEditingController(
                                text: context.select(
                                  (TournamentFormCubit cubit) =>
                                      cubit.state.tournamentStartDate.isEmpty ? '' : cubit.state.tournamentStartDate,
                                ),
                              ),
                            ),
                            sizedBox(height: 10),
                            TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'End Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (selectedDate != null) {
                                  context
                                      .read<TournamentFormCubit>()
                                      .updateEndDate(DateFormat.yMd().format(selectedDate));
                                }
                              },
                              controller: TextEditingController(
                                text: context.select(
                                  (TournamentFormCubit cubit) =>
                                      cubit.state.tournamentEndDate.isEmpty ? '' : cubit.state.tournamentEndDate,
                                ),
                              ),
                            ),
                            sizedBox(height: 10),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(child: ElevatedAppButton(title: "Create Tournament ", onTap: () {})),
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