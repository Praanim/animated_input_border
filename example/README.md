# Animated Text Form Field

A Flutter package to create customizable, animated `TextFormField` widgets with focus-based animations. This package allows you to animate the border color and width of text fields when focused, providing a smooth and dynamic user experience.

## Features

- **Focus-based animation**: The border color and width can be animated when the text field is focused.
- **Customizable**: Allows you to customize the border color, width, and animation duration in addition to existing properties of TextFormField.
- **Flexible styling**: You can provide custom decoration for the text field while ensuring that the animation properties are respected.
- **Automatic prioritization**: If both `borderColor` and `decoration.focusedBorder` are provided, the border color from `decoration.focusedBorder` takes precedence.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_text_form_field: # Replace with the latest version
```

Run the command get the dependency

```command
$ flutter pub get
```

Import it in your dart code, you can use

```dart
import 'package:animated_text_field/animated_text_field.dart';
```

## Usage 🤯
