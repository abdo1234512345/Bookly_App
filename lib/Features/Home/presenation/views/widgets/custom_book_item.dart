import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBookImage extends StatefulWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<CustomBookImage> createState() => _CustomBookImageState();
}

class _CustomBookImageState extends State<CustomBookImage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateImageLoading();
  }

  Future<void> _simulateImageLoading() async {
    // محاكاة تأخير تحميل الصورة لمدة 2 ثانية
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.KBookDetailsView);
        },
        child: Skeletonizer(
          enabled: isLoading,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isLoading ? Colors.grey[300] : null,
              image: isLoading
                  ? null
                  : DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.imageUrl),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
