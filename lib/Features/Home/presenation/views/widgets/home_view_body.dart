import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/presenation/views/widgets/featured_list_view.dart';
import 'package:bookly_app/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              const SizedBox(
                height: 5,
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textstyle18.copyWith(fontFamily: KGtsectraFine),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListView(),
          ),
        )
      ],
    );
  }
}
