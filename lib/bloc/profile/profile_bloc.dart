import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/customer_model.dart';
import 'package:flutter_foodstore/resource/remote/profile_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRemoteResource profileRemoteResource;

  ProfileBloc(this.profileRemoteResource) : super(_Initial()) {
    on<_LoadProfile>((event, emit) async {
      final result = await profileRemoteResource.fetchProfile();
      result.fold(
        (error) => emit(ProfileState.error(error)),
        (profile) => emit(ProfileState.loadedProfile(profile)),
      );
    });

    on<_UpdateProfile>((event, emit) async {
      final result = await profileRemoteResource.updateProfile(
        name: event.name,
        email: event.email,
        image: event.image,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );
      result.fold(
        (error) => emit(ProfileState.failure(error: error)),
        (message) => emit(ProfileState.updatedProfile(message)),
      );
    });
  }
}
