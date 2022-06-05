import 'package:atikyagv3/pages/Anasayfa.dart';
import 'package:atikyagv3/pages/AuthTypeSelector.dart';
import 'package:atikyagv3/pages/Harita.dart';
import 'package:atikyagv3/pages/Menuler.dart';
import 'package:atikyagv3/pages/Odul.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthTypeSelector(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    Anasayfa(),
    HaritaPage(),
    OdulPage(),
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Anasayfa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "Harita",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              label: "Ödül",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menü",
            ),
          ]),
    );
  }
}
