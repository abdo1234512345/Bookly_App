import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/Search/presentaion/views/Widgets/custom_search_text_field.dart';
import 'package:bookly_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomSreachTextField(),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textstyle18.copyWith(fontFamily: KGtsectraFine),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('data'),
        );
      },
    );
  }
}
