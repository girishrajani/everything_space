import 'package:everything_space/data/newsSource.dart';
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const AboutAppPage(),
    );
  }
}

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  _AboutAppPageState createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  void _launchUrls(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  Widget _buildNewsInfoDiolog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: const Text(
        'Disclaimer',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            NewsInfo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchUrls(
                      "https://github.com/spaceflightnewsapi/spaceflightnewsapi");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                ),
                child: const Text(
                  'Open GitHub Link',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                ),
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactDiolog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: const Text(
        'Contact Us',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          const Text(
            'Mail us at girishrajani.app@gmail.com for any queries',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: "girishrajani.app@gmail.com"));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                ),
                child: const Text(
                  'Copy E-Mail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                ),
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.vertical_split_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Version',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              '1.0.1+2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.source,
              color: Colors.white,
            ),
            title: const Text(
              'News Source',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _buildNewsInfoDiolog(context),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_page,
              color: Colors.white,
            ),
            title: const Text(
              'Contact Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildContactDiolog(context),
              );
            },
          )
        ],
      ),
    );
  }
}
