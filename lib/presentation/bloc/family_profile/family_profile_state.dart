part of 'family_profile_bloc.dart';

class FamilyProfileState extends Equatable {
  const FamilyProfileState(
      {required this.relativesProfileFetchState,
      required this.profileDeleteState});
  final ResultState<GetAllRelativeProfileResponse> relativesProfileFetchState;
  final ResultState<GeneralResponse> profileDeleteState;

  @override
  List<Object> get props => [relativesProfileFetchState];

  FamilyProfileState copyWith(
      {ResultState<GetAllRelativeProfileResponse>? relativesProfileFetchState,
      ResultState<GeneralResponse>? profileDeleteState}) {
    return FamilyProfileState(
      profileDeleteState: profileDeleteState ?? this.profileDeleteState,
      relativesProfileFetchState:
          relativesProfileFetchState ?? this.relativesProfileFetchState,
    );
  }
}
