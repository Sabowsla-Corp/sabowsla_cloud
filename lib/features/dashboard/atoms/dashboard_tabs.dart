import 'package:flutter/material.dart';

import 'package:sabowsla_server/features/dashboard/atoms/dashboard_tab_button.dart';

class DashboardTabButtons extends StatelessWidget {
  const DashboardTabButtons({
    required this.tabs,
    required this.selected,
    super.key,
  });
  final List<Enum> tabs;
  final Enum selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: tabs.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, s) {
          return DashboardTabButton(
            e: tabs[s],
            selected: selected == tabs[s],
          );
        },
      ),
    );
  }
}
