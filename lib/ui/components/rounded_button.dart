import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
        this.color,
      required this.child,
        required this.onPress,
      this.border,
      this.height,
      this.padding,
      this.tapColor,
      this.margin});

  final Color? color;
  final Widget child;
  final Function() onPress;
  final BoxBorder? border;
  final double? height;
  final EdgeInsets? padding, margin;
  final Color? tapColor;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onPress,
        onHover: (v) {},
        splashColor: tapColor ?? Colors.transparent,
        focusColor: tapColor ?? Colors.transparent,
        highlightColor: tapColor ?? Colors.transparent,
        hoverColor: tapColor ?? Colors.transparent,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          height: height ?? 56,
          decoration: BoxDecoration(
            color: color??Colors.blue.shade300,
            border: border??Border.all(color: Colors.blue.shade900),
            borderRadius: borderRadius,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
