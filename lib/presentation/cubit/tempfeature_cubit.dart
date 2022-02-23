import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tempfeature_state.dart';

class TempfeatureCubit extends Cubit<TempfeatureState> {
  TempfeatureCubit() : super(TempfeatureInitial());
}
