part of 'askquestion_bloc.dart';

@freezed
class AskquestionEvent with _$AskquestionEvent {
  const factory AskquestionEvent.getQuestions() = GetQuestions;
  const factory AskquestionEvent.navigateToProfile() = NavigateToProfile;
  const factory AskquestionEvent.setCategory({required String category}) =
      SetCategory;
}
