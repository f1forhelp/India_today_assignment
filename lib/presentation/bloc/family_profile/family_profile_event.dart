part of 'family_profile_bloc.dart';

@freezed
class FamilyProfileEvent with _$FamilyProfileEvent {
  const factory FamilyProfileEvent.getAllProfile() = GetAllProfile;
  const factory FamilyProfileEvent.deleteProfile({required String uuid}) =
      DeleteProfile;
  const factory FamilyProfileEvent.updateProfile(
      {required UpdateAddUserRequest updateAddUserRequest,
      required String uuid}) = UpdateProfile;
  const factory FamilyProfileEvent.createProfile(
      {required UpdateAddUserRequest updateAddUserRequest}) = CreateProfile;
  const factory FamilyProfileEvent.getLocationDetail(
      {required String locationName}) = GetLocationDetail;
}
