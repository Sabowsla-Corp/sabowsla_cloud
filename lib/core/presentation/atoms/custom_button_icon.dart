import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    this.buttonText,
    super.key,
    this.onTap,
    this.buttonColor,
    this.icon,
    this.padding,
    this.loading = false,
    this.iconSize = 20,
    this.iconColor,
    this.textStyle,
    this.radius,
  });
  final Function()? onTap;
  final Color? buttonColor;
  final IconData? icon;
  final String? buttonText;
  final EdgeInsets? padding;
  final bool loading;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? radius;

  static CustomButtonIcon transparent({
    required Function()? onTap,
    required IconData icon,
    Color? buttonColor,
    String? buttonText,
    EdgeInsets? padding,
    bool loading = false,
    double iconSize = 20,
    Color? iconColor,
    TextStyle? textStyle,
  }) =>
      CustomButtonIcon(
        onTap: onTap,
        icon: icon,
        buttonColor: buttonColor ?? Colors.transparent,
        buttonText: buttonText,
        padding: padding,
        loading: loading,
        iconSize: iconSize,
        iconColor: iconColor,
        textStyle: textStyle,
        radius: 100,
      );

  static CustomButtonIcon circular({
    required Function()? onTap,
    required IconData icon,
    Color? buttonColor,
    String? buttonText,
    EdgeInsets? padding,
    bool loading = false,
    double iconSize = 20,
    Color? iconColor,
    TextStyle? textStyle,
  }) =>
      CustomButtonIcon(
        onTap: onTap,
        icon: icon,
        buttonColor: buttonColor,
        buttonText: buttonText,
        padding: padding,
        loading: loading,
        iconSize: iconSize,
        iconColor: iconColor,
        textStyle: textStyle,
        radius: 100,
      );

  @override
  Widget build(BuildContext context) {
    Widget buildSpacer() {
      if (buttonText != null && icon != null) {
        return const SizedBox(width: 15);
      }
      return const SizedBox();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: buttonColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(radius ?? 5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 5),
          onTap: onTap,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
            child: loading
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: buttonText == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
                      buildSpacer(),
                      buttonText != null
                          ? Text(
                              buttonText ?? '',
                              maxLines: 1,
                              style: textStyle,
                            )
                          : const SizedBox(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonIconPickFile extends StatelessWidget {
  const CustomButtonIconPickFile({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.folder,
            ),
          ),
        ),
      ),
    );
  }
}
