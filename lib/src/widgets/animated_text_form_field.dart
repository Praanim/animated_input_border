import 'dart:ui';

import 'package:animated_text_field/src/models/animated_border_painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable text field widget with an animated border effect.
///
/// The `AnimatedTextField` enhances the standard `TextField` widget by adding
/// an animated border that responds to user interactions, such as focusing
/// or unfocusing. This widget supports customization of border color, width,
/// animation duration, and input decoration styles.
///
/// ### Features
/// - Animated border effect triggered by focus changes.
/// - Customizable border color, width, and animation duration.
/// - Fully supports `InputDecoration` for additional styling options.
/// - Ensures a consistent border radius of 8.0 for the animated border.
///
/// Note: User can pass styling of focusedBorder but its border is overriden by custom paint
/// thus border radius will always be 8.0
/// however other styling can be passed.
///
class AnimatedTextFormField extends StatefulWidget {
  /// Animation-specific properties
  ///
  /// Note: [borderColor] and [decoration.focusedBorder] both cannot have values at the same time
  /// Either one of them should be given certain [Color] value.
  ///
  /// [borderColor] is the color which gives animation effect when [focusNode] is focused
  /// [borderColor] takes value from [decoration.focusedBorder].
  ///  In case [decoration.focusedBorder] is null, only then [borderColor] is used
  ///
  final Color? borderColor;

  /// Width of the border for the animated effect
  ///
  /// Note: [borderWidth] and [decoration.focusedBorder] both cannot have values at the same time.
  /// Either one of them should be given a certain [double] value.
  ///
  /// First [borderWidth] takes its value from [decoration.focusedBorder].
  /// In case [decoration.focusedBorder] is null, only then [borderWidth] is used.
  ///
  final double? borderWidth;

  ///Animation duration
  ///
  final Duration animationDuration;

  /// TextFormField properties
  final Object groupId;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? forceErrorText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool onTapAlwaysCalled;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final UndoHistoryController? undoController;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final bool? cursorOpacityAnimates;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final DragStartBehavior dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final WidgetStatesController? statesController;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final bool canRequestFocus;

  const AnimatedTextFormField({
    super.key,
    this.borderColor,
    this.borderWidth,
    this.animationDuration = const Duration(milliseconds: 800),
    this.groupId = EditableText,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.forceErrorText,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.onAppPrivateCommand,
    this.cursorOpacityAnimates,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.contentInsertionConfiguration,
    this.statesController,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.canRequestFocus = true,
  });

  @override
  State<AnimatedTextFormField> createState() => _AnimatedTextFormFieldState();
}

