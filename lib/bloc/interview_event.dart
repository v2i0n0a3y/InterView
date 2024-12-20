import 'package:equatable/equatable.dart';

abstract class InterviewEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class Increament extends InterviewEvent{}
class Decrement extends InterviewEvent{}


