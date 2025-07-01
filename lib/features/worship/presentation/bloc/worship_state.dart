part of 'worship_bloc.dart';

abstract class WorshipState extends Equatable {
  const WorshipState();  

  @override
  List<Object> get props => [];
}
class WorshipInitial extends WorshipState {}