class _AnimatedTextFormFieldState extends State<AnimatedTextFormField>
    with SingleTickerProviderStateMixin {
  // animation controller
  //
  late AnimationController _animationController;

  // effective focus node
  late FocusNode _focusNode;

  // effective input decoration
  InputDecoration? _inputDecoration;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _handleConflictingProperties();

    // applies consistent border
    _inputDecoration = _applyConsistentBorderStyle(widget.decoration);

    // triggers animation based on focus/unfocus
    _animateBorderOnFocusChange();
  }

  // Animate the border based on the focus state change
  void _animateBorderOnFocusChange() {
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
    );
  }

  // Apply consistent border style and radius to InputDecoration
  InputDecoration? _applyConsistentBorderStyle(
      InputDecoration? inputDecoration) {
    if (inputDecoration == null) return null;

    // Extract borders from the input decoration
    InputBorder? userBorder = inputDecoration.border;
    InputBorder? errorBorder = inputDecoration.errorBorder;
    InputBorder? enabledBorder = inputDecoration.enabledBorder;
    InputBorder? focusedBorder = inputDecoration.focusedBorder;
    InputBorder? disabledBorder = inputDecoration.disabledBorder;
    InputBorder? focusedErrorBorder = inputDecoration.focusedErrorBorder;

    // Consistent border radius
    final borderRadius8 = BorderRadius.circular(8.0);

    // Return the updated InputDecoration with consistent border styles
    return inputDecoration.copyWith(
      border: userBorder is OutlineInputBorder
          ? userBorder.copyWith(borderRadius: borderRadius8)
          : userBorder is UnderlineInputBorder
              ? userBorder.copyWith(borderRadius: borderRadius8)
              : userBorder,
      enabledBorder: enabledBorder is OutlineInputBorder
          ? enabledBorder.copyWith(borderRadius: borderRadius8)
          : enabledBorder is UnderlineInputBorder
              ? enabledBorder.copyWith(borderRadius: borderRadius8)
              : enabledBorder,
      focusedBorder: focusedBorder is OutlineInputBorder
          ? focusedBorder.copyWith(borderRadius: borderRadius8)
          : focusedBorder is UnderlineInputBorder
              ? focusedBorder.copyWith(borderRadius: borderRadius8)
              : focusedBorder,
      errorBorder: errorBorder is OutlineInputBorder
          ? errorBorder.copyWith(borderRadius: borderRadius8)
          : errorBorder is UnderlineInputBorder
              ? errorBorder.copyWith(borderRadius: borderRadius8)
              : errorBorder,
      disabledBorder: disabledBorder is OutlineInputBorder
          ? disabledBorder.copyWith(borderRadius: borderRadius8)
          : disabledBorder is UnderlineInputBorder
              ? disabledBorder.copyWith(borderRadius: borderRadius8)
              : disabledBorder,
      focusedErrorBorder: focusedErrorBorder is OutlineInputBorder
          ? focusedErrorBorder.copyWith(borderRadius: borderRadius8)
          : focusedErrorBorder is UnderlineInputBorder
              ? focusedErrorBorder.copyWith(borderRadius: borderRadius8)
              : focusedErrorBorder,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // child widget
    final textFormField = TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: _focusNode,
      decoration: _inputDecoration,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      cursorErrorColor: widget.cursorErrorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      autovalidateMode: widget.autovalidateMode,
      scrollController: widget.scrollController,
      restorationId: widget.restorationId,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      mouseCursor: widget.mouseCursor,
      contextMenuBuilder: widget.contextMenuBuilder,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
      undoController: widget.undoController,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      dragStartBehavior: widget.dragStartBehavior,
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      statesController: widget.statesController,
      clipBehavior: widget.clipBehavior,
      scribbleEnabled: widget.scribbleEnabled,
      canRequestFocus: widget.canRequestFocus,
      forceErrorText: widget.forceErrorText,
      groupId: widget.groupId,
      ignorePointers: widget.ignorePointers,
      onTapAlwaysCalled: widget.onTapAlwaysCalled,
    );

    return AnimatedBuilder(
        animation: _animationController,
        child: textFormField,
        builder: (context, child) {
          return CustomPaint(
              painter: AnimatedBorderPainter(
                animationValue: _animationController.value,
                borderColor:
                    widget.decoration?.focusedBorder?.borderSide.color ??
                        widget.borderColor,
                strokeWidth:
                    widget.decoration?.focusedBorder?.borderSide.width ??
                        widget.borderWidth,
              ),
              child: child);
        });
  }

  /// This method checks for conflicting properties between [borderColor], [borderWidth], and
  /// the respective values in [decoration.focusedBorder]. It prints a warning if both the
  /// properties are provided at the same time and informs the developer about which property
  /// takes priority.
  ///
  void _handleConflictingProperties() {
    final borderSide = widget.decoration?.focusedBorder?.borderSide;
    if (widget.borderColor != null && borderSide?.color != null) {
      debugPrint(
          'Warning: Both [borderColor] and [decoration.focusedBorder.borderSide.color] are provided. The latter will be prioritized.');
    }
    if (widget.borderWidth != null && borderSide?.width != null) {
      debugPrint(
          'Warning: Both [borderWidth] and [decoration.focusedBorder.borderSide.width] are provided. The latter will be prioritized.');
    }
  }
}
