# Animated Input Border

A Flutter package that provides a customizable, animated border for text fields, enhancing UI design with smooth transitions based on user interaction (e.g., focus or input changes)

## Key Features

> Animate text field borders when gaining or losing focus.
> Customizable border radius, width, and colors.
> Support for gap padding to accommodate floating labels or gaps.
> Smooth and visually appealing animations using an AnimationController.
> Seamless integration with TextFormField and InputDecoration.

## Getting Started 🔥

Begin by adding **AnimatedInputBorder** as a dependency to your project.

```yaml
dependencies:
  animated_input_border: <latest_version>
```

Run the command get the dependency

```command
$ flutter pub get
```

Import it in your dart code, you can use

```dart
import 'package:animated_input_border/animated_input_border.dart';
```

```dart
TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
                label: const Text("Focused Border Animation"),
                border: const OutlineInputBorder(),
                focusedBorder: AnimatedInputBorder(
                    animationValue: _animationFocusedBorder.value, // Create animation controller .
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.deepPurple,
                    )),
                hintText: "Enter value"),
          );
```

<br>

![](https://raw.githubusercontent.com/Praanim/animated_input_border/refs/heads/main/focused_border_animation.gif)

## Other Examples 🤯

There is a scaled animation.Developers can try it . Here is the code snippet.

```dart
TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: AnimatedInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.green,
                    )).scale(_animationFocusedBorder.value),
                hintText: "Enter value"),
          )
```

<br>

![](https://raw.githubusercontent.com/Praanim/animated_input_border/refs/heads/main/ScreenRecording2024-11-20at13.35.31-ezgif.com-video-to-gif-converter.gif)

## Contributions

Contributions, issues, and feature requests are welcome! Feel free to check out the [GitHub repo](https://github.com/Praanim/animated_input_border).

## Author

Developed with ❤️ by [Pranim S. Thakuri](https://www.linkedin.com/in/pranim-singh-thakuri-5382b7235/).
