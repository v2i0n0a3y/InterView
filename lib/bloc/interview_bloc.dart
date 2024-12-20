import 'package:bloc/bloc.dart';
import 'interview_event.dart';
import 'interview_state.dart';


class InterviewBloc extends Bloc<InterviewEvent, InterviewState>{
  InterviewBloc() : super(InterviewState(0)){

    on<Increament>((event, emit){
      emit(InterviewState(state.counterValue +1));
    });

    on<Decrement>((event, emit){
      emit(InterviewState(state.counterValue -1));
    });
  }
}
