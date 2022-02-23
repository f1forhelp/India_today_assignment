import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'askquestion_event.dart';
part 'askquestion_state.dart';

class AskquestionBloc extends Bloc<AskquestionEvent, AskquestionState> {
  AskquestionBloc() : super(AskquestionInitial()) {
    on<AskquestionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
