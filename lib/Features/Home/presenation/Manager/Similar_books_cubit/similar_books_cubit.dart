import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homerepo) : super(SimilarBooksIntial());
  final HomeRepo homerepo;
  Future<void> fetchsimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homerepo.fetchSimilarBooks(category: category);
    result.fold(
      (faliure) {
        emit(SimilarBooksFailure(faliure.errorMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
