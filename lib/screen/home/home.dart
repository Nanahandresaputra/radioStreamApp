import 'package:flutter/material.dart';
import 'package:radio_stream/widgets/buttonController.dart';
import 'package:radio_stream/widgets/playList.dart';
import 'package:radio_stream/widgets/topBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  PlayListRadio(),
                  PlayListRadio(),
                  PlayListRadio(),
                ],
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.04,
                child: ButtonController())
          ],
        ),
      ),
    );
  }
}

// Positioned(bottom: -2, child: ButtonController())