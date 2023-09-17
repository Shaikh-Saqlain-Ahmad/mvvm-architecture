import 'package:mvvm_architecture/data/network/base-api-services.dart';
import 'package:mvvm_architecture/data/network/network-api-service.dart';
import 'package:mvvm_architecture/model/movie-list-model.dart';
import 'package:mvvm_architecture/res/app-endpoint.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppEndpoint.moviesListEndpoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
