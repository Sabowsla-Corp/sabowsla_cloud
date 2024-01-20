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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
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
