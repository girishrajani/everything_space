import 'package:everything_space/api/rover_api.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MarsRovers extends StatelessWidget {
  const MarsRovers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const RoverImages(),
    );
  }
}

class RoverImages extends StatefulWidget {
  const RoverImages({Key? key}) : super(key: key);

  @override
  _RoverImagesState createState() => _RoverImagesState();
}

class _RoverImagesState extends State<RoverImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mars Rover Images'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: GetRoverImages().getRoverImages(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey,
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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                try {
                  return Padding(
                    // snapshot.data[index].imageUrl,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: snapshot.data[index].imageUrl,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                } catch (e) {
                  return const CircularProgressIndicator(
                    color: Colors.blueGrey,
                  );
                }
              },
            );
          },
        ));
  }
}
