import 'package:flutter/material.dart';

class StatusPlay with ChangeNotifier {
  String _status = 'stop';

  get statusValue => _status;

  set status(String status) => _status = status;
}
