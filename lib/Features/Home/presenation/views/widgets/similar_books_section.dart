import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Also Like',
          style: Styles.textstyle14
              .copyWith(fontFamily: KGtsectraFine, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
