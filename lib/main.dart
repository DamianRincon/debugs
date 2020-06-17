import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'route_generate.dart';
import 'src/providers/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));

  var dir = await getApplicationDocumentsDirectory();
  //await Hive.initFlutter(dir.path);
  //await Hive.openBox('app');
  //var appBox = Hive.box("app");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => App()),
      ],
      child: MaterialApp(
        title: "Debug",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerate.initialize,
          initialRoute: '/login',
          //initialRoute: appBox.get("page", defaultValue: '/login'),
      )
    )
  );
  
}
