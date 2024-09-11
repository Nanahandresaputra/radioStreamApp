import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final isHome;

  const TopBar({Key? key, this.isHome}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // print('size ------> ${MediaQuery.of(context).size.width * 0.11}');
    return isHome
        ? AppBar(
            backgroundColor: Color(0xFF0A071E),
            leading: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Image(
                image: AssetImage('assets/logo.png'),
                // height: MediaQuery.of(context).size.height * 0.1,
                // fit: BoxFit.contain,
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
                  // Show drawer
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
            title: Text(
              'Test',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito'),
            ),
          );
  }
}
