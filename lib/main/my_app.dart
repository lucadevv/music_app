import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/features/artist/data/network/datasource_artist_ntw/datasource_artist_ntw.dart';
import 'package:music_app/features/artist/data/repository/artist_repository_impl.dart';
import 'package:music_app/features/artist/ui/bloc/artist/artist_bloc.dart';
import 'package:music_app/features/home/data/local/datasource/datasource_loca_db.dart';
import 'package:music_app/features/home/data/memory/datasource_memorydb_home.dart';
import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/data/repository/download_music_repository_impl.dart';
import 'package:music_app/features/home/data/repository/favorite_music_repository_impl.dart';
import 'package:music_app/features/home/data/repository/search_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/download/download_bloc.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/home/ui/bloc/search/search_bloc.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayerBloc(audioPlayer: AudioPlayer()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => DownloadBloc(
            downloadMusicRepository: MusicDownloadRepositoryImp(
              datasourceLocalDb: DatasourceLocalDb(),
            ),
          )..add(GetALLMusicDownloadEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => FavoriteMusicBloc(
            favoriteMusicRepository: FavoriteMusicRepositoryImpl(
              datasourceMemorydbHome: DatasourceMemorydbHome(),
            ),
          )..add(const FetchAllFavoriteMusicEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SearchBloc(
            searchMusicRepository: SearchRepositoryImpl(
                datasourceNtwBdHome: DatasourceNtwBdHome()),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ArtistBloc(
            artistRepository: ArtistRepositoryImpl(
              datasourceArtistNtw: DatasourceArtistNtw(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'App Music',
        theme: darkTheme,
      ),
    );
  }
}
