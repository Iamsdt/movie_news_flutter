import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_news/repo/MyRepo.dart';
import 'package:movie_news/routes/route.gr.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<MyRepo>(() => MyRepo()),
      ],
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MyRoute.mainPage,
        navigatorKey: MyRoute.navigator.key,
        onGenerateRoute: MyRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
