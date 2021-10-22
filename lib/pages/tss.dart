import 'package:everything_space/data/tss.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tss extends StatelessWidget {
  const Tss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const TssScreen(),
    );
  }
}

class TssScreen extends StatefulWidget {
  const TssScreen({Key? key}) : super(key: key);

  @override
  _TssScreenState createState() => _TssScreenState();
}

class _TssScreenState extends State<TssScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiangong Space Station'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/tss1.jpeg',
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      'Tiangong Space Station',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info1,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Image(
                  image: AssetImage(
                    'assets/images/tss2.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'More Infomation Coming Soon',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchUrls(
                        'https://en.wikipedia.org/wiki/Tiangong_space_station');
                  },
                  child: const Text(
                    'Read More on Wikipedia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrls(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
