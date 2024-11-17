import 'package:animated_text_field/animated_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: AnimatedTextFormField(
          animationDuration: Duration(milliseconds: 2000),
          decoration: InputDecoration(
              hintText: "sddasd",
              labelText: 'ad',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
        )),
      ),
    );
  }
}
