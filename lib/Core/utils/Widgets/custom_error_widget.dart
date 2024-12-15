import 'package:bookly_app/Core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errmassage});
  final String errmassage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        errmassage,
        style: Styles.textstyle18,
      ),
    );
  }
}
