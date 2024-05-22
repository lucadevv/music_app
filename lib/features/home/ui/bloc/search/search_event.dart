part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMusicEvent extends SearchEvent {
  final String request;

  const SearchMusicEvent({required this.request});
  @override
  List<Object> get props => [request];
}

class ResetEvent extends SearchEvent {
  const ResetEvent();
  @override
  List<Object> get props => [];
}
