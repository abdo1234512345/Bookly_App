// ignore_for_file: non_constant_identifier_names

import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presenation/views/book_details_view.dart';
import 'package:bookly_app/Features/Home/presenation/views/home_view.dart';
import 'package:bookly_app/Features/Search/presentaion/views/search_view.dart';
import 'package:bookly_app/Features/splash/Presenetion/views/Splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String KHomeview = '/homeview';
  static String KBookDetailsView = '/bookDetailsView';
  static String KSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeview,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getit.get<HomeRepoImp>(),
          ),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
