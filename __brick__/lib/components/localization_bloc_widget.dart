import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/localization/localization_cubit.dart';

class LocalizationBlocWidget extends StatelessWidget {
  const LocalizationBlocWidget({super.key, required this.builder});

  final Function(Locale locale) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationCubit(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (_, state) {
        if (state is! LocalizationFetched) {
          //FIXME:: change loading widget to something better
          return const Text('Fetching localization...');
        }

        return builder(state.locale);
      }),
    );
  }
}
