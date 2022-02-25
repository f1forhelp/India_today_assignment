part of 'askquestion_bloc.dart';

class AskquestionState extends Equatable {
  final ResultState<GetAllQuestionResponse> questionFetchState;
  final List<String> categoryNames;
  final List<String> selectedSuggestion;
  const AskquestionState(
      {required this.selectedSuggestion,
      required this.questionFetchState,
      required this.categoryNames});

  AskquestionState copyWith(
      {List<String>? selectedSuggestion,
      ResultState<GetAllQuestionResponse>? questionFetchState,
      List<String>? categoryNames}) {
    return AskquestionState(
      selectedSuggestion: selectedSuggestion ?? this.selectedSuggestion,
      categoryNames: categoryNames ?? this.categoryNames,
      questionFetchState: questionFetchState ?? this.questionFetchState,
    );
  }

  @override
  List<Object> get props =>
      [questionFetchState, selectedSuggestion, categoryNames];
}
