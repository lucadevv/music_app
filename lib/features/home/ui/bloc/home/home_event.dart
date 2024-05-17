part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchPlayListHomeEvent extends HomeEvent {
  const FetchPlayListHomeEvent();
  @override
  List<Object> get props => [];
}

class HelloEvent extends HomeEvent {
  final String name;
  const HelloEvent({required this.name});
  @override
  List<Object> get props => [];
}
