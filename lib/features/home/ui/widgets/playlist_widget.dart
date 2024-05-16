import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';
import 'package:music_app/features/playslist/ui/screen/playslist_screen.dart';

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
                        color: Colors.indigo,
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
                                  context.goNamed(
                                    PlaysListScreen.name,
                                    queryParameters: {"id": "5"},
                                    extra: item.id,
                                  );
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
      },
    );
  }
}
