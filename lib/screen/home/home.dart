import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/widgets/buttonController.dart';
import 'package:radio_stream/widgets/playList.dart';
import 'package:radio_stream/widgets/topBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _getDatas = [];
  GetListRadio _getRradios = GetListRadio();
  @override
  void initState() {
    super.initState();

    _getRradios.loadJsonFromAssets('assets/radio-data.json').then((value) {
      if (value.length > 0) {
        for (int i = 0; i < value.length; i++) {
          setState(() {
            _getDatas.add(PlayListRadio(
              detailData: value[i],
            ));
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TopBar(
          isHome: true,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Positioned(bottom: -2, child: ButtonController()),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.04,
                  MediaQuery.of(context).size.width * 0.05,
                  0),
              // color: Color(0xFF0A091E),
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                Color.fromARGB(255, 30, 28, 82),
                Color(0xFF0A091E),
              ], center: Alignment.topCenter)),

              child: ListView(
                children: <Widget>[
                  Text(
                    'List Radio Playlist',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                        children: _getDatas.length > 0
                            ? _getDatas
                            : <Widget>[Container()]),
                  )
                ],
              ),
            ),
            Consumer<StatusPlay>(
                builder: (context, status, _) => status.statusValue != 'stop'
                    ? Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.002,
                        child: ButtonController())
                    : Container())
          ],
        ),
      ),
    );
  }
}

// Positioned(bottom: -2, child: ButtonController())