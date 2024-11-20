import 'package:animated_input_border/animated_input_border.dart';
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
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedInputBorderExample(),
          AnimatedInputFocusedBorderExample(),
        ],
      ),
    );
  }
}

class AnimatedInputBorderExample extends StatefulWidget {
  const AnimatedInputBorderExample({super.key});

  @override
  State<AnimatedInputBorderExample> createState() =>
      _AnimatedInputBorderExampleState();
}

class _AnimatedInputBorderExampleState extends State<AnimatedInputBorderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    // start animation as soon as the widget gets rendered
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return TextFormField(
              decoration: InputDecoration(
                  hintText: "Simple Border animation",
                  border: AnimatedInputBorder(
                    animationValue: _animationController.value,
                  )),
            );
          }),
    );
  }
}

// This example animates the focused border of a TextFormField using an AnimationController.
// The border dynamically changes its style (e.g., radius, width) when the input field gains or loses focus.

class AnimatedInputFocusedBorderExample extends StatefulWidget {
  const AnimatedInputFocusedBorderExample({super.key});

  @override
  State<AnimatedInputFocusedBorderExample> createState() =>
      _AnimatedInputFocusedBorderExampleState();
}

class _AnimatedInputFocusedBorderExampleState
    extends State<AnimatedInputFocusedBorderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationFocusedBorder;

  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    //focus node for focused border example
    focusNode = FocusNode();

    // animation controller for focused border example
    _animationFocusedBorder = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    // listener function for the animation when the border is focused.
    _animateBorderOnFocusChange();
  }

  // Animate the border based on the focus state change
  void _animateBorderOnFocusChange() {
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          _animationFocusedBorder.forward();
        } else {
          _animationFocusedBorder.value = 0.0;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationFocusedBorder.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animationFocusedBorder,
        builder: (context, child) {
          return TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
                label: const Text("Focused Border Animation"),
                border: const OutlineInputBorder(),
                focusedBorder: AnimatedInputBorder(
                    animationValue: _animationFocusedBorder.value,
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.deepPurple,
                    )),
                hintText: "Enter value"),
          );
        },
      ),
    );
  }
}
