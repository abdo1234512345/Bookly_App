// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unused_element

import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Features/splash/Presenetion/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    NavigateToHome();
    @override
    void dispose() {
      super.dispose();
      animationController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        const SizedBox(
          height: 10,
        ),
        silidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(AppRouter.KHomeview);
      },
    );
  }
}
