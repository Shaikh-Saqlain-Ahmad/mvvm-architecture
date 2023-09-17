import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/data/response/api-response.dart';
import 'package:mvvm_architecture/model/movie-list-model.dart';
import 'package:mvvm_architecture/repository/home-repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myrepo = HomeRepository();
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    setMoviesList(ApiResponse.loading());
    _myrepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
