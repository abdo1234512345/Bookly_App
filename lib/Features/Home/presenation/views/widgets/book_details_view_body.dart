import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/books_details_section.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                SizedBox(
                  height: 20,
                ),
                BookDetailsSection(book: book),
                Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
