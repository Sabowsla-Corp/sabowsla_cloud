import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.buttonText,
    super.key,
    this.onTap,
    this.buttonColor,
    this.padding,
    this.loading = false,
    this.margin,
    this.child,
    this.border,
    this.width,
    this.height,
    this.onHover,
    this.tooltip,
  });
  final Function()? onTap;
  final Color? buttonColor;
  final String? buttonText;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool loading;
  final Widget? child;
  final Border? border;
  final double? width;
  final double? height;
  final Function(bool)? onHover;
  final String? tooltip;

  static Widget box({
    double? size,
    Function()? onTap,
    Color? buttonColor,
    String? buttonText,
    Border? border,
    final Widget? child,
    final EdgeInsets? margin,
  }) {
    return CustomButton(
      margin: margin,
      buttonColor: buttonColor,
      onTap: onTap,
      buttonText: buttonText,
      width: size,
      border: border,
      height: size,
      child: child,
    );
  }

  static Widget previousButton({
    required Function() onTap,
  }) {
    return CustomButton(
      buttonColor: Colors.black,
      onTap: onTap,
      child: const Row(
        children: [
          Icon(
            Icons.chevron_left,
            size: 15,
          ),
          SizedBox(width: 5),
          Text("Previous"),
        ],
      ),
    );
  }

  static Widget nextButton({
    required Function() onTap,
  }) {
    return CustomButton(
      buttonColor: Colors.black,
      onTap: onTap,
      child: const Row(
        children: [
          Text("Next"),
          SizedBox(width: 5),
          Icon(
            Icons.chevron_right,
            size: 15,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5),
        border: border,
      ),
      child: Material(
        color: Colors.transparent,
        child: Tooltip(
          message: tooltip ?? '',
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: onTap,
            onHover: onHover,
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
              child: loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 2,
                          ),
                          width: 15,
                          height: 15,
                          child: const CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                            strokeWidth: 3,
                          ),
                        ),
                      ],
                    )
                  : buttonText != null
                      ? Text(
                          buttonText ?? '',
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : child ?? Container(),
            ),
          ),
        ),
      ),
    );
  }
}
