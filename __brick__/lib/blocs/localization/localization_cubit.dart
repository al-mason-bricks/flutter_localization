import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../translation/app_translations.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial()) {
    init();
  }

  void init() async {
    final Locale locale = await AppTranslation.getLocale();
    emit(LocalizationFetched(locale));
  }

  void english() async {
    const Locale englishLocale = AppTranslation.english;
    await AppTranslation.setLocal(englishLocale);
    emit(LocalizationFetched(englishLocale));
  }

  void arabic() async {
    const Locale arabicLocale = AppTranslation.arabic;
    await LocalStorageHelper.setLocal(arabicLocale);
    emit(LocalizationFetched(arabicLocale));
  }
}
