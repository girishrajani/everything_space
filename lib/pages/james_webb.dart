import 'package:everything_space/data/james_webb.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(JamesWebb());

class JamesWebb extends StatelessWidget {
  const JamesWebb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const JamesWebbScreen(),
      theme: AppThemeData.darkTheme,
    );
  }
}

class JamesWebbScreen extends StatefulWidget {
  const JamesWebbScreen({Key? key}) : super(key: key);

  @override
  _JamesWebbScreenState createState() => _JamesWebbScreenState();
}

class _JamesWebbScreenState extends State<JamesWebbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('James Webb Telescope'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/james1.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      'James Webb Space Telescope',
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
                    'assets/images/james2.jpg',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info3,
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
                        'https://en.wikipedia.org/wiki/James_Webb_Space_Telescope');
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
                ElevatedButton(
                  onPressed: () {
                    _launchUrls('https://www.jwst.nasa.gov/');
                  },
                  child: const Text(
                    'Visit the Offical Website',
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
