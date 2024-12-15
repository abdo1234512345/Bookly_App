import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.KBookDetailsView);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imageUrl)),
          ),
        ),
      ),
    );
  }
}
