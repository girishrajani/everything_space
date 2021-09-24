import 'package:everything_space/theme/themes.dart';
import 'package:flutter/material.dart';
import '../theme/themes.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darkTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Everything Space'),
              background: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://giffiles.alphacoders.com/211/211255.gif'),
              ),
            ),
          ),
          // ListView(
          //   children: [
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //     FlutterLogo(),
          //   ],
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: InkWell(
                    onTap: () {
                      //On Tap Redirect
                      //Navigator.push()
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: const Center(
                        child: Text('Hello'),
                      ),
                    ),
                  ),
                );
              },
              childCount: 300,
            ),
          ),
        ],
      ),
    );
  }
}
