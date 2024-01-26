import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_menu_bar.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_server/features/server/presentation/client_code_examples_card.dart';
import 'package:sabowsla_server/features/server/presentation/server_configuration_card.dart';

import 'package:sabowsla_server/features/server/presentation/server_logs_card.dart';
import 'package:sabowsla_server/features/server/presentation/server_web_view.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  var activeLeftTab = 'Logs';
  var activeRightTab = 'Examples';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DashboardLayoutTemplate(
          title: "Server",
          icon: FontAwesomeIcons.server,
          // ignore: use_colored_box
          child: Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: context.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomMenuBar(
                          values: const ["Logs", "Server"],
                          onChanged: (value) {
                            activeLeftTab = value;
                            setState(() {});
                          },
                          value: activeLeftTab,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (activeLeftTab == 'Logs') const ServerLogsCard(),
                        if (activeLeftTab == 'Server')
                          const Expanded(child: ServerWebView()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ServerConfigurationCard(),
                        SizedBox(height: 10),
                        ClientCodeExamplesCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
