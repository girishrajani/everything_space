import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          Image(
            image: AssetImage('assets/images/earth.jpg'),
            // height: 300,
          ),
          ListTile(
            title: Text(
              'Everthing Space',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.image,
              color: Colors.white,
            ),
            title: Text('Picture of the Day'),
          ),
          ListTile(
            leading: Icon(
              Icons.edit_location_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Internationl Space Station',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.edit_location_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Tiangong Space Station',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.wb_iridescent_outlined,
              color: Colors.white,
            ),
            title: Text(
              'CosmoClub',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            title: Text('Donate'),
          ),
          ListTile(
            leading: Icon(
              Icons.report_problem,
              color: Colors.white,
            ),
            title: Text('Report a Problem'),
          ),
        ],
      ),
    );
  }
}
