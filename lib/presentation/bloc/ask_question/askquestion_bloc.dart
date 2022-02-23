import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:india_today_demo/data/repositories/ask_question_repository_impl.dart';

import '../../../data/models/response/get_all_question_response/get_all_question_response.dart';
import '../../../utils/constants/k_url.dart';
import '../../../utils/network/network_utils.dart';

part 'askquestion_event.dart';
part 'askquestion_state.dart';

class AskquestionBloc extends Bloc<AskquestionEvent, AskquestionState> {
  AskquestionBloc() : super(AskquestionInitial()) {
    on<AskquestionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  getAllQuestions() async {
    final NetworkUtil _networkUtil = NetworkUtil(baseUrl: KUrl.baseUrl);
    var res =
        await _networkUtil.get<GetAllQuestionResponse>(KUrl.getAllQuestion);
    print(res);
    // await AskQuestionRepositoryImpl.getAllQuestion();
  }
}
