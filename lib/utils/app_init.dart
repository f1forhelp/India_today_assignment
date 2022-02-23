import 'package:get_it/get_it.dart';
import 'package:india_today_demo/presentation/bloc/ask_question/askquestion_bloc.dart';

class AppInit {
  AppInit._();
  static GetIt getIt = GetIt.I;

  static initGetIt() {
    getIt.registerFactory(() => AskquestionBloc());
  }
}
