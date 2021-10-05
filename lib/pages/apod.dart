import 'package:everything_space/api/apod_api.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Apod extends StatelessWidget {
  const Apod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const ApodScreen(),
    );
  }
}

class ApodScreen extends StatefulWidget {
  const ApodScreen({Key? key}) : super(key: key);

  @override
  _ApodScreenState createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          FutureBuilder(
              future: GetApod().getApod(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container();
                }
                if (snapshot.hasData == null) {
                  return const CircularProgressIndicator(
                    color: Colors.blueGrey,
                  );
                }
                print(snapshot.data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Column(
                        children: [
                          // Text('TEST'),
                          // Text('TEST'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                snapshot.data[0].imageUrl,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              snapshot.data[0].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              snapshot.data[0].summary,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Copyright: " + snapshot.data[0].copyright,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
