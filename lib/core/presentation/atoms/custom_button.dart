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
  });
  final Function()? onTap;
  final Color? buttonColor;

  final String? buttonText;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
                : buttonText != null
                    ? Text(
                        buttonText ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
