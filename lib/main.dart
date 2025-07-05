import 'package:flutter/material.dart';
import 'package:mid_project/database/objectbox_database.dart';
import 'package:mid_project/provider/cartCounter.dart';
import 'package:mid_project/screens/home.dart';
import 'package:mid_project/utils/product_provider.dart';
import 'package:provider/provider.dart';

late ObjectBoxDatabase objectBoxDatabase;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    objectBoxDatabase = await ObjectBoxDatabase.create();
    await DummyProductProvider.getProducts();

  } catch (e) {
    print(e.toString());
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartCounter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light(primary: Colors.white)),

      title: "Grocery Store",
      home: Home(),
    );
  }
}
