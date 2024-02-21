import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/paddings.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_tab_button.dart';

class DashboardTabButtons extends StatelessWidget {
  const DashboardTabButtons({
    required this.tabs,
    required this.selected,
    this.onTabChange,
    super.key,
  });
  final List<dynamic> tabs;
  final Enum selected;
  final Function(Enum value)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: paddings.horizontalv0,
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
            value: tabs[s],
            onTap: () => onTabChange?.call(tabs[s]),
            selected: selected == tabs[s],
          );
        },
      ),
    );
  }
}
