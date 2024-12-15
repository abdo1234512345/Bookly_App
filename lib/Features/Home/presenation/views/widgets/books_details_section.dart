import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textstyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textstyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
