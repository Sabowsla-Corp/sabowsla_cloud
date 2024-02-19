import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';

class DashBoardHomeView extends StatelessWidget {
  const DashBoardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayoutTemplate(
      title: 'Title',
      child: Container(
        color: Colors.black87,
        child: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
