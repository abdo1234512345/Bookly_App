// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class silidingText extends StatelessWidget {
  const silidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'الاسطي عبده البلف',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
