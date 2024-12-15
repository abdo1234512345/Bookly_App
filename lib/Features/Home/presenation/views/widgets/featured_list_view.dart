import 'package:bookly_app/Core/utils/Widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/utils/Widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            },
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(errmassage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
