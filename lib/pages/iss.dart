import 'dart:ui';
import 'package:everything_space/api/iss_location_api.dart';
import 'package:everything_space/models/iss_location_model.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_controller/google_maps_controller.dart';

void main() => runApp(ISS());

class ISS extends StatelessWidget {
  const ISS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const IssScreen(),
    );
  }
}

class IssScreen extends StatefulWidget {
  const IssScreen({Key? key}) : super(key: key);

  @override
  _IssScreenState createState() => _IssScreenState();
}

class _IssScreenState extends State<IssScreen> {
  // GoogleMapsController _controller = GoogleMapsController();
  late GoogleMapController _controller;
  final Map<String, Marker> _markers = {};
  // var lat, long;
  @override
  void initState() {
    super.initState();
    // plotOnISSMap();
  }

  Future<void> plotOnISSMap() async {
    List<IssData> _data = await GetIssData().getIssData();
    var lat = double.parse(_data[0].lat);
    var long = double.parse(_data[0].long);
    print(lat);
    print(long);
    LatLng latlng = LatLng(lat, long);
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(bearing: 0, target: latlng, tilt: 0, zoom: 1.00)));
  }

  final headLine =
      'The International Space Station is moving at close to 28,000 km/h so its location changes really fast! Where is it right now?';
  var info =
      'The International Space Station is a modular space station in low Earth orbit. It is a multinational collaborative project involving five participating space agencies: NASA, Roscosmos, JAXA, ESA, and CSA. The ownership and use of the space station is established by intergovernmental treaties and agreements.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('International Space Station'),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        onPressed: plotOnISSMap,
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.refresh,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Center(
            child: Text('Google Maps'),
          ),
          SlidingUpPanel(
            panelBuilder: (ScrollController sc) => _scrollingList(sc),
            body: _body(),
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 5.4746,
  );

  void _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    List<IssData> _data = await GetIssData().getIssData();
    var lat = double.parse(_data[0].lat);
    var long = double.parse(_data[0].long);
    setState(() {
      _markers.clear();

      final marker = Marker(
        markerId: const MarkerId('ISS'),
        position: LatLng(lat, long),
        infoWindow: const InfoWindow(
          title: 'Internation Space Station',
          // snippet: office.address,
        ),
      );
      _markers['ISS'] = marker;
    });
  }

  // void _markonMap() async {
  //   List<IssData> _data = await GetIssData().getIssData();
  //   var lat = double.parse(_data[0].lat);
  //   var long = double.parse(_data[0].long);
  //   print(lat);
  //   print(long);
  //   setState(() {
  //     _markers.clear();

  //     final marker = Marker(
  //       markerId: MarkerId('ISS'),
  //       position: LatLng(lat, long),
  //       infoWindow: InfoWindow(
  //         title: 'Internation Space Station',
  //         // snippet: office.address,
  //       ),
  //     );
  //     print(marker);
  //     _markers['ISS'] = marker;

  //     print('should be marked');
  //   });
  // }

  Widget _body() {
    return GoogleMap(
      initialCameraPosition: _kGooglePlex,
      onMapCreated: _onMapCreated,
      // onCameraMoveStarted: _markonMap,
      markers: _markers.values.toSet(),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return ListView(
      controller: sc,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'Internation Space Station',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              headLine,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        FutureBuilder(
          future: GetIssData().getIssData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            }
            if (snapshot.hasData == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey,
                ),
              );
            }
            var lat = double.parse(snapshot.data[0].lat);
            var long = double.parse(snapshot.data[0].long);
            LatLng latlng = LatLng(lat, long);
            _controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    bearing: 0, target: latlng, tilt: 0, zoom: 3.00)));

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Current Location: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     snapshot.data[0].location,
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Text(
                        'Latitude: ' + snapshot.data[0].lat,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Longitude: ' + snapshot.data[0].long,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              info,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image.asset('assets/images/iss.jpg'),
        Image.asset('assets/images/iss2.jpg'),
      ],
    );
  }
}
