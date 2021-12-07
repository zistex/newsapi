import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news/models/news_model.dart';
import 'package:news/repository/news_repository.dart' as repository;

class NewsController extends ControllerMVC {
  NewsList modelTime = new NewsList();

  NewsController() {}

  Future<List<NewsList>> getdata() {
    return repository.fetchData();
  }
}
