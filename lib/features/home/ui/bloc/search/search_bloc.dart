import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/domain/entites/search_entity/search_home_entity.dart';
import 'package:music_app/features/home/domain/repository/search_music_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMusicRepository searchMusicRepository;
  SearchBloc({required this.searchMusicRepository})
      : super(SearchState.intial()) {
    on<SearchMusicEvent>(searchMusicEvent);
    on<ResetEvent>(resetEvent);
  }

  Future<void> searchMusicEvent(
      SearchMusicEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    final list = [...state.searchList];
    try {
      if (event.request.isEmpty) {
        emit(state.copyWith(status: SearchStatus.initial));
      } else {
        await emit.forEach<List<SearchHomeEntity>>(
          searchMusicRepository.searchMusic(request: event.request),
          onData: (results) {
            list.clear();
            list.addAll(results);
            return state.copyWith(
              status: SearchStatus.sucess,
              searchList: list,
            );
          },
          onError: (_, __) => state.copyWith(
            status: SearchStatus.error,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error));
    }
  }

  Future<void> resetEvent(ResetEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.initial));
  }
}
