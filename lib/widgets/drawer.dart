import 'package:everything_space/pages/about.dart';
import 'package:everything_space/pages/apod.dart';
import 'package:everything_space/pages/home.dart';
import 'package:everything_space/pages/iss.dart';
import 'package:everything_space/pages/james_webb.dart';
import 'package:everything_space/pages/rover_images.dart';
import 'package:everything_space/pages/tss.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const Image(
            image: AssetImage('assets/images/earth.jpg'),
            // height: 300,
          ),
          const ListTile(
            title: Text(
              'Everthing Space',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            leading: const Icon(
              Icons.now_widgets_sharp,
              color: Colors.white,
            ),
            title: const Text('News'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Apod()),
              );
            },
            leading: const Icon(
              Icons.image,
              color: Colors.white,
            ),
            title: const Text('Picture of the Day'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ISS()),
              );
            },
            leading: const Icon(
              Icons.edit_location_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Internationl Space Station',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tss()),
              );
            },
            leading: const Icon(
              Icons.edit_location_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Tiangong Space Station',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MarsRovers()),
              );
            },
            leading: const Icon(
              Icons.satellite,
              color: Colors.white,
            ),
            title: const Text(
              'Mars Rover Images',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JamesWebb()),
              );
            },
            leading: const Icon(
              Icons.scatter_plot_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'James Webb Space Telescope',
            ),
          ),
          ListTile(
            onTap: () {
              _launchUrls("https://cosmoclub.in");
            },
            leading: const Icon(
              Icons.wb_iridescent_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'CosmoClub',
            ),
          ),
          ListTile(
            onTap: () {
              _launchUrls("https://github.com/girishrajani/everything_space");
            },
            leading: const Icon(
              Icons.smart_toy_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Contribute',
            ),
          ),
          ListTile(
            onTap: () {
              _launchUrls("https://www.buymeacoffee.com/girishrajani");
            },
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            title: const Text('Donate'),
          ),
          ListTile(
            onTap: () {
              _launchUrls(
                  "https://github.com/girishrajani/everything_space/issues");
            },
            leading: const Icon(
              Icons.report_problem,
              color: Colors.white,
            ),
            title: const Text('Report a Problem'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutApp()),
              );
            },
            leading: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'About',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              'Powerd by CosmoClub',
              style: TextStyle(
                fontSize: 10,
              ),
            )),
          ),
        ],
      ),
    );
  }

  void _launchUrls(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
