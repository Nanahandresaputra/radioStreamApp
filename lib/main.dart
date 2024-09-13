import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radio_stream/provider/statusPlayProvider.dart';
import 'package:radio_stream/screen/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider(
      create: (context) => StatusPlay(), child: HomeScreen()));
}
