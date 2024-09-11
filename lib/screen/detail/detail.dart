import 'package:flutter/material.dart';
import 'package:radio_stream/widgets/topBar.dart';

class DetailRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: TopBar(
          isHome: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          // color: Color(0xFF0A091E),
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Color.fromARGB(255, 30, 28, 82),
            Color(0xFF0A091E),
          ], center: Alignment.topCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    child: Image(image: AssetImage('assets/images.png')),
                    borderRadius: BorderRadius.circular(8),
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
                        Text(
                          '90.89 FM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontFamily: 'Nunito'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: CircleBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
