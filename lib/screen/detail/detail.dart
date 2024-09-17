import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_player/radio_player.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/widgets/topBar.dart';

class DetailRadio extends StatelessWidget {
  final RadioPlayer _radioPlayer = RadioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TopBar(
          isHome: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          // color: Color(0xFF0A091E),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF0A091E),
            Color.fromARGB(255, 30, 28, 82),
            Color(0xFF0A091E)
          ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<StatusPlay>(
                    builder: (context, status, _) => ClipRRect(
                      child: Image(
                        image: NetworkImage(status.detailRadioValue?.img),
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.radio,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),
                        Consumer<StatusPlay>(
                          builder: (context, status, _) => Text(
                            status.detailRadioValue?.signal,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontFamily: 'Nunito'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                child: Consumer<StatusPlay>(
                  builder: (context, status, _) => ElevatedButton(
                    onPressed: () async {
                      _radioPlayer.stateStream.listen((value) {
                        value
                            ? status.status = 'play'
                            : status.status = 'pause';
                      });

                      status.status = status.statusValue == 'stop' ||
                              status.statusValue == 'pause'
                          ? 'play'
                          : 'pause';

                      status.statusValue == 'stop' ||
                              status.statusValue == 'pause'
                          ? _radioPlayer.pause()
                          : _radioPlayer.play();
                    },
                    child: status.statusValue == 'stop' ||
                            status.statusValue == 'pause'
                        ? Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.08,
                          )
                        : Icon(
                            Icons.pause_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: CircleBorder(),
                        padding: EdgeInsets.zero),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
