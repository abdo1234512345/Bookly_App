// ignore_for_file: camel_case_types
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Core/utils/app_router.dart';

void main(List<String> args) {
  setupServiceLocator();
  runApp(const bookly());
}

class bookly extends StatelessWidget {
  const bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getit.get<HomeRepoImp>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getit.get<HomeRepoImp>())..fetchNewstBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Kprimarycolor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
