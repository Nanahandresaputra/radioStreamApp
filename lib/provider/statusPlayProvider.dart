import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusPlay with ChangeNotifier {
  String _status = 'stop';
  dynamic _detailRadio = 'default';

  String get statusValue => _status;
  dynamic get detailRadioValue => _detailRadio;

  set status(String status) => {_status = status, notifyListeners()};
  set detailRadio(dynamic detailRadio) =>
      {_detailRadio = detailRadio, notifyListeners()};
}

class GetListRadio {
  String? name;
  String? signal;
  String? title;
  String? img;
  String? stream;

  GetListRadio({this.name, this.signal, this.title, this.img, this.stream});

  factory GetListRadio.getData(Map<String, dynamic> json) {
    return GetListRadio(
      name: json['name'],
      signal: json['signal'],
      title: json['title'],
      img: json['img'],
      stream: json['stream'],
    );
  }

  Future<List<GetListRadio>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    var radios = jsonDecode(jsonString);
    var listRadios = radios['data'];

    List<GetListRadio> listDatas = [];

    for (var i = 0; i < listRadios.length; i++) {
      listDatas.add(GetListRadio.getData(listRadios[i]));
    }
    return listDatas;
  }
}
