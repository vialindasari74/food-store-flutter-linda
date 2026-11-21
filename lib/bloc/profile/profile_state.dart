part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loadedProfile(CustomerModel customer) =
      _LoadedProfile;

  const factory ProfileState.updatedProfile(String message) = _UpdatedProfile;

  const factory ProfileState.failure({required Map<String, dynamic> error}) =
      _Failure;

  const factory ProfileState.error(String message) = _Error;
}
