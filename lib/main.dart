import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/screen/home/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => StatusPlay(), child: HomeScreen()));
}
