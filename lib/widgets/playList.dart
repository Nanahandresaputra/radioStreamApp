import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_player/radio_player.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/screen/detail/detail.dart';

class PlayListRadio extends StatelessWidget {
  final detailData;

  PlayListRadio({Key? key, this.detailData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<StatusPlay>(
      builder: (context, status, _) => GestureDetector(
        onTap: () async {
          RadioPlayer _radioPlayer = RadioPlayer();
          await _radioPlayer.stop();
          status.status = await 'play';
          status.detailRadio = await detailData;
          await _radioPlayer.setChannel(
              title: detailData?.title,
              url: detailData?.stream,
              imagePath: detailData?.img);

          await _radioPlayer.play();

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailRadio()));
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
            ],
          ),
        ),
      ),
    );
  }
}
