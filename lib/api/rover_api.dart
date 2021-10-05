import 'package:everything_space/models/rover_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetRoverImages {
  Future<List<RoverModel>> getRoverImages() async {
    List<RoverModel> returnData = [];
    const url = "";
    var requestURL = Uri.parse(url);
    var response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var jsonDecode = convert.jsonDecode(response.body);
      var looping = jsonDecode['photos'];
      for (var i in looping) {
        RoverModel currentValue = RoverModel(
          imageUrl: i['img_src'],
        );
        returnData.add(currentValue);
      }
    }
    return returnData;
  }
}
