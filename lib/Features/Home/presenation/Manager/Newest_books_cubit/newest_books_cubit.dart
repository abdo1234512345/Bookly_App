import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/Features/Home/presenation/Manager/Newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homerepo) : super(NewestBooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchNewstBooks() async {
    emit(NewestBooksLoading());
    var result = await homerepo.fetchNewestBooks();
    result.fold(
      (faliure) {
        emit(NewestBooksFailure(faliure.errorMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
