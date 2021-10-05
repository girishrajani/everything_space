import 'dart:convert' as convert;
import 'package:everything_space/models/apod_model.dart';
import 'package:http/http.dart' as http;

class GetApod {
  Future<List<ApodModel>> getApod() async {
    const url = "";
    var requestURL = Uri.parse(url);
    var jsonDecode;
    List<ApodModel> returnValue = [];
    var response = await http.get(requestURL);
    if (response.statusCode == 200) {
      jsonDecode = convert.jsonDecode(response.body);
      ApodModel instanceData = ApodModel(
        title: jsonDecode['title'],
        summary: jsonDecode['explanation'],
        imageUrl: jsonDecode['url'],
        copyright: jsonDecode["copyright"],
        mediaType: jsonDecode['media_type'],
      );
      returnValue.add(instanceData);
    }
    return returnValue;
  }
}
