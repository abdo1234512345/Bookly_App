import 'package:bookly_app/Core/utils/Widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/utils/Widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Similar_books_cubit/similar_books_state.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errmassage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
