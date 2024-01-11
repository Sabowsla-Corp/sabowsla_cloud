import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/constants/type_def.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_server/core/styles.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({
    required this.current,
    required this.total,
    this.onTap,
    super.key,
  });
  final int current;
  final int total;
  final Function(int)? onTap;

  static Widget withTitle({
    required String title,
    required int current,
    required int total,
    Function(int)? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(title, style: styles10.white30),
        ),
        const SizedBox(height: 2),
        CustomPagination(
          current: current,
          total: total,
          onTap: onTap,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton.previousButton(
          onTap: () {
            onTap?.call(current - 1);
          },
        ),
        const SizedBox(width: 5),
        Row(
          children: [
            for (var i = 1; i <= total; i++)
              CustomButton.box(
                margin: EI.only(right: i == total ? 0 : 5),
                buttonColor: Colors.black,
                size: 35,
                border: current == i ? Border.all(color: Colors.white12) : null,
                onTap: () {
                  onTap?.call(i);
                },
                child: Center(
                  child: Text(
                    i.toString(),
                    style: TextStyle(
                      color: current == i ? Colors.white : Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 5),
        CustomButton.nextButton(
          onTap: () {
            onTap?.call(current + 1);
          },
        ),
      ],
    );
  }
}
