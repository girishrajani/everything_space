import 'dart:convert' as convert;
import 'package:everything_space/models/apod_model.dart';
import 'package:http/http.dart' as http;

class GetApod {
  Future<List<ApodModel>> getApod() async {
    const apiUrl =
        "https://api.nasa.gov/planetary/apod?api_key=SEgrznW4xJTeQINODIKkXk3N3dOppLlrk3zss895";
    var requestURL = Uri.parse(apiUrl);
    var jsonDecode;
    List<ApodModel> returnValue = [];
    var response = await http.get(requestURL);
    String title, copyright, summary;
    if (response.statusCode == 200) {
      jsonDecode = convert.jsonDecode(response.body);
      if (jsonDecode['title'] == null) {
        title = ' ';
      } else {
        title = jsonDecode['title'];
      }
      if (jsonDecode['explanation'] == null) {
        summary = ' ';
      } else {
        summary = jsonDecode['explanation'];
      }
      if (jsonDecode['copyright'] == null) {
        copyright = 'NA';
      } else {
        copyright = jsonDecode['copyright'];
      }

      ApodModel instanceData = ApodModel(
        title: title,
        summary: summary,
        imageUrl: jsonDecode['url'],
        copyright: copyright,
        mediaType: jsonDecode['media_type'],
      );
      returnValue.add(instanceData);
    }
    return returnValue;
  }
}
