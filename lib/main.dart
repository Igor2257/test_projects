import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_projects/ui/pages/home_screen.dart';
import 'package:test_projects/ux/bloc/app_bloc.dart';
import 'package:test_projects/ux/models/saved_url.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initBoxes().whenComplete(() {
    runApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                  centerTitle: false,
                  iconTheme: IconThemeData(color: Colors.white))),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
        )));
  });
}

Box? savedUrlsBox;

Future<bool> _initBoxes() async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  //await Hive.deleteBoxFromDisk('savedUrls');
  Hive.registerAdapter(SavedUrlAdapter());
  savedUrlsBox = await Hive.openBox<SavedUrl>("savedUrls");

  return true;
}
