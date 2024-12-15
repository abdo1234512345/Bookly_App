import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
          const Spacer(
            flex: 300,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
