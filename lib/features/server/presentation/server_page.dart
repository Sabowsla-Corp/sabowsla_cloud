import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/server/presentation/organisms/client_code_examples_card.dart';
import 'package:sabowsla_cloud/features/server/presentation/organisms/server_configuration_card.dart';

import 'package:sabowsla_cloud/features/server/presentation/organisms/server_page_left_view.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        DashboardLayoutTemplate(
          title: "Server",
          icon: FontAwesomeIcons.server,
          // ignore: use_colored_box
          child: Padding(
            padding: EdgeInsets.only(left: 4, bottom: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServerPageLeftView(),
                SizedBox(width: 4),
                ServerPageRightView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ServerPageRightView extends StatelessWidget {
  const ServerPageRightView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ServerConfigurationCard(),
            SizedBox(height: 10),
            ClientCodeExamplesCard(),
          ],
        ),
      ),
    );
  }
}
