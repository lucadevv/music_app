import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_favorite_music_event.dart';
part 'player_favorite_music_state.dart';

class PlayerFavoriteMusicBloc extends Bloc<PlayerFavoriteMusicEvent, PlayerFavoriteMusicState> {
  PlayerFavoriteMusicBloc() : super(PlayerFavoriteMusicInitial()) {
    on<PlayerFavoriteMusicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
