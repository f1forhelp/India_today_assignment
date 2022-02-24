import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:india_today_demo/data/models/response/get_all_question_response/datum.dart';
import 'package:india_today_demo/data/repositories/ask_question_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:india_today_demo/utils/network/result_state/result_state.dart';
import '../../../data/models/response/get_all_question_response/get_all_question_response.dart';
import '../../../utils/constants/k_url.dart';
import '../../../utils/network/network_utils.dart';

part 'askquestion_event.dart';
part 'askquestion_state.dart';
part 'askquestion_bloc.freezed.dart';

class AskquestionBloc extends Bloc<AskquestionEvent, AskquestionState> {
  GetAllQuestionResponse _getAllQuestionResponse = GetAllQuestionResponse();

  AskquestionBloc()
      : super(
          const AskquestionState(
            questionFetchState: ResultState.idle(),
            categoryNames: [],
            selectedSuggestion: [],
          ),
        ) {
    on<GetQuestions>(
      (event, emit) async {
        await _getAllQuestion(emit);
      },
    );
    on<SetCategory>(
      (event, emit) {
        _setCategory(emit, event);
      },
    );
  }

  _setCategory(Emitter<AskquestionState> emit, SetCategory event) {
    emit(
      state.copyWith(
        selectedSuggestion: _getAllQuestionResponse.data
            ?.firstWhere(
              (element) => element.name == event.category,
              orElse: () => Datum(),
            )
            .suggestions,
      ),
    );
  }

  _getAllQuestion(Emitter<AskquestionState> emit) async {
    BotToast.showLoading();
    emit(state.copyWith(questionFetchState: const ResultState.loading()));
    var res = await AskQuestionRepository.getAllQuestion();
    res.when(
      success: (v) {
        _getAllQuestionResponse = v;

        emit(
          state.copyWith(
              questionFetchState:
                  ResultState.data(data: _getAllQuestionResponse),
              categoryNames: _getAllQuestionResponse.data
                  ?.map((e) => e.name ?? "")
                  .toList()),
        );
      },
      failure: (v) {
        emit(
          state.copyWith(questionFetchState: ResultState.error(error: v)),
        );
      },
    );
    BotToast.closeAllLoading();
  }
}
