part of 'family_profile_bloc.dart';

@freezed
class FamilyProfileEvent with _$FamilyProfileEvent {
  const factory FamilyProfileEvent.getAllProfile() = GetAllProfile;
  const factory FamilyProfileEvent.deleteProfile({required String uuid}) =
      DeleteProfile;
}
