import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/home/home_page_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homePageControllerProvider);
    return DashboardLayoutTemplate(
      title: "General",
      icon: FontAwesomeIcons.house,
      // ignore: use_colored_box
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              state.projectName,
              style: styles24.whiteBold,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: "Project Name",
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
