import 'package:everything_space/models/news_cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetNews {
  Future<List<NewsCards>> getData() async {
    const url = "https://api.spaceflightnewsapi.net/v3/articles";
    var newsData = [];
    List<NewsCards> returnValue = [];
    var requestURL = Uri.parse(url);
    var jsonDecode;
    var response = await http.get(requestURL);
    if (response.statusCode == 200) {
      jsonDecode = convert.jsonDecode(response.body);
      var i;
      for (i = 0; i < 10; i++) {
        NewsCards instanseData = NewsCards(
          index: i,
          id: jsonDecode[i]["id"],
          headline: jsonDecode[i]["title"],
          url: jsonDecode[i]["url"],
          imageUrl: jsonDecode[i]["imageUrl"],
          summary: jsonDecode[i]["summary"],
        );
        returnValue.add(instanseData);
      }
    }
    return returnValue;
  }
}
