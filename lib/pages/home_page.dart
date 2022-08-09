import 'package:cricket_app/services/anime_service.dart';
import 'package:cricket_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _width = 0;
  double _height = 0;
  AnimeService _animeService = AnimeService();
  List<dynamic> _animes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAnimesFromApi();
  }

  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: _width,
        height: _height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:_width * 0.05, horizontal: _width * 0.05),
          child: ListView.builder(
            itemCount: _animes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_animes[index]['anime_name']),
              );
            },
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    ));
  }

  void getAllAnimesFromApi() async {
    _animes = await _animeService.getAllAnimes();
    setState(() {

    });
  }
}
