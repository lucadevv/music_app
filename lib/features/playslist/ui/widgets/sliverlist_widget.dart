import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class SliverListWidget extends StatefulWidget {
  const SliverListWidget({
    super.key,
  });

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        if (state.status == PlayerStatus.loading) {
          return const SliverListLoadingWidget();
        } else if (state.status == PlayerStatus.sucess) {
          return SliverList.builder(
            itemCount: state.tracksList.length,
            itemBuilder: (context, index) {
              final item = state.tracksList[index];
              final indexItem = state.index;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
                child: ItemMusicWidget(
                  trackEntity: item,
                  isSelect: indexItem == index,
                  ontap: () {
                    context.read<PlayerBloc>()
                      ..add(PlayEvent(urlMp3: item.urlMp3, index: index))
                      ..add(FetcTrackIdEvent(model: item));
                  },
                ),
              );
            },
          );
        } else {
          return const SliverListLoadingWidget();
        }
      },
    );
  }
}

class SliverListLoadingWidget extends StatelessWidget {
  const SliverListLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.5),
            child: const SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  LinearLoadingWidget(height: 60, width: 60),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearLoadingWidget(height: 13, width: 150),
                        SizedBox(height: 6),
                        LinearLoadingWidget(height: 8, width: 100),
                      ],
                    ),
                  ),
                  Spacer(),
                  LinearLoadingWidget(height: 20, width: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
