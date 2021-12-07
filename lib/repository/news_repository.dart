import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/news_model.dart';

late List<NewsList> data = [];
Future<List<NewsList>> fetchData() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}';

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final jsonItems =
          json.decode(response.body)['articles'].cast<Map<String, dynamic>>();

      data = jsonItems.map<NewsList>((json) {
        return NewsList.fromJSON(json);
      }).toList();
    }
  } catch (e) {
    print(e);
  }
  return data;
}
