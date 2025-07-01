import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'worship_event.dart';
part 'worship_state.dart';

class WorshipBloc extends Bloc<WorshipEvent, WorshipState> {
  WorshipBloc() : super(WorshipInitial()) {
    on<WorshipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
