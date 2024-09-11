import 'package:flutter/material.dart';

class ButtonController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          // color: Color(0xFF0A091E),
          gradient: LinearGradient(
              colors: [Color(0xFF0A091E), Color.fromARGB(255, 29, 26, 71)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          border: Border.all(color: Colors.white.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(image: AssetImage('assets/images.png')),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Radio Elshinta (Jakarta)',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontSize: MediaQuery.of(context).size.width * 0.035),
                  ),
                  Text(
                    '98.8 FM',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.1,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.07,
                  )),
            ],
          )
        ],
      ),
    );
  }
}


          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white70,
          //     offset: Offset(0, 0),
          //     blurRadius: 2,
          //   )
          // ]