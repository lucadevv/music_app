import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';
import 'package:music_app/features/playslist/ui/screen/playslist_screen.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class PlayListhWidget extends StatelessWidget {
  const PlayListhWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeStatus == HomeStatus.loading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.5),
            child: SizedBox(
              height: 270,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 224,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearLoadingWidget(height: 202, width: 224),
                        SizedBox(height: 8),
                        LinearLoadingWidget(height: 20, width: 150),
                        SizedBox(height: 6),
                        LinearLoadingWidget(height: 15, width: 100),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state.homeStatus == HomeStatus.sucess) {
          return SizedBox(
            height: 270,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 224,
              itemCount: state.plalistHomeEntity.length,
              itemBuilder: (context, index) {
                final item = state.plalistHomeEntity[index];

                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 202,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item.imagePath),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    context.goNamed(PlaysListScreen.name,
                                        extra: item.id);
                                  },
                                  child: Container(
                                    height: 202,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: textTheme.displayLarge!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        item.creator,
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("error"),
          );
        }
      },
    );
  }
}
