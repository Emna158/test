import 'package:flutter/material.dart';
import 'package:basketball/ui/games.dart';
import 'package:basketball/ui/teams.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FootBall App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
     color: Color(0xFF6200EA),
      )),
      home: const MyHomePage(title: 'FootBall App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("FootBall App"),
          backgroundColor: Colors.deepPurpleAccent.shade700,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Games",
              ),
              Tab(
                text: "Teams",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [Games(), Teams()],
        ),
      ),
    );
  }
}
