import 'package:everything_space/theme/themes.dart';
import 'package:everything_space/widgets/drawer.dart';
import 'package:everything_space/api/news_api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
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
                            // height: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      placeholder: (context, url) =>
                                          const Padding(
                                        padding: EdgeInsets.all(35.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      imageUrl: snapshot.data[index].imageUrl,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    // child: Image.network(
                                    //   snapshot.data[index].imageUrl,
                                    //   fit: BoxFit.cover,
                                    //   height: 200.0,
                                    //   width: MediaQuery.of(context).size.width -
                                    //       100,
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data[index].headline,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Link(
                                            target: LinkTarget.self,
                                            uri: Uri.parse(
                                                snapshot.data[index].url),
                                            builder: (context, openLink) {
                                              return ElevatedButton(
                                                onPressed: openLink,
                                                child: const Text(
                                                  'Read More',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Colors.blueGrey),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
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
