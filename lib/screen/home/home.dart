import 'package:flutter/material.dart';
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.04,
                MediaQuery.of(context).size.width * 0.05,
                0),
            color: Color(0xFF0A091E),
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
            )),
      ),
    );
  }
}
