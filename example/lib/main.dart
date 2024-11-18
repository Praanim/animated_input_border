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
      title: 'Flutter Animated TextField',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated TextFormField Example'),
        backgroundColor: const Color.fromARGB(255, 101, 71, 152),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextFormField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide:
                          const BorderSide(color: Colors.amber, width: 2.0)),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.deepOrange))),
            ),
            AnimatedTextFormField(
              borderColor: Colors.deepOrange,
              borderWidth: 2.0,
              decoration: InputDecoration(border: InputBorder.none
                  // border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  ),
            ),
            //
            SizedBox(height: 20),
            //
            // Second AnimatedTextFormField
            //
            AnimatedTextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Enter your name",
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                ),
              ),
            ),
            //
            SizedBox(height: 20), // Space between the text fields
            //
            // Second AnimatedTextFormField
            AnimatedTextFormField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
