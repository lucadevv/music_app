import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/ui/bloc/search/search_bloc.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class CustomSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => "Search music, artist, alb...";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        return close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchBloc>().add(SearchMusicEvent(request: query));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == SearchStatus.sucess) {
          final trackEntities = state.searchList
              .map((model) => TrackEntity.fromModel(model))
              .toList();

          return ListSearchDelegate(trackEntities: trackEntities);
        } else if (state.status == SearchStatus.error) {
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: Text('No results found.'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchBloc>().add(SearchMusicEvent(request: query));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == SearchStatus.initial) {
          final trackEntities = state.searchList
              .map((model) => TrackEntity.fromModel(model))
              .toList();

          return ListSearchDelegate(trackEntities: trackEntities);
        } else if (state.status == SearchStatus.sucess) {
          final trackEntities = state.searchList
              .map((model) => TrackEntity.fromModel(model))
              .toList();

          return ListSearchDelegate(trackEntities: trackEntities);
        } else if (state.status == SearchStatus.error) {
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: Text('No results found.'));
        }
      },
    );
  }
}

class ListSearchDelegate extends StatelessWidget {
  const ListSearchDelegate({
    super.key,
    required this.trackEntities,
  });

  final List<TrackEntity> trackEntities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: trackEntities.length,
          itemBuilder: (context, index) {
            final item = TrackEntity.fromModel(state.searchList[index]);
            List<TrackEntity> trackEntities = state.searchList
                .map((model) => TrackEntity.fromModel(model))
                .toList();
            context
                .read<PlayerBloc>()
                .add(FetcTracksEvent(listModel: trackEntities));
            final currentMusicPlaying =
                context.watch<PlayerBloc>().state.currentTrack;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
              child: ItemMusicWidget(
                trackEntity: item,
                ontap: () {
                  context.read<PlayerBloc>()
                    ..add(PlayEvent(urlMp3: item.urlMp3, index: index))
                    ..add(FetcTrackIdEvent(model: item));
                },
                isSelect: currentMusicPlaying.id == item.id,
              ),
            );
          },
        );
      },
    );
  }
}
