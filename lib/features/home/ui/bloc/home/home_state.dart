part of 'home_bloc.dart';

enum HomeStatus { initial, loading, sucess, error }

class HomeState extends Equatable {
  final List<PlayListHomeEntity> plalistHomeEntity;
  final HomeStatus homeStatus;
  const HomeState({
    required this.plalistHomeEntity,
    required this.homeStatus,
  });

  HomeState copyWith({
    List<PlayListHomeEntity>? plalistHomeEntity,
    HomeStatus? homeStatus,
  }) =>
      HomeState(
        plalistHomeEntity: plalistHomeEntity ?? this.plalistHomeEntity,
        homeStatus: homeStatus ?? this.homeStatus,
      );

  @override
  List<Object> get props => [plalistHomeEntity, homeStatus];
}
