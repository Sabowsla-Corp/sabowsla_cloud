import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_server/features/server/presentation/server_configuration_card.dart';

class ServerPage extends StatelessWidget {
  const ServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardLayoutTemplate(
      title: "Server",
      icon: FontAwesomeIcons.server,
      // ignore: use_colored_box
      child: Row(
        children: [
          ServerConfigurationCard(),
        ],
      ),
    );
  }
}
