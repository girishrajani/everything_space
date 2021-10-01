import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:everything_space/api/news_api.dart';
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
  void initState() {
    // print(res);
    var a;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Everything Space'),
              background: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/space.gif'),
              ),
            ),
          ),
          FutureBuilder(
              future: GetNews().getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var _childCount = 1;
                if (snapshot.hasData == null) {
                  _childCount = 1;
                  return CircularProgressIndicator();
                } else {
                  _childCount = 10;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container();
                        }
                        _childCount = 10;
                        return Card(
                          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Container(
                            height: 300,
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      snapshot.data[index].imageUrl),
                                  height: 200,
                                ),
                                Text(snapshot.data[index].headline),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Read More'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: _childCount,
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
