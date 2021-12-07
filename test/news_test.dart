import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:news/controllers/news_controller.dart';
import 'package:news/models/news_model.dart';
import 'package:http/http.dart' as http;

class MockNews extends Mock implements NewsController {}

void main() {
  final MockNews mockNews = MockNews();

  setUp(() {});
  tearDown(() {});

  test('The model should be able to receive the following data', () {
    final news = NewsList(
        title:
            'Highlights - PSM Makassar VS Persija Jakarta | BRI Liga 1 - Indosiar',
        urlToImage: 'https://i.ytimg.com/vi/0t5w071lC60/maxresdefault.jpg',
        url: '');

    expect(news.title,
        "Highlights - PSM Makassar VS Persija Jakarta | BRI Liga 1 - Indosiar");
    expect(news.url, "");
  });

  test('test newsapi.com respond', () {
    final file = File('test/test_resources/news.json').readAsStringSync();
    late List<NewsList> data = [];
    final jsonItems =
        json.decode(file)['articles'].cast<Map<String, dynamic>>();

    data = jsonItems.map<NewsList>((json) {
      return NewsList.fromJSON(json);
    }).toList();

    expect(data[0].title,
        "Highlights - PSM Makassar VS Persija Jakarta | BRI Liga 1 - Indosiar");
    expect(data[0].url, "https://www.youtube.com/watch?v=0t5w071lC60");
  });
}
