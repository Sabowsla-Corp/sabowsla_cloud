import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';

class DashboardTabButton extends StatefulWidget {
  const DashboardTabButton({
    required this.e,
    required this.selected,
    super.key,
  });
  final Enum e;
  final bool selected;
  @override
  State<DashboardTabButton> createState() => _DashboardTabButtonState();
}

class _DashboardTabButtonState extends State<DashboardTabButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        authController.currentTab.add(widget.e);
      },
      onHover: (value) {
        setState(() {
          hovering = value;
        });
      },
      buttonColor: Colors.black,
      border: Border.all(
        color: widget.selected ? Colors.white24 : Colors.transparent,
      ),
      child: Center(
        child: Text(
          widget.e.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.relative(12),
            fontWeight: widget.selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
