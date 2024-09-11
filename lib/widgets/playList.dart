import 'package:flutter/material.dart';
import 'package:radio_stream/screen/detail/detail.dart';

class PlayListRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                      image: AssetImage('assets/images.png'),
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
                        'Radio Fm Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Nunito'),
                      ),
                      Text(
                        '98.7 FM',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
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
    );
  }
}
