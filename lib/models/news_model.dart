class NewsList {
  late String? title;
  late String? urlToImage;
  late String? url;

  NewsList({
    this.title,
    this.urlToImage,
    this.url,
  });

  NewsList.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      title = jsonMap['title'].toString();
      urlToImage = jsonMap['urlToImage'].toString();
      url = jsonMap['url'].toString();
    } catch (e) {
      print(e);
    }
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = title;
    map["urlToImage"] = urlToImage;
    map["url"] = url;
    return map;
  }
}
