import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/widgets/buttonController.dart';
import 'package:radio_stream/widgets/playList.dart';
import 'package:radio_stream/widgets/topBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _getDatas = [];
  GetListRadio _getRradios = GetListRadio();
  bool _isConnect = true;

  Future<void> _statusInternet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    _isConnect = await isConnected;
  }

  void _funcDatas() {
    setState(() {
      _getDatas.clear();
    });
    _getRradios.loadJsonFromAssets('assets/radio-data.json').then((value) {
      if (value.length > 0) {
        for (int i = 0; i < value.length; i++) {
          setState(() {
            _getDatas.add(PlayListRadio(
              detailData: value[i],
            ));
          });
        }
      }
    });
  }

  Future<void> _refresh() async {
    _funcDatas();
    _statusInternet();
  }

  @override
  void initState() {
    super.initState();

    _funcDatas();
    _statusInternet();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoubleBack(
        message: 'Tekan kembali untuk keluar',
        backgroundRadius: 7,
        child: Scaffold(
          appBar: TopBar(
            isHome: true,
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.height * 0.04,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                  Color.fromARGB(255, 30, 28, 82),
                  Color(0xFF0A091E),
                ], center: Alignment.topCenter)),
                child: RefreshIndicator(
                  color: Color.fromARGB(255, 30, 28, 82),
                  onRefresh: () => _refresh(),
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
                      _isConnect
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.15),
                              child: Column(
                                  children: _getDatas.length > 0
                                      ? _getDatas
                                      : <Widget>[Container()]),
                            )
                          : Image(image: AssetImage('assets/err.gif'))
                    ],
                  ),
                ),
              ),
              Consumer<StatusPlay>(
                  builder: (context, status, _) => status.statusValue != 'stop'
                      ? Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.002,
                          child: ButtonController())
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
