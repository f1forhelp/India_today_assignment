part of 'family_profile_bloc.dart';

class FamilyProfileState extends Equatable {
  const FamilyProfileState({required this.relativesProfileFetchState});
  final ResultState<GetAllRelativeProfileResponse> relativesProfileFetchState;

  @override
  List<Object> get props => [relativesProfileFetchState];

  FamilyProfileState copyWith(
      {ResultState<GetAllRelativeProfileResponse>?
          relativesProfileFetchState}) {
    return FamilyProfileState(
      relativesProfileFetchState:
          relativesProfileFetchState ?? this.relativesProfileFetchState,
    );
  }
}
