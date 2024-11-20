# Animated Input Border

A Flutter package that provides a customizable, animated border for text fields, enhancing UI design with smooth transitions based on user interaction (e.g., focus or input changes)

## Key Features

> Animate text field borders when gaining or losing focus.
> Customizable border radius, width, and colors.
> Support for gap padding to accommodate floating labels or gaps.
> Smooth and visually appealing animations using an AnimationController.
> Seamless integration with TextFormField and InputDecoration.

## Getting Started 🔥

Begin by adding **NaxaAlert** as a dependency to your project.

```yaml
dependencies:
  naxa_alert: <latest_version>
```

Run the command get the dependency

```command
$ flutter pub get
```

Import it in your dart code, you can use

```dart
import 'package:naxa_alert/naxa_alert.dart';
```

To display alert use <code>NaxaAlert.show()</code> and define the <code>type</code> of alert.

```dart
NaxaAlert.show(
  context: context,
  type: NaxaAlertBoxType.success,
); // That's it. You can customize it with additional properties.
```

<div style="display: flex; gap: 10px;">
  <img src="Screenshot 2024-11-14 at 15.45.35.png" alt="alt text" width="200" height="200">
  <img src="Screenshot 2024-11-14 at 15.46.20.png" alt="alt text" width="200" height="200">
  <img src="Screenshot 2024-11-14 at 15.45.58.png" alt="alt text" width="200" height="200">
  <img src="Screenshot 2024-11-14 at 15.45.48.png" alt="alt text" width="200" height="200">
</div>

## Examples 🤫

There is a detailed example project in the <code>example</code> folder. You can directly run and play on it. There are code snippets from example project below.

> ### Success

```dart
NaxaAlert.show(
  context: context,
  type: NaxaAlertBoxType.success,
  text: 'Upload Completed Successfully!',
);
```

<br>

> ### Error

```dart
NaxaAlert.show(
  context: context,
  type: NaxaAlertBoxType.error,
  title: 'Oops...',
  text: 'Sorry, something went wrong',
);
```

<br>

> ### Warning

```dart
NaxaAlert.show(
 context: context,
 type: NaxaAlertBoxType.warning,
 text: 'Your internet connection is slow.',
);
```

<br>

> ### Info

```dart
NaxaAlert.show(
 context: context,
 type: NaxaAlertBoxType.info,
 text: 'Your app has an update.',
);
```

<br>

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
