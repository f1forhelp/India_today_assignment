import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:india_today_demo/data/models/response/general_response/general_response.dart';
import 'package:india_today_demo/data/models/response/get_all_relative_profile_response/get_all_relative_profile_response.dart';
import 'package:india_today_demo/data/models/response/get_location_detail_response/get_location_detail_response.dart';
import 'package:india_today_demo/data/repositories/relative_profile_repository.dart';
import 'package:india_today_demo/utils/network/result_state/result_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'family_profile_event.dart';
part 'family_profile_state.dart';
part 'family_profile_bloc.freezed.dart';

class FamilyProfileBloc extends Bloc<FamilyProfileEvent, FamilyProfileState> {
  FamilyProfileBloc()
      : super(const FamilyProfileState(
            fetchLocationState: ResultState.idle(),
            profileCreateState: ResultState.idle(),
            profileUpdateState: ResultState.idle(),
            relativesProfileFetchState: ResultState.idle(),
            profileDeleteState: ResultState.idle())) {
    on<GetAllProfile>((event, emit) async {
      await _getAllFamilyProfile(emit);
    });
    on<DeleteProfile>(
      (event, emit) async {
        await _deleteProfile(event, emit);
        await _getAllFamilyProfile(emit, showLoader: false);
      },
    );
  }

  _getAllFamilyProfile(Emitter<FamilyProfileState> emit,
      {bool showLoader = true}) async {
    if (showLoader) {
      BotToast.showLoading();
    }

    state.copyWith(relativesProfileFetchState: const ResultState.loading());
    var res = await RelativeProfileRepository.getAllRelativeProfile();
    res.when(success: (v) {
      emit(state.copyWith(
          relativesProfileFetchState: ResultState.data(data: v)));
    }, failure: (v) {
      emit(state.copyWith(
          relativesProfileFetchState: ResultState.error(error: v)));
    });
    BotToast.closeAllLoading();
  }

  _deleteProfile(DeleteProfile event, Emitter<FamilyProfileState> emit) async {
    BotToast.showLoading();
    state.copyWith(profileDeleteState: const ResultState.loading());
    var res = await RelativeProfileRepository.deleteProfile(uuid: event.uuid);
    res.when(success: (v) {
      BotToast.showText(text: v.message ?? "");
      emit(state.copyWith(profileDeleteState: ResultState.data(data: v)));
    }, failure: (e) {
      BotToast.showText(text: e.toString());
      emit(state.copyWith(profileDeleteState: ResultState.error(error: e)));
    });
  }

  _updateProfile(DeleteProfile event, Emitter<FamilyProfileState> emit) async {
    BotToast.showLoading();
    state.copyWith(profileDeleteState: const ResultState.loading());
    var res = await RelativeProfileRepository.deleteProfile(uuid: event.uuid);
    res.when(success: (v) {
      BotToast.showText(text: v.message ?? "");
      emit(state.copyWith(profileDeleteState: ResultState.data(data: v)));
    }, failure: (e) {
      BotToast.showText(text: e.toString());
      emit(state.copyWith(profileDeleteState: ResultState.error(error: e)));
    });
  }
}
