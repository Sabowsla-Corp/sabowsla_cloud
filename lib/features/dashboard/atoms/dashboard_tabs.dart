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
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        itemCount: tabs.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) => const SizedBox(width: 5),
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
