part of 'askquestion_bloc.dart';

class AskquestionState extends Equatable {
  final ResultState<GetAllQuestionResponse> questionFetchState;

  const AskquestionState({required this.questionFetchState});

  AskquestionState copyWith(
      {ResultState<GetAllQuestionResponse>? questionFetchState}) {
    return AskquestionState(
        questionFetchState: questionFetchState ?? this.questionFetchState);
  }

  @override
  List<Object> get props => [questionFetchState];
}
