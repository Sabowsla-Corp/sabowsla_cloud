import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_server/features/server/presentation/client_code_examples_card.dart';
import 'package:sabowsla_server/features/server/presentation/server_configuration_card.dart';

import 'package:sabowsla_server/features/server/presentation/server_logs_card.dart';
import 'package:sabowsla_server/features/server/presentation/server_web_view.dart';

class ServerPage extends StatelessWidget {
  const ServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardLayoutTemplate(
      title: "Server",
      icon: FontAwesomeIcons.server,
      // ignore: use_colored_box
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              children: [
                ServerConfigurationCard(),
                SizedBox(width: 4),
                ClientCodeExamplesCard(),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(child: ServerLogsCard()),
                ServerWebView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
