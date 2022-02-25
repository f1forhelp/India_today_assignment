part of 'family_profile_bloc.dart';

class FamilyProfileState extends Equatable {
  const FamilyProfileState(
      {required this.profileUpdateState,
      required this.profileCreateState,
      required this.fetchLocationState,
      required this.relativesProfileFetchState,
      required this.profileDeleteState});
  final ResultState<GetAllRelativeProfileResponse> relativesProfileFetchState;
  final ResultState<GeneralResponse> profileDeleteState;
  final ResultState<GeneralResponse> profileUpdateState;
  final ResultState<GeneralResponse> profileCreateState;
  final ResultState<GetLocationDetailResponse> fetchLocationState;

  @override
  List<Object> get props => [
        relativesProfileFetchState,
        profileCreateState,
        profileDeleteState,
        profileUpdateState,
        fetchLocationState
      ];

  FamilyProfileState copyWith(
      {ResultState<GetAllRelativeProfileResponse>? relativesProfileFetchState,
      ResultState<GeneralResponse>? profileDeleteState,
      ResultState<GeneralResponse>? profileCreateState,
      ResultState<GeneralResponse>? profileUpdateState,
      ResultState<GetLocationDetailResponse>? fetchLocationState}) {
    return FamilyProfileState(
      fetchLocationState: fetchLocationState ?? this.fetchLocationState,
      profileCreateState: profileCreateState ?? this.profileCreateState,
      profileUpdateState: profileUpdateState ?? this.profileUpdateState,
      profileDeleteState: profileDeleteState ?? this.profileDeleteState,
      relativesProfileFetchState:
          relativesProfileFetchState ?? this.relativesProfileFetchState,
    );
  }
}
