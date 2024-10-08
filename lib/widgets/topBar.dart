import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final isHome;

  const TopBar({Key? key, this.isHome}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return isHome
        ? AppBar(
            backgroundColor: Color(0xFF0A071E),
            leading: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'On Radio',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito'),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(exit(0));
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
              )
            ],
          )
        : AppBar(
            backgroundColor: Color(0xFF0A071E),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.07),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
            ),
            centerTitle: true,
            title: Consumer<StatusPlay>(
              builder: (context, status, _) => Text(
                status.detailRadioValue?.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito'),
              ),
            ),
          );
  }
}
