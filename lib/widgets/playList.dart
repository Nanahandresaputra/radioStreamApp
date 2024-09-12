import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/screen/detail/detail.dart';

class PlayListRadio extends StatelessWidget {
  final detailData;

  final _audioPlayer = AudioPlayer();

  PlayListRadio({Key? key, this.detailData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<StatusPlay>(
      builder: (context, status, _) => GestureDetector(
        onTap: () async {
          // status.status = 'play';
          status.detailRadio = detailData;

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailRadio()));

          // if (status.detailRadioValue != 'default') {
          //   _audioPlayer
          //       .setSource(UrlSource(status.detailRadioValue?.stream))
          //       .then((value) => _audioPlayer
          //           .play(UrlSource(status.detailRadioValue?.stream)));

          // }
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.005,
              0,
              MediaQuery.of(context).size.height * 0.005),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(detailData?.img),
                        height: MediaQuery.of(context).size.width * 0.15,
                        width: MediaQuery.of(context).size.width * 0.15,
                        fit: BoxFit.contain,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          detailData?.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontFamily: 'Nunito'),
                        ),
                        Text(
                          detailData?.signal,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontFamily: 'Nunito'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Icon(
              //   Icons.radio,
              //   color: Colors.white.withOpacity(0.7),
              //   size: MediaQuery.of(context).size.width * 0.06,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
