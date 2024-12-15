import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.KBookDetailsView,
          extra: book,
        );
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      style: Styles.textstyle20
                          .copyWith(fontFamily: KGtsectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textstyle14.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textstyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
