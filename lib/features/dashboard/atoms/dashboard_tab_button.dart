import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';

class DashboardTabButton extends ConsumerStatefulWidget {
  const DashboardTabButton({
    required this.e,
    required this.selected,
    super.key,
  });
  final AuthViewTab e;
  final bool selected;
  @override
  ConsumerState<DashboardTabButton> createState() => _DashboardTabButtonState();
}

class _DashboardTabButtonState extends ConsumerState<DashboardTabButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        ref.read(authPageControllerProvider.notifier).setCurrentTab(widget.e);
      },
      onHover: (value) {
        setState(() {
          hovering = value;
        });
      },
      buttonColor: Colors.black,
      border: Border.all(
        color: widget.selected ? Colors.white12 : Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.relative(15),
      ),
      child: Center(
        child: Text(
          widget.e.name,
          style: TextStyle(
            color: widget.selected ? Colors.white : Colors.white38,
            fontSize: context.relative(10),
            fontWeight: widget.selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
