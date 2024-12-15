import 'package:bookly_app/Core/utils/Widgets/custom_button.dart';
import 'package:bookly_app/Core/utils/function/launch_url.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, book.volumeInfo.previewLink!);
            },
            text: getText(book),
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            text: 'Preview',
            fontsize: 16,
            backgroundcolor: Color(0xffEF8262),
            textcolor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ))
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
