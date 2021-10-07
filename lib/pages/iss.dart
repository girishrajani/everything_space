import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('International Space Station'),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.my_location_sharp,
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Google Maps'),
          ),
          SlidingUpPanel(
            panel: const Center(
              child: Text(
                "ISS INFO",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
