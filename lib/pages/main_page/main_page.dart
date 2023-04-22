import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(8.0), child: Column(children: [
        Text("Choose your value"),
        // ListView.builder(itemBuilder: itemBuilder)
      ],),),
    );
  }
}
