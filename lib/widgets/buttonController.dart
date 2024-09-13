import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_player/radio_player.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/screen/detail/detail.dart';

class ButtonController extends StatelessWidget {
  final RadioPlayer _radioPlayer = RadioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF0A091E), Color.fromARGB(255, 29, 26, 71)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          border: Border.all(color: Colors.white.withOpacity(0.7)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 3,
              spreadRadius: 3,
              color: Color(0xFF0A091E),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Consumer<StatusPlay>(
            builder: (context, status, _) => GestureDetector(
              onTap: () async {
                RadioPlayer _radioPlayer = RadioPlayer();
                if (status.statusValue == 'play') {
                  await _radioPlayer.stop();
                  status.status = await 'play';
                  await _radioPlayer.setChannel(
                      title: status.detailRadioValue?.title,
                      url: status.detailRadioValue?.stream,
                      imagePath: status.detailRadioValue?.img);

                  await _radioPlayer.play();
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailRadio()));
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Consumer<StatusPlay>(
                      builder: (context, status, _) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                            image: NetworkImage(status.detailRadioValue?.img)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Consumer<StatusPlay>(
                        builder: (context, status, _) => Text(
                          status.detailRadioValue?.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                      ),
                      Consumer<StatusPlay>(
                        builder: (context, status, _) => Text(
                          status.detailRadioValue?.signal,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Consumer<StatusPlay>(
                builder: (context, status, _) => IconButton(
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
                    icon: Icon(
                      status.statusValue == 'pause'
                          ? Icons.play_arrow
                          : Icons.pause,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.1,
                    )),
              ),
              Consumer<StatusPlay>(
                builder: (context, status, _) => IconButton(
                    onPressed: () async {
                      status.status = 'stop';
                      _radioPlayer.stop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.07,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
