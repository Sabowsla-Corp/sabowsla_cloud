import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/extensions/enum_extensions.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button.dart';

class DashboardTabButton extends ConsumerStatefulWidget {
  const DashboardTabButton({
    required this.onTap,
    required this.selected,
    required this.value,
    this.fontSize,
    super.key,
  });
  final Function()? onTap;
  final bool selected;
  final Enum value;
  final double? fontSize;
  @override
  ConsumerState<DashboardTabButton> createState() => _DashboardTabButtonState();
}

class _DashboardTabButtonState extends ConsumerState<DashboardTabButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: widget.onTap,
      borderRadius: 5,
      onHover: (value) {
        setState(() {
          hovering = value;
        });
      },
      buttonColor: Colors.black,
      border: Border.all(
        color: widget.selected ? Colors.white12 : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      margin: EI.zero,
      child: Center(
        child: Text(
          widget.value.getName(),
          style: TextStyle(
            color: widget.selected ? Colors.white : Colors.white38,
            fontSize: widget.fontSize ?? 12,
            fontWeight: widget.selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
