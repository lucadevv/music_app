import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:music_app/features/home/ui/screen/home_screen.dart';
import 'package:music_app/shared/const/app_color.dart';

class SplashScreen extends StatelessWidget {
  static const name = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.black,
              AppColors.black,
              AppColors.purpleOne,
            ],
          ),
        ),
        child: SafeArea(
          top: false,
          right: false,
          left: false,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Feel the beat",
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                "Emmerse yourseft into the\n world of music today",
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                height: 48,
                width: 203,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.purpleTown,
                      AppColors.purpleOne,
                      AppColors.pink,
                    ],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Continue",
                      style: textTheme.displayLarge,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            context.pushReplacement("/${HomeScreen.name}");
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
