import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<HomeRepoImp>(
    HomeRepoImp(getit.get<ApiService>()),
  );
}
