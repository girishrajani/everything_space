import 'package:everything_space/models/iss_location_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geocoding/geocoding.dart';

class GetIssData {
  Future<List<Placemark>> getLocation(lat, long) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);
    return placemarks;
  }

  Future<List<IssData>> getIssData() async {
    List<IssData> returnValue = [];
    var url = "http://api.open-notify.org/iss-now.json";
    var requestURL = Uri.parse(url);
    var response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var jsonDecode = convert.jsonDecode(response.body);
      var newPlace = await getLocation(jsonDecode['iss_position']['latitude'],
          jsonDecode['iss_position']['longitude']);
      Placemark placeMark = newPlace[0];
      String? name = placeMark.name;
      String? locality = placeMark.locality;
      String? country = placeMark.country;
      String location = name! + ", " + locality! + ", " + country!;
      var longi = jsonDecode['iss_position']['longitude'];
      var lati = jsonDecode['iss_position']['latitude'];
      IssData currentData = IssData(lat: longi, long: lati, location: location);
      returnValue.add(currentData);
    }
    return returnValue;
  }
}
