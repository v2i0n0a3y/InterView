import 'package:equatable/equatable.dart';

class InterviewState extends Equatable{
  final int counterValue;

  const InterviewState(this.counterValue);

  @override
  List<Object> get props => [counterValue];
}
