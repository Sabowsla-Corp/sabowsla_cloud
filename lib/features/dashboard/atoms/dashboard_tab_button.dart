import 'package:flutter/material.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.selected
            ? Colors.white24
            : (hovering ? Colors.white12 : Colors.transparent),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onHover: (value) {
            setState(() {
              hovering = value;
            });
          },
          onTap: () {
            authController.currentTab.add(widget.e);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                widget.e.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight:
                      widget.selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
