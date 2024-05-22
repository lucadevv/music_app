part of 'search_bloc.dart';

enum SearchStatus { initial, loading, sucess, error }

class SearchState extends Equatable {
  final List<SearchHomeEntity> searchList;
  final SearchStatus status;
  const SearchState({
    required this.searchList,
    required this.status,
  });

  SearchState copyWith({
    List<SearchHomeEntity>? searchList,
    SearchStatus? status,
  }) =>
      SearchState(
        searchList: searchList ?? this.searchList,
        status: status ?? this.status,
      );

  factory SearchState.intial() {
    return const SearchState(
      searchList: [],
      status: SearchStatus.initial,
    );
  }
  @override
  List<Object> get props => [searchList, status];
}
