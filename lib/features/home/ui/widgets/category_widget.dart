import 'package:flutter/material.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/models/section_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int indexSelect = 0;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        itemCount: sectionList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = sectionList[index];
          return InkWell(
            onTap: () {
              setState(() {
                indexSelect = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: textTheme.displayLarge!.copyWith(
                      color: index == indexSelect
                          ? AppColors.white
                          : AppColors.greyTown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  index == indexSelect
                      ? AnimatedContainer(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.purpleOne,
                                AppColors.pink,
                              ],
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                          curve: Curves.bounceIn,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
