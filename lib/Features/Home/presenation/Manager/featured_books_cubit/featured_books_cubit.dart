import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homerepo.fetchFeaturedBooks();
    result.fold((faliure) {
      emit(FeaturedBooksFailure(faliure.errorMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
