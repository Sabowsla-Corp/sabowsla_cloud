import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({
    this.value = false,
    this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  Color color = Colors.grey.shade900.withOpacity(0.5);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          widget.onChanged?.call(!widget.value);
        },
        child: Container(
          width: 60,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade900.withOpacity(0.5),
            border: Border.all(
              color: Colors.grey.shade700.withOpacity(0.5),
            ),
          ),
          child: AnimatedAlign(
            onEnd: () {
              color = widget.value ? Colors.deepPurpleAccent : Colors.black54;
              setState(() {});
            },
            duration: Durations.medium1,
            alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedContainer(
              width: 30,
              height: 25,
              decoration: BoxDecoration(
                color: color,
                borderRadius: widget.value
                    ? const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
              ),
              duration: Durations.medium1,
              child: Center(
                child: Text(
                  widget.value ? "ON" : "OFF",
                  style: TextStyle(
                    color: widget.value ? Colors.white : Colors.white,
                    fontSize: context.relative(9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
